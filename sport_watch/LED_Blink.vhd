----------------------------------------------------------------------------------
-- Company: HSN	
-- Engineer: Group 4 (Qinghui Liu, Zhili Shao,  Joseph Fotso)
-- 
-- Create Date:    14:27:31 02/01/2016  
-- Design Name: 
-- Module Name:    led blink process for each module selected
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.FSM_process_pkg.all;

entity LED_Blink is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  pr_modul 	 : in  MODULE_STATES;
           blink_flag : in  SSD_BLINK_STATE;
           led_out : out  STD_ULOGIC_VECTOR (4 downto 0));
end LED_Blink;

architecture Behavioral of LED_Blink is
	signal CLK_1HZ: std_logic;
	signal CLK_1KHZ: std_logic;	
begin
	process (clk, rst)
		variable counter, counter_next, i : natural := 0;
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				counter_next := 0;
			else
				counter := counter_next;
				counter_next := counter + 1;
				if (counter = 999999) then
					counter_next := 0;				
					if (i = 99) then
						i := 0;
						CLK_1HZ <= not CLK_1HZ;
					else 
						i := i + 1;
					end if;
					CLK_1KHZ <= not CLK_1KHZ;
				end if;
			end if;
		end if;	
	end process;
	
	process (clk, CLK_1KHZ, CLK_1HZ, blink_flag)
	begin 
		if rising_edge(clk) then
			if (blink_flag = NO_BLINK) then
				if (CLK_1KHZ = '1') then
					case pr_modul is
						when CLOCK_MD =>		led_out <= "00001";
						when ALARM_MD =>		led_out <= "00010";					
						when CALENDAR_MD => 	led_out <= "00100";
						when STOPWATCH_MD => led_out <= "01000";
						when TIMER_MD =>		led_out <= "10000";
						when others  =>		led_out <= "00000";					
					end case;
					
				end if;
			else
				if (CLK_1HZ = '1') then
					case pr_modul is
						when CLOCK_MD =>		led_out <= "00001";
						when ALARM_MD =>		led_out <= "00010";					
						when CALENDAR_MD => 	led_out <= "00100";
						when STOPWATCH_MD => led_out <= "01000";
						when TIMER_MD =>		led_out <= "10000";
						when others  =>		led_out <= "00000";					
					end case;
				else
					led_out <= "00000";
				end if;				
			end if;
		end if;
	end process;
	
end Behavioral;

