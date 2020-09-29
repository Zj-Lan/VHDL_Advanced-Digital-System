----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	BesturinTiF - Behavioral
-- Project Name: 	timer_func
-- Target Devices: FPGA: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BesturingTiF is
    Port (  sel : in STD_LOGIC_VECTOR (1 downto 0);
				moden : in STD_LOGIC;
			   clk25MHz : in  STD_LOGIC;
				clk1Hz : in STD_LOGIC;
				inc : in STD_LOGIC;
				dec: in STD_LOGIC;
				SEn : out STD_LOGIC;
				Ti_sEn : out STD_LOGIC;
				Ti_mEn : out STD_LOGIC;
				Ti_uEn : out STD_LOGIC;
				Ti_down : out STD_LOGIC;
				Ti_clr : out STD_LOGIC
				);
end BesturingTiF;

architecture Behavioral of BesturingTiF is

signal SEn_int : std_logic := '0';
signal Ti_sEn_int : std_logic := '0';
signal Ti_mEn_int : std_logic := '0';
signal Ti_uEn_int : std_logic := '0';

signal Ti_down_int : std_logic := '1';
signal Ti_clr_int : std_logic := '0';

signal start_stop_int, previous_ss : std_logic := '0';

begin

process(clk25MHz)
begin

	if rising_edge(clk25MHz) then
		
		if (sel = "00") then --Niet aan het instellen
			SEn_int <= clk1Hz and start_stop_int;
			Ti_sEn_int <= '0';
			Ti_mEn_int <= '0';
			Ti_uEn_int <= '0';
			
			Ti_down_int <= '1';
			Ti_clr_int <= '0';
			if (inc = '1') and (previous_ss = '0') and (moden = '1') then -- Start/Stop Aftellen
				start_stop_int <= not start_stop_int;
				previous_ss <= '1';
			elsif inc = '0' then
				previous_ss <= '0';
			end if;
			
		elsif (sel = "01") then --Uren aan het instellen
			SEn_int <= '0';
			Ti_sEn_int <= '0';
			Ti_mEn_int <= '0';
			Ti_uEn_int <= (inc or dec);
			
			Ti_down_int <= dec;
			Ti_clr_int <= '0';			
		
		elsif (sel = "10") then --Minuten aan het instellen
			SEn_int <= '0';
			Ti_sEn_int <= '0';
			Ti_mEn_int <= (inc or dec);
			Ti_uEn_int <= '0';
			
			Ti_down_int <= dec;
			Ti_clr_int <= '0';
		
		else --Seconden aan het instellen
			SEn_int <= '0';
			Ti_sEn_int <= (inc or dec);
			Ti_mEn_int <= '0';
			Ti_uEn_int <= '0';
			
			Ti_down_int <= dec;
			Ti_clr_int <= '0';
		
		end if;
	end if;

	SEn <= SEn_int;
	Ti_sEn <= Ti_sEn_int;
	Ti_mEn <= Ti_mEn_int;
	Ti_uEn <= Ti_uEn_int;
	Ti_down <= Ti_down_int;
	Ti_clr <= Ti_clr_int;

	
end process;
end Behavioral;

