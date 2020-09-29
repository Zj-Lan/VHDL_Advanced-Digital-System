----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    08:50:44 02/28/2012 
-- Module Name:    nnCounter - Behavioral 
-- Project Name: 	 Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nnCounter is
	 generic ( e : integer := 4;
				  t : integer := 2);
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           down : in  STD_LOGIC;
           e_out : out  STD_LOGIC_VECTOR (3 downto 0);
           t_out : out  STD_LOGIC_VECTOR (3 downto 0);
           max : out  STD_LOGIC);
end nnCounter;

architecture Behavioral of nnCounter is

signal carry : std_logic := '0';
signal e_v : integer range 0 to 9 := 0;
signal t_v : integer range 0 to t := 0;
begin

process(clk)

	begin
		if rising_edge(clk) then
			
			if clr = '1' then
				--Reset
				e_v <= 0;
				t_v <= 0;
				
			else
				--Reset niet ingedrukt
				if en = '1' then
					--Teller mag tellen
					if down = '1' then --Aftellen
					
						if ((e_v = 0) and (t_v = 0)) then
							--Minimum bereikt
							-->Terug op max waarde zetten
							if (e = 0) then
								--bv 60 --> max = 59
								e_v <= 9;
								t_v <= t-1;
							else
								--bv 24 --> max = 23
								e_v <= e-1;
								t_v <= t;
							end if;
						else
							--Minimum nog niet bereikt
							if (e_v = 0) then
								--eenheden op 0, bv 10
								e_v <= 9;
								t_v <= t_v -1;
							else
								--eenheden nog niet op 0, bv 18
								e_v <= e_v -1;
							end if;
						end if;	
					--eind aftellen
					
					else -- optellen
					
						if (((e = 0) and (e_v = 9) and (t_v = t-1)) or ((e /= 0) and (e_v = e-1) and (t_v = t))) then
							--Maximum bereikt
							-->Terug op min waarde zetten
							e_v <= 0;
							t_v <= 0;
						else
							--Maximum nog niet bereikt
							
							if ((e = 0) and (t_v = t-1)) or ((e /= 0) and (t_v = t)) then
								--Maximum tientallen bereikt
								e_v <= e_v+1;
							else
								--Maximum tientallen nog niet bereikt
								if (e_v = 9) then
									--9 eenheden bereikt
									e_v <= 0;
									t_v <= t_v +1; --Volgend tiental
								else
									--nog geen 9 eenheden bereikt -> e+1
									e_v <= e_v +1;
								end if;
							end if;
						end if;				
					end if; --eind optellen
				end if; --eind enable
			end if; --eind clr

			
			--Carry-signaal
			if (e = 0) then
				--bv 60 --> carry op 58
				if (t_v = t-1) and (e_v = 8) then
					carry <= '1';
				else
					carry <= '0';
				end if;
			elsif (e = 1) then
				--bv 61 --> carry op 59
				if (t_v = t-1) and (e_v = 9) then
					carry <= '1';
				else
					carry <= '0';
				end if;
			else
				--bv 24 --> carry op 22
				if (t_v = t) and (e_v = e-2) then
					carry <= '1';
				else
					carry <= '0';
				end if;
			end if;
			
			
		end if; --eind rising edge	
end process;

max <= carry and en and not down;
e_out <= std_logic_vector(to_unsigned(e_v,4));
t_out <= std_logic_vector(to_unsigned(t_v,4));

end Behavioral;