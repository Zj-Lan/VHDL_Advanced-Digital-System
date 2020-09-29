----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	X28_31Counter - Structural
-- Project Name: 	date_func
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity X28_31Counter is
	generic ( e : integer := 2;
				 t : integer := 3);
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           down : in  STD_LOGIC;
			  SJ : in STD_LOGIC;
			  FEBR : in STD_LOGIC;
			  GM : in STD_LOGIC;
			  sel : in STD_LOGIC_VECTOR (1 downto 0);
           e_out : out  STD_LOGIC_VECTOR (3 downto 0);
           t_out : out  STD_LOGIC_VECTOR (3 downto 0);
           max : out  STD_LOGIC);
end X28_31Counter;

architecture Behavioral of X28_31Counter is

signal carry : std_logic := '0';
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
						if (GM = '0') and (FEBR = '1') and (SJ = '0') then
							--28
							e_v <= 8;
							t_v <= 2;
						elsif (GM = '0') and (FEBR = '1') and (SJ = '1') then
							--29
							e_v <= 9;
							t_v <= 2;
						elsif (GM = '0') and (FEBR = '0') then
							--30
							e_v <= 0;
							t_v <= 3;
						else
							--31
							e_v <= e - 1;
							t_v <= t;
						end if;
					else
						--Minimum nog niet bereikt
						if (e_v = 0) then
							--eenheden op 0, bv 10
							e_v <= 9;
							t_v <= t_v - 1;
						else
							--eenheden nog nie t op 0, bv 18
							e_v <= e_v - 1;
						end if;
					end if;	
				--eind aftellen
				
				else -- optellen
				
					if (e_v = 8) and (t_v = 2) and (GM = '0') and (FEBR = '1') and (SJ = '0') then
						--28, Maximum bereikt
						-->Terug op min waarde zetten
						e_v <= 1;
						t_v <= 0;
					elsif (e_v = 9) and (t_v = 2) and (GM = '0') and (FEBR = '1') and (SJ = '1') then
						--29, Maximum bereikt
						-->Terug op min waarde zetten
						e_v <= 1;
						t_v <= 0;
					elsif (e_v = 0) and (t_v = 3) and (GM = '0') and (FEBR = '0') then
						--30, Maximum bereikt
						-->Terug op min waarde zetten
						e_v <= 1;
						t_v <= 0;
					elsif (e_v = e - 1) and (t_v = t) and (GM = '1') and (FEBR = '0') then
						--31, Maximum bereikt
						-->Terug op min waarde zetten
						e_v <= 1;
						t_v <= 0;
					else
						--Maximum nog niet bereikt
						if ((GM = '0') and (FEBR = '1') and (t_v = t-1)) or ((FEBR = '0') and (t_v = t)) then
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
			
			--Carry-signaal
			if (GM = '0') and (FEBR = '1') and (SJ = '0') then
				--28 --> carry op 28
				if (t_v = t - 1) and (e_v = 8) then
					carry <= '1';
				else
					carry <= '0';
				end if;
			elsif (GM = '0') and (FEBR = '1') and (SJ = '1') then
				--29 --> carry op 29
				if (t_v = t - 1) and (e_v = 9) then
					carry <= '1';
				else
					carry <= '0';
				end if;
			elsif (GM = '0') and (FEBR = '0') then
				--30 --> carry op 30
				if (t_v = t) and (e_v = 0) then
					carry <= '1';
				else
					carry <= '0';
				end if;
			elsif (GM = '1') and (FEBR = '0') then
				--31 --> carry op 31
				if (t_v = t) and (e_v = 1) then
					carry <= '1';
				else
					carry <= '0';
				end if;
			else
				carry <= '0';
			end if;
			
			--Ongeldige status aanpassen:
			if sel = "00" then
				if (t_v = 3) and (GM = '0') and (FEBR = '1') and (SJ = '1') then
					--Voor Schrikkeljaar FEBR
					e_v <= 9;
					t_v <= 2;
				elsif ((t_v = 3) or ((t_v = 2) and (e_v = 9))) and (GM = '0') and (FEBR = '1') and (SJ = '0') then
					--Voor FEBR
					e_v <= 8;
					t_v <= 2;
				elsif ((t_v = 3) and (e_v = 1)) and (GM = '0') and (FEBR = '0') then
					--Voor Maand met 30 dagen
					e_v <= 0;
					t_v <= 3;
				end if;
			end if;
		end if; --eind rising edge	
end process;

max <= carry and en;
e_out <= std_logic_vector(to_unsigned(e_v,4));
t_out <= std_logic_vector(to_unsigned(t_v,4));

end Behavioral;