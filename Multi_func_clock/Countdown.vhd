----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	Countdown - Behavioral
-- Project Name: 	timer_func
-- Target Devices: FPGA: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Countdown is
    Port ( clk25MHz : in  STD_LOGIC;
			  clr : in STD_LOGIC;
           SEn : in  STD_LOGIC;
			  down : in STD_LOGIC;
           incS : in  STD_LOGIC;
			  incM : in  STD_LOGIC;
			  incU : in  STD_LOGIC;
           eS : out  STD_LOGIC_VECTOR (3 downto 0);
           tS : out  STD_LOGIC_VECTOR (3 downto 0);
           eM : out  STD_LOGIC_VECTOR (3 downto 0);
           tM : out  STD_LOGIC_VECTOR (3 downto 0);
           eU : out  STD_LOGIC_VECTOR (3 downto 0);
           tU : out  STD_LOGIC_VECTOR (3 downto 0);
			  Alarm : out STD_LOGIC
			  );
end Countdown;



architecture Behavioral of Countdown is

signal eS_v : integer range 0 to 9 := 0;
signal tS_v : integer range 0 to 6 := 0;
signal eM_v : integer range 0 to 9 := 0;
signal tM_v : integer range 0 to 6 := 0;
signal eU_v : integer range 0 to 9 := 0;
signal tU_v : integer range 0 to 6 := 0;
signal al_int, clr_int : std_logic := '0';

begin

