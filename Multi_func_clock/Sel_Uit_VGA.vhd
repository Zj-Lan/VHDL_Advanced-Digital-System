----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	Sel_Uit_VGA - Behavioral
-- Project Name: 	Weergave_Module
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sel_Uit_VGA is
    Port (  klok25MHz : in  STD_LOGIC;
				t_en : in STD_LOGIC; -- time enable from control
				d_en : in STD_LOGIC; -- date enable from control
				w_en : in STD_LOGIC; -- alarm_clock enable from control
				Ti_en : in STD_LOGIC; -- Timer enable from control
				cs_en : in STD_LOGIC; -- switch between chrono en lap time.
				c_en : in STD_LOGIC; -- Chrono enable from control
				SEL : out std_logic_vector(2 downto 0)
				);
end Sel_Uit_VGA;

architecture Behavioral of Sel_Uit_VGA is

signal selectie : std_logic_vector(2 downto 0):= "000" ;

begin

Process (klok25MHz)
	begin
		if rising_edge(klok25MHz) then
			if t_en = '1' and d_en = '0' and w_en = '0' and Ti_en = '0' and c_en = '0' then
				selectie <= "000";
			elsif t_en = '0' and d_en = '1' and w_en = '0' and Ti_en = '0' and c_en = '0' then
				selectie <= "001";
			elsif t_en = '0' and d_en = '0' and w_en = '1' and Ti_en = '0' and c_en = '0' then
				selectie <= "010";
			elsif t_en = '0' and d_en = '0' and w_en = '0' and Ti_en = '1' and c_en = '0' then
				selectie <= "011";	
			elsif t_en = '0' and d_en = '0' and w_en = '0' and Ti_en = '0' and c_en = '1' and cs_en = '0' then
				selectie <= "100";
			elsif t_en = '0' and d_en = '0' and w_en = '0' and Ti_en = '0' and c_en = '1' and cs_en = '1' then
				selectie <= "101";
			else
				selectie <= "000";
			end if;
		end if; -- End rising edge
	end process;
	
	SEL <= selectie;

end Behavioral;

