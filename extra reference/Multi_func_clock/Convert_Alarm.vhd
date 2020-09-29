----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	Convert_Alarm - Behavioral
-- Project Name: 	timer_func
-- Target Devices: FPGA: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Convert_Alarm is
    Port ( clk25MHz : in STD_LOGIC;
			  start : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           start_con : out  STD_LOGIC);
end Convert_Alarm;

architecture Behavioral of Convert_Alarm is

signal start_int, stop_int, previous : std_logic := '0';

begin

process (clk25MHz)
begin
	if rising_edge(clk25MHz) then
		if reset = '1' then
			start_int <= '0';
		else
			if start = '1' and previous = '0' then
				start_int <= not start_int;
				previous <= '1';
			elsif start = '0' then
				previous <= '0';
			end if;
		end if;
	end if;
end process;

start_con <= start_int;

end Behavioral;
