----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    12:56:55 04/11/2012 
-- Module Name:    c_besturing - Behavioral 
-- Project Name: Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity c_besturing is
    Port ( clk25MHz : in  STD_LOGIC;
			  clk100Hz : in STD_LOGIC;
           moden : in  STD_LOGIC;
           startstop : in  STD_LOGIC;
           freeze : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           en : out  STD_LOGIC;
           clr : out  STD_LOGIC;
           fze : out  STD_LOGIC);
end c_besturing;

architecture Behavioral of c_besturing is

signal en_int : std_logic := '0';
signal fze_int : std_logic := '0';
signal clr_int : std_logic := '0';
begin

process(clk25MHz)
begin
if rising_edge(clk25MHz) then

	if moden = '1' then --In het menu chronometer
		
		if startstop = '1' then
			en_int <= not en_int;
		end if;
		
		fze_int <= freeze;
		clr_int <= reset;
	else
		fze_int <= '0';
		clr_int <= '0';
	end if;
	
end if;
end process;


fze <= fze_int;
clr <= clr_int;
en <= en_int and clk100Hz;
end Behavioral;

