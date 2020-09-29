----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	4SchrikkeljaarCounter - Behavioral
-- Project Name: 	date_func
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity X4Counter is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           down : in  STD_LOGIC;
           SJaar : out  STD_LOGIC);
end X4Counter;

architecture Behavioral of X4Counter is

signal e_v : integer range 0 to 3 := 0;
signal SJ : std_logic := '1';
begin

	process(clk)
		begin
			if rising_edge(clk) then
				if en = '1' then
					--Teller mag tellen
					if down = '1' then --Aftellen
					
						if (e_v = 0) then
							--Minimum bereikt
							-->Terug op max waarde zetten
							e_v <= 3;
							SJ <= '0';
						elsif (e_v = 1) then
							--Minimum nog niet bereikt
							e_v <= e_v - 1;
							SJ <= '1'; --SJaar-signaal, één bij een schrikkeljaar.
						else
							--Minimum nog niet bereikt
							e_v <= e_v - 1;
							SJ <= '0';
						end if;	
					--eind aftellen
					
					else -- optellen
					
						if (e_v = 3) then
							--Maximum bereikt
							-->Terug op min waarde zetten
							e_v <= 0;
							SJ <= '1'; --SJaar-signaal, één bij een schrikkeljaar.
						else
							--Maximum nog niet bereikt
							e_v <= e_v + 1;
							SJ <= '0';	
						end if;				
					end if; --eind optellen
				end if; --eind enable
				
				
			end if; -- Einde rising edge
		Sjaar <= SJ;
			
	end process;

end Behavioral;

