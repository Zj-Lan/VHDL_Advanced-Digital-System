----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	Besturing - Behavioral
-- Project Name: 	alarm_clock_func
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity BesturingWekF is
  Port (   klok25MHz : in STD_LOGIC;
			  klok4Hz : in STD_LOGIC;
			  inc : in STD_LOGIC;
			  dec : in STD_LOGIC;
			  sel : in  STD_LOGIC_VECTOR (1 downto 0);
			  w_MinEn : out STD_LOGIC;
			  w_UurEn : out STD_LOGIC;
			  w_down : out STD_LOGIC;
			  w_clr : out STD_LOGIC;
			  w_act : out STD_LOGIC
			  );
end BesturingWekF;

architecture Behavioral of BesturingWekF is

signal w_act_int : std_logic := '0';
signal w_MinEn_int : std_logic := '0';
signal w_UurEn_int : std_logic := '0';

signal w_down_int : std_logic := '0';
signal w_clr_int : std_logic := '0';
signal previous : std_logic := '0';

begin

process(klok25MHz)
begin

	if rising_edge(klok25MHz) then
		
		
		if (sel = "00") then --Niet aan het instellen
			w_MinEn_int <= '0';
			w_UurEn_int <= '0';
			
			w_down_int <= '0';
			w_clr_int <= '0';
			
		elsif (sel = "01") then --Uren aan het instellen
			w_MinEn_int <= '0';
			w_UurEn_int <= (inc or dec);
			
			w_down_int <= dec;
			w_clr_int <= '0';			
		
		elsif (sel = "10") then --Minuten aan het instellen
			w_MinEn_int <= (inc or dec);
			w_UurEn_int <= '0';

			w_down_int <= dec;
			w_clr_int <= '0';
		
		else --active of niet actief aan het instellen
			if ((inc = '1') or (dec = '1')) and (previous = '0') then
				w_act_int <= not w_act_int;
				previous <= '1';
			elsif ((inc = '0') or (dec = '0')) then
				previous <= '0';
			end if;
			w_MinEn_int <= '0';
			w_UurEn_int <= '0';

			w_down_int <= dec;
			w_clr_int <= '0';
		
		end if;
	end if;

	w_act <= w_act_int;
	w_MinEn <= w_MinEn_int;
	w_UurEn <= w_UurEn_int;

	w_down <= w_down_int;
	w_clr <= w_clr_int;

end process;
end Behavioral;
