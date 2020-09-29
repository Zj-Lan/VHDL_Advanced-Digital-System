----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	Alarm - Behavioral
-- Project Name: 	alarm_clock_func / timer_func
-- Target Devices: FPGA: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Alarm is
    Port ( klok25MHz : in  STD_LOGIC;
			  activatie : in  STD_LOGIC;
           deactivatie : in  STD_LOGIC;
			  deactivatie_out : in STD_LOGIC;
           alarm : out  STD_LOGIC
			  );
end Alarm;

architecture Behavioral of Alarm is

signal al, previous : std_logic := '0';

begin

process(klok25MHz)
begin
	if rising_edge(klok25MHz) then
		if (deactivatie = '1') or (deactivatie_out = '1') then
			al <= '0';
		else
			if (activatie = '1') and (previous = '0') then
				al <= not al;
				previous <= '1';
			elsif (activatie = '0') then
				previous <= '0';
			end if;
		end if;
	end if;
end process;

alarm <= al;

end Behavioral;