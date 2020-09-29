----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	Besturing - Behavioral
-- Project Name: 	date_func
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BesturingDatF is
    Port ( klok25MHz : in STD_LOGIC;
			  DagEn : in STD_LOGIC;			  
			  MaandEn : in STD_LOGIC;
			  JaarEn : in STD_LOGIC;
			  inc : in STD_LOGIC;
			  dec : in STD_LOGIC;
			  sel : in  STD_LOGIC_VECTOR (1 downto 0);
			  d_DagEn : out STD_LOGIC;
			  d_MaandEn : out STD_LOGIC;
			  d_JaarEn : out STD_LOGIC;
			  d_down : out STD_LOGIC	  
			  );
end BesturingDatF;

architecture Behavioral of BesturingDatF is


signal d_DEn_int : std_logic := '0';
signal d_MEn_int : std_logic := '0';
signal d_JEn_int : std_logic := '0';
signal d_down_int : std_logic := '0';

begin

process(klok25MHz)
begin

	if rising_edge(klok25MHz) then
		
		
		if (sel = "00") then --Niet aan het instellen
			d_DEn_int <= DagEn;
			d_MEn_int <= MaandEn;
			d_JEn_int <= JaarEn;
			d_down_int <= '0';
			
		elsif (sel = "01") then --Dagen aan het instellen
			d_DEn_int <= (inc or dec);
			d_MEn_int <= '0';
			d_JEn_int <= '0';
			d_down_int <= dec;		
		
		elsif (sel = "10") then --Maanden aan het instellen
			d_DEn_int <= '0';
			d_MEn_int <= (inc or dec);
			d_JEn_int <= '0';
			d_down_int <= dec;
		
		else --Jaren aan het instellen
			d_DEn_int <= '0';
			d_MEn_int <= '0';
			d_JEn_int <= (inc or dec);
			d_down_int <= dec;
		
		end if;
	end if;

	d_DagEn <= d_DEn_int;
	d_MaandEn <= d_MEn_int;
	d_JaarEn <= d_JEn_int;
	d_down <= d_down_int;

	
end process;
end Behavioral;