process(clk25MHz)

	begin
		if rising_edge(clk25MHz) then
			
			if clr = '1' or clr_int = '1' then
				--Reset
				eS_v <= 0;
				tS_v <= 0;
				eM_v <= 0;
				tM_v <= 0;
				eU_v <= 0;
				tU_v <= 0;
				al_int <= '0';
			else
				--Reset niet ingedrukt
				if SEn = '1' then
					--if down = '1' then --Aftellen
						if (tS_v = 0) and (eS_V = 0) and (tM_v = 0) and (eM_V = 0) and (tU_v = 0) and (eU_v = 0) and SEn = '1' then -- Seconden
							al_int <= '1';
							clr_int <= '1';
						elsif (tS_v /= 0) and (eS_V = 0) then
							eS_v <= 9;
							tS_v <= tS_v - 1;
							al_int <= '0';
						elsif (tS_v = 0) and (eS_V = 0) and (eM_v /= 0) then
							eS_v <= 9;
							tS_v <= 5;
							eM_v <= eM_v - 1;
							al_int <= '0';
						elsif (tS_v = 0) and (eS_V = 0) and (tM_v /= 0) and (eM_V = 0) then
							eS_v <= 9;
							tS_v <= 5;
							eM_v <= 9;
							tM_v <= tM_v - 1;
							al_int <= '0';
						elsif (tS_v = 0) and (eS_V = 0) and (tM_v = 0) and (eM_V = 0) and (eU_v /= 0) then
							eS_v <= 9;
							tS_v <= 5;
							eM_v <= 9;
							tM_v <= 5;
							eU_v <= eU_v - 1;
							al_int <= '0';
						elsif (tS_v = 0) and (eS_V = 0) and (tM_v = 0) and (eM_V = 0) and (tU_v /= 0) and (eU_v = 0) then
							eS_v <= 9;
							tS_v <= 5;
							eM_v <= 9;
							tM_v <= 5;
							eU_v <= 9;
							tU_v <= tU_v - 1;
							al_int <= '0';
						else
							eS_v <= eS_v - 1;
							al_int <= '0';
						end if;
					--end if;
				end if;
			end if;
			if incS = '1' then	-- Seconden instellen
				al_int <= '0';
				clr_int <= '0';
				if down = '1' then
					if ((eS_v = 0) and (tS_v = 0)) then
						--Minimum bereikt
						-->Terug op max waarde zetten
						eS_v <= 9;
						tS_v <= 5;
					else
						--Minimum nog niet bereikt
						if (eS_v = 0) then
							--eenheden op 0, bv 10
							eS_v <= 9;
							tS_v <= tS_v -1;
						else
							--eenheden nog niet op 0, bv 18
							eS_v <= eS_v - 1;
						end if;
					end if;
				else 
					if ((eS_v = 9) and (tS_v = 5)) then
							--Maximum bereikt
							-->Terug op min waarde zetten
							eS_v <= 0;
							tS_v <= 0;
					else
						--Maximum nog niet bereikt
						if (tS_v = 5) then
							--Maximum tientallen bereikt
							eS_v <= eS_v + 1;
						else
							--Maximum tientallen nog niet bereikt
							if (eS_v = 9) then
								--9 eenheden bereikt
								eS_v <= 0;
								tS_v <= tS_v + 1; --Volgend tiental
							else
								--nog geen 9 eenheden bereikt -> e+1
								eS_v <= eS_v +1;
							end if;
						end if;
					end if;
				end if;
			end if;
					
			if incM = '1' then	-- Minuten instellen
				al_int <= '0';
				clr_int <= '0';
				if down = '1' then
					if ((eM_v = 0) and (tM_v = 0)) then
						--Minimum bereikt
						-->Terug op max waarde zetten
						eM_v <= 9;
						tM_v <= 5;
					else
						--Minimum nog niet bereikt
						if (eM_v = 0) then
							--eenheden op 0, bv 10
							eM_v <= 9;
							tM_v <= tM_v - 1;
						else
							--eenheden nog niet op 0, bv 18
							eM_v <= eM_v - 1;
						end if;
					end if;
				else 
					if ((eM_v = 9) and (tM_v = 5)) then
							--Maximum bereikt
							-->Terug op min waarde zetten
							eM_v <= 0;
							tM_v <= 0;
					else
						--Maximum nog niet bereikt
						
						if (tM_v = 5) then
							--Maximum tientallen bereikt
							eM_v <= eM_v + 1;
						else
							--Maximum tientallen nog niet bereikt
							if (eM_v = 9) then
								--9 eenheden bereikt
								eM_v <= 0;
								tM_v <= tM_v + 1; --Volgend tiental
							else
								--nog geen 9 eenheden bereikt -> e+1
								eM_v <= eM_v +1;
							end if;
						end if;
					end if;
				end if;
			end if;
					
			if incU = '1' then	-- Uren instellen
				al_int <= '0';
				clr_int <= '0';
				if down = '1' then
					if ((eU_v = 0) and (tU_v = 0)) then
						--Minimum bereikt
						-->Terug op max waarde zetten
						eU_v <= 3;
						tU_v <= 2;
					else
						--Minimum nog niet bereikt
						if (eU_v = 0) then
							--eenheden op 0, bv 10
							eU_v <= 9;
							tU_v <= tU_v -1;
						else
							--eenheden nog niet op 0, bv 18
							eU_v <= eU_v - 1;
						end if;
					end if;
				else 
					if ((eU_v = 3) and (tU_v = 2)) then
							--Maximum bereikt
							-->Terug op min waarde zetten
							eU_v <= 0;
							tU_v <= 0;
					else
						--Maximum nog niet bereikt
						
						if (tU_v = 2) then
							--Maximum tientallen bereikt
							eU_v <= eU_v + 1;
						else
							--Maximum tientallen nog niet bereikt
							if (eU_v = 9) then
								--9 eenheden bereikt
								eU_v <= 0;
								tU_v <= tU_v + 1; --Volgend tiental
							else
								--nog geen 9 eenheden bereikt -> e+1
								eU_v <= eU_v +1;
							end if;
						end if;
					end if;
				end if;
			end if;
		end if;
end process;

alarm <= al_int;
	
eS <= std_logic_vector(to_unsigned(eS_v,4));
tS <= std_logic_vector(to_unsigned(tS_v,4));
eM <= std_logic_vector(to_unsigned(eM_v,4));
tM <= std_logic_vector(to_unsigned(tM_v,4));
eU <= std_logic_vector(to_unsigned(eU_v,4));
tU <= std_logic_vector(to_unsigned(tU_v,4));

end Behavioral;
