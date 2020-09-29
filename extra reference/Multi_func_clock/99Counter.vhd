----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:51:08 05/03/2012 
-- Design Name: 
-- Module Name:    99Counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity X99Counter is
	 generic ( e : integer := 9;
				  t : integer := 9);
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           down : in  STD_LOGIC;
           e_out : out  STD_LOGIC_VECTOR (3 downto 0);
           t_out : out  STD_LOGIC_VECTOR (3 downto 0));
end X99Counter;

architecture Behavioral of X99Counter is

signal e_v : integer range 0 to 9 := 0;
signal t_v : integer range 0 to t := 0;
begin

process(clk)

	begin
		if rising_edge(clk) then
			
			if en = '1' then
				--Teller mag tellen
				if down = '1' then --Aftellen
				
					if ((e_v = 0) and (t_v = 0))  then
						--Minimum bereikt
						-->Terug op max waarde zetten
						if (e = 0) then
							e_v <= 9;
							t_v <= t;
						else
							e_v <= e;
							t_v <= t;
						end if;
					else
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
				
					if (((e = 0) and (e_v = 9) and (t_v = t - 1)) or ((e /= 0) and (e_v = e) and (t_v = t))) then
						--Maximum bereikt
						-->Terug op min waarde zetten
						e_v <= 0;
						t_v <= 0;
					else
						--Maximum nog niet bereikt
						
						if ((e = 0) and (t_v = t-1)) or ((e /= 0) and (t_v = t)) then
							--Maximum tientallen bereikt
							e_v <= e_v + 1;
						else
							--Maximum tientallen nog niet bereikt
							if (e_v = 9) then
								--9 eenheden bereikt
								e_v <= 0;
								t_v <= t_v + 1; --Volgend tiental
							else
								--nog geen 9 eenheden bereikt -> e+1
								e_v <= e_v + 1;
							end if;
						end if;
					end if;				
				end if; --eind optellen
			end if; --eind enable
			
			
		end if; --eind rising edge	
end process;

	e_out <= std_logic_vector(to_unsigned(e_v,4));
	t_out <= std_logic_vector(to_unsigned(t_v,4));

end Behavioral;

