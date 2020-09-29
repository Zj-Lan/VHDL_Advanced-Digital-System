----------------------------------------------------------------------------------
-- Company: HSN	
-- Engineer: Group 4 (Qinghui Liu, Zhili Shao,  Joseph Fotso)
-- 
-- Create Date:    14:27:31 02/01/2016 
-- Design Name: 
-- Module Name:    inside FSM process for smtWatch 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ssd_pkg.all;
use work.FSM_process_pkg.all;

entity MD_Switch is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  envent_btn1 : in  STD_LOGIC;
			  cac_blink	  : in SSD_BLINK_STATE;
			  sw_blink    : in SSD_BLINK_STATE;
			  tm_blink    : in SSD_BLINK_STATE;
			  clock_alarm : in  STD_LOGIC;
			  timer_alarm : in  STD_LOGIC;
			  cr_modul 	  : out MODULE_STATES;
           blink_flag  : out SSD_BLINK_STATE );
end MD_Switch;

architecture Behavioral of MD_Switch is
	signal pr_modul, nx_modul : MODULE_STATES;
begin

	--lower section of state transitions process--
	process(clk, rst)
	begin	
		if(clk'EVENT and clk = '1') then
			if (rst = '1') then
				pr_modul <= UNKNOWN;
				cr_modul <= UNKNOWN;
			else 
				pr_modul <= nx_modul;
				cr_modul <= nx_modul;
			end if;
		end if;
	end process;

	process (pr_modul, envent_btn1, clock_alarm, timer_alarm, 
				cac_blink, tm_blink, sw_blink )
	begin
		--nx_modul <= pr_modul;
		case pr_modul is
			when UNKNOWN => 				
				if (envent_btn1 = '1' ) then 
					nx_modul <= CLOCK_MD;
					blink_flag <= cac_blink;
				elsif (clock_alarm = '1') then
					nx_modul<= ALARM_MD;
					blink_flag <= BLALL;
				elsif (timer_alarm = '1') then
					nx_modul<= TIMER_MD;
					blink_flag <= BLALL;	
				else 
					nx_modul <= UNKNOWN;	
					blink_flag <= BLALL;					
				end if;
			
			when CLOCK_MD =>							  
				if (envent_btn1 = '1' ) then 
					nx_modul <= ALARM_MD;
					blink_flag <= cac_blink;					
				elsif (clock_alarm = '1') then
					nx_modul<= ALARM_MD;
					blink_flag <= BLALL;
				elsif (timer_alarm = '1') then
					nx_modul<= TIMER_MD;
					blink_flag <= BLALL;	
				else 
					nx_modul <= CLOCK_MD;
					blink_flag <= cac_blink;
				end if;
						
			when ALARM_MD =>				
				if (envent_btn1 = '1' ) then 
					nx_modul <= CALENDAR_MD; 
					blink_flag <= cac_blink;
				elsif (clock_alarm = '1') then
					nx_modul <= ALARM_MD;
					blink_flag <= BLALL;
				elsif (timer_alarm = '1') then
					nx_modul<= TIMER_MD;
					blink_flag <= BLALL;	
				else 
					nx_modul <= ALARM_MD;
					blink_flag <= cac_blink;
				end if;

			when CALENDAR_MD =>
				if (envent_btn1 = '1' ) then 
					nx_modul <= STOPWATCH_MD; 
					blink_flag <= sw_blink;
				elsif (clock_alarm = '1') then
					nx_modul<= ALARM_MD;
					blink_flag <= BLALL;
				elsif (timer_alarm = '1') then
					nx_modul<= TIMER_MD;
					blink_flag <= BLALL;	
				else
					nx_modul <= CALENDAR_MD;
					blink_flag <= cac_blink;
				end if;
			
			when STOPWATCH_MD =>			
				if (envent_btn1 = '1' ) then 
					nx_modul <= TIMER_MD; 
					blink_flag <= tm_blink;	
				elsif (clock_alarm = '1') then
					nx_modul<= ALARM_MD;
					blink_flag <= BLALL;
				elsif (timer_alarm = '1') then
					nx_modul<= TIMER_MD;
					blink_flag <= BLALL;		
				else
					nx_modul <= STOPWATCH_MD;
					blink_flag <= sw_blink;	
				end if;	
						
			when TIMER_MD =>
				if (envent_btn1 = '1' ) then 
					nx_modul <= CLOCK_MD; 
					blink_flag <= cac_blink;
				elsif (clock_alarm = '1') then
					nx_modul<= ALARM_MD;
					blink_flag <= BLALL;
				elsif (timer_alarm = '1') then
					nx_modul<= TIMER_MD;
					blink_flag <= BLALL;	
				else
					nx_modul <= TIMER_MD; 
					blink_flag <= tm_blink;
				end if;		
			
			when others =>
				if (envent_btn1 = '1' ) then 
					nx_modul <= CLOCK_MD; 
					blink_flag <= cac_blink;
				elsif (clock_alarm = '1') then
					nx_modul<= ALARM_MD;
					blink_flag <= BLALL;
				elsif (timer_alarm = '1') then
					nx_modul<= TIMER_MD;
					blink_flag <= BLALL;		
				else
					nx_modul <= UNKNOWN; 
					blink_flag <= BLALL;
				end if;					
		end case;				
			
	end process;

end Behavioral;

