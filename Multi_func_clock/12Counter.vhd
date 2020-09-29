
----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	12Counter - Behavioral
-- Project Name: 	date_func
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity X12Counter is
generic ( e : integer := 3;
		    t : integer := 1);
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           down : in  STD_LOGIC;
           e_out : out  STD_LOGIC_VECTOR (3 downto 0);
           t_out : out  STD_LOGIC_VECTOR (3 downto 0);
           max : out  STD_LOGIC;
			  GM : out  STD_LOGIC;
			  FEBR : out  STD_LOGIC);
end X12Counter;

architecture Behavioral of X12Counter is

signal carry : std_logic := '0';
signal FEB : std_logic := '0';
signal GMaand : std_logic := '1';
signal e_v : integer range 0 to 9 := 1;
signal t_v : integer range 0 to t := 0;
begin

	process(clk)

	begin
		if rising_edge(clk) then
			
			if en = '1' then
				--Teller mag tellen
				if down = '1' then --Aftellen
				
					if ((e_v = 1) and (t_v = 0)) then
						--Minimum bereikt
						-->Terug op max waarde zetten
						e_v <= e - 1;
						t_v <= t;
						FEB <= '0';
						GMaand <= '1';
					elsif ((e_v = 3) and (t_v = 0)) then
						--Minimum nog niet bereikt
						e_v <= e_v - 1;
						FEB <= '1';
						GMaand <= '0';
					elsif ((t_v = 0) and ((e_v = 2) or (e_v = 4) or (e_v = 6) or (e_v = 8) or (e_v = 9))) then
						--Minimum nog niet bereikt
						e_v <= e_v - 1;
						FEB <= '0';
						GMaand <= '1';
					elsif ((t_v = 1) and (e_v = 1)) then
						--Minimum nog niet bereikt
						e_v <= e_v - 1;
						FEB <= '0';
						GMaand <= '1';
					else
						FEB <= '0';
						GMaand <= '0';
						--Minimum nog niet bereikt
						if (e_v = 0) then
							--eenheden op 0, bv 10
							e_v <= 9;
							t_v <= t_v - 1;
						else
							--eenheden nog niet op 0, bv 18
							e_v <= e_v - 1;
						end if;
					end if;	
				--eind aftellen
				
				else -- optellen
				
					--Carry-signaal
					if (t_v = t) and (e_v = e - 2) then
						carry <= '1';
					else
						carry <= '0';
					end if; -- Einde Carry
				
					if ((e_v = e - 1) and (t_v = t)) then
						--Maximum bereikt
						-->Terug op min waarde zetten
						e_v <= 1;
						t_v <= 0;
						FEB <= '0';
						GMaand <= '1';
					elsif ((e_v = 1) and (t_v = 0)) then
						--Maximum nog niet bereikt
						e_v <= e_v + 1;
						FEB <= '1';
						GMaand <= '0';
					elsif (t_v = 0) and ((e_v = 2) or (e_v = 4) or (e_v = 6) or (e_v = 7)) then
						--Maximum nog niet bereikt
						e_v <= e_v + 1;
						FEB <= '0';
						GMaand <= '1';
					elsif ((t_v = 1) and (e_v = 1)) then
						--Maximum nog niet bereikt
						e_v <= e_v + 1;
						FEB <= '0';
						GMaand <= '1';
					else
						FEB <= '0';
						--Maximum nog niet bereikt
						if (t_v = t) then
							--Maximum tientallen bereikt
							e_v <= e_v + 1;
							GMaand <= '0';
						else
							--Maximum tientallen nog niet bereikt
							if (e_v = 9) then
								--9 eenheden bereikt
								e_v <= 0;
								t_v <= t_v + 1; --Volgend tiental
								GMaand <= '1';
							else
								--nog geen 9 eenheden bereikt -> e+1
								e_v <= e_v + 1;
								GMaand <= '0';
							end if;
						end if;
					end if;				
				end if; --eind optellen
			end if; --eind enable
			
		end if; --eind rising edge	
	
	FEBR <= FEB;
	GM <= GMaand;
end process;

max <= carry and en;
	e_out <= std_logic_vector(to_unsigned(e_v,4));
	t_out <= std_logic_vector(to_unsigned(t_v,4));

end Behavioral;

