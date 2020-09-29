----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    13:15:05 04/11/2012 
-- Module Name:    freeze - Behavioral 
-- Project Name: Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity c_freeze is
    Port ( clk25MHz : in  STD_LOGIC;
           freeze : in  STD_LOGIC;
           eH : in  STD_LOGIC_VECTOR (3 downto 0);
           tH : in  STD_LOGIC_VECTOR (3 downto 0);
           eS : in  STD_LOGIC_VECTOR (3 downto 0);
           tS : in  STD_LOGIC_VECTOR (3 downto 0);
           eM : in  STD_LOGIC_VECTOR (3 downto 0);
           tM : in  STD_LOGIC_VECTOR (3 downto 0);
           feH : out  STD_LOGIC_VECTOR (3 downto 0);
           ftH : out  STD_LOGIC_VECTOR (3 downto 0);
           feS : out  STD_LOGIC_VECTOR (3 downto 0);
           ftS : out  STD_LOGIC_VECTOR (3 downto 0);
           feM : out  STD_LOGIC_VECTOR (3 downto 0);
           ftM : out  STD_LOGIC_VECTOR (3 downto 0));
end c_freeze;


architecture Behavioral of c_freeze is

signal feH_int : std_logic_vector(3 downto 0) := "0000";
signal ftH_int : std_logic_vector(3 downto 0) := "0000";
signal feS_int : std_logic_vector(3 downto 0) := "0000";
signal ftS_int : std_logic_vector(3 downto 0) := "0000";
signal feM_int : std_logic_vector(3 downto 0) := "0000";
signal ftM_int : std_logic_vector(3 downto 0) := "0000";
begin

process(clk25MHz)
begin
if rising_edge(clk25MHz) then
	if freeze = '1' then
		feH_int <= eH;
		ftH_int <= tH;
		feS_int <= eS;
		ftS_int <= tS;
		feM_int <= eM;
		ftM_int <= tM;
	end if;
end if;
end process;

feH <= feH_int;
ftH <= ftH_int;
feS <= feS_int;
ftS <= ftS_int;
feM <= feM_int;
ftM <= ftM_int;

end Behavioral;

