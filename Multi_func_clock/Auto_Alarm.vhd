----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	Auto_Alarm - Behavioral
-- Project Name: 	timer_func
-- Target Devices: FPGA: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Auto_Alarm is
    Port ( clk25MHz : in  STD_LOGIC;
			  EnTeller : in  STD_LOGIC;
           start : in  STD_LOGIC;
           stop : out  STD_LOGIC);
end Auto_Alarm;

architecture Behavioral of Auto_Alarm is

signal start_int, stop_int, previous, st_int : std_logic := '0';
signal cnt : integer range 0 to 600 := 0;

begin

process (clk25MHz)
begin
	if rising_edge(clk25MHz) then
		if (EnTeller = '1') and (start = '1') then
			if cnt = 599 then 
				cnt <= 0;
				stop_int <= '1';
			else
				cnt <= cnt + 1;
				stop_int <= '0';
			end if;
		elsif start = '0' then
			cnt <= 0;
			stop_int <= '0';
		end if;
	end if;
end process;

stop <= stop_int;
			
end Behavioral;
