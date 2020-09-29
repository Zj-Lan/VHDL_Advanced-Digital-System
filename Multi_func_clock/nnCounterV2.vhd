----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    08:50:44 02/28/2012 
-- Module Name:    nnCounterV2 - Behavioral 
-- Project Name: 	 Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nnCounterV2 is
	 generic ( i : integer := 10);
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           clr : in  STD_LOGIC := '0';
           down : in  STD_LOGIC := '0';
           max : out  STD_LOGIC);
end nnCounterV2;

architecture Behavioral of nnCounterV2 is

signal carry : std_logic := '0';
signal cnt : integer := 0;
begin

process(clk)

	begin
		if rising_edge(clk) then
	
		if clr = '1' then
			cnt <= 0;
		
		elsif en = '1' then
		
			if down = '0' then --optellen
			
				if cnt = i-1 then --maximumwaarde bereikt
					cnt <= 0;
				else --maximum nog niet bereikt
					cnt <= cnt + 1;
				end if;
			
			
			elsif down = '1' then --aftellen
			
				if cnt = 0 then --minimumwaarde bereikt
					cnt <= i-1; --terug op maximumtoestand zetten
				else
					cnt <= cnt - 1;
				end if;
			
			end if;
		
		end if;

			
			--carrysignaal
		if down = '0' then
			if cnt = i-1 then
				carry <= '1';
			else
				carry <= '0';
			end if;
		else
			if cnt = 0 then
				carry <= '1';
			else
				carry <= '0';
		end if;
			
			
		end if; --eind rising edge	
		end if;
end process;

max <= carry and en;

end Behavioral;