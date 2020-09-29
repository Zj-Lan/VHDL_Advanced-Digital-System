----------------------------------------------------------------------------------
-- Company: HSN	
-- Engineer: Group 4 (Qinghui Liu, Zhili Shao,  Joseph Fotso)
-- 
-- Create Date:    13:08:05 02/01/2016 
-- Design Name: 
-- Module Name:    inside FSM process for timer module 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use work.ssd_pkg.all;
use work.FSM_process_pkg.all;

entity Timer_Module is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  pr_modul 	 : in  MODULE_STATES;
           event_btn2 : in  STD_LOGIC;
           event_btn3 : in  STD_LOGIC;
			  hold_btn3  : in  STD_LOGIC;
			  tm_alarm : inout  STD_LOGIC;
           tm_blink : out  SSD_BLINK_STATE;			  
           tm_bcd : out  STD_LOGIC_VECTOR (31 downto 0));
end Timer_Module;

architecture Behavioral of Timer_Module is
	signal tmpr_state, tmnx_state : TIMER_STATE;
	signal hunSecPulse	: std_logic ;	-- 0.01 seconds pulse signal

	signal tmr_hh, hh: natural range 0 to 99; -- hours and timer hours setting
	signal tmr_mm, mm, ss: natural range 0 to 59; --timer minutes setting and seconds
	
	constant dp_ON  : std_logic := '0'; -- decimal point on/off
	constant dp_OFF : std_logic := '1';
	
begin
--lower section of state transitions process--
	process(clk, rst)
	begin	
		if(clk'EVENT and clk = '1') then
			if (rst = '1') then
				tmpr_state <= TMR_RESET;
			else 
				tmpr_state <= tmnx_state;
			end if;
		end if;
	end process;

--generate a pulse signal per 0.01 seconds for calculating time.
	process (clk, rst)
		variable counter, counter_next : natural := 0;
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				counter_next := 0;
			else
				counter := counter_next;
				counter_next := counter + 1;
				if (counter = 999999) then
					counter_next := 0;
					hunSecPulse <= '1';
				else
					hunSecPulse <= '0';
				end if;
			end if;
		end if;
	end process;
	
	-- when module enbaled, to change inside state by btn2,  
	-- provoking TIMER_FSM procedure, refer to FSM_process_pkg
	process (pr_modul,tmpr_state, event_btn2, event_btn3, tm_alarm, tmnx_state)
	begin 
		if (pr_modul = TIMER_MD) then
			TIMER_FSM( tmpr_state, event_btn2, event_btn3, tm_alarm, tm_blink, tmnx_state);
		else
			tmnx_state <= tmpr_state;
			tm_blink <= NO_BLINK;			
		end if;
	end process;

	process (clk, hunSecPulse, hh, mm, tmpr_state, hold_btn3)
		variable HOLDMAX : natural range 1 to 100 := 99; -- 100 x 0.01 seconds;
		variable hold_tm : natural range 0 to 100 := 0; 
		variable secNo : natural range 0 to 99 :=0 ; -- 1 second
		variable alarmCounter : natural range 0 to 49 := 0; -- wait for 50 sec to remove timer alarm 
	begin
		if rising_edge(clk) then	
			case tmpr_state is
				when READY =>	-- ready to start timer, assign users' setting to reg.
					secNo := 0;
					alarmCounter := 0;
					hh <= tmr_hh;
					mm <= tmr_mm;
					ss <= 0;
					tm_alarm <= '0';
				
				when START =>	-- start timer, and counter 1 sec then descrease the timer 
					if (hunSecPulse = '1') then						
						if (secNo = 99) then  secNo := 0;								
							if (ss > 0) then ss <= ss - 1;
							else 
								if (mm > 0) then	
									mm <= mm - 1;
									ss <= 59;
									if (mm < 39) then
										if (hh> 0) then
											hh <= hh - 1;	
											mm <= mm + 60;
										end if;
									end if;
								else 
									if (hh > 0) then
									   hh <= hh - 1;	
										mm <= 59;
										ss <= 59;
									else	-- timer end, generate an alarm
										if (alarmCounter = 0) then
											tm_alarm <= '1';	
										end if;
										
									end if;
								end if;							
							end if;							
						else
							secNo := secNo + 1;						
						end if;
					end if;				
				when PAULSE =>
					tm_alarm <= '0';
					secNo := 0;
					alarmCounter := 0;
					
				when SET_MIN => 
					if (pr_modul = TIMER_MD) then
						tm_alarm <= '0';
						alarmCounter := 0;
						SetValueByHoldBtn3(hold_btn3,hunSecPulse,
												 HOLDMAX, hold_tm, 20, 59, 0, tmr_mm);
					else
						HOLDMAX := 100;
						hold_tm := 0;
					end if;
											 
				when SET_HOUR => 
					if (pr_modul = TIMER_MD) then
						tm_alarm <= '0';
						alarmCounter := 0;
						SetValueByHoldBtn3(hold_btn3,hunSecPulse,
												 HOLDMAX, hold_tm, 10, 99, 0, tmr_hh);
					else
						HOLDMAX := 100;
						hold_tm := 0;	
					end if;
				when TMR_ALARM => 		
					if (tm_alarm = '1') then
						if (hunSecPulse = '1') then						
							if (secNo = 99) then
								secNo := 0;	
								if (alarmCounter = 49) then 
									tm_alarm <= '0';
									alarmCounter := 0;
								else
									alarmCounter := alarmCounter + 1; -- start to counter 50 seconds
								end if;
							else
								secNo := secNo + 1;
							end if;
							
						end if;
					else 
						secNo := 0;	
						alarmCounter := 0;
					end if;	
					
				when others =>
					secNo := 0;		
					alarmCounter := 0;
					tm_alarm <= '0';
					hh <= 0;
					mm <= 0;
					ss <= 0;
					tmr_hh <= 0;
					tmr_mm <= 0;
			end case;
		end if;			
	end process;

	-- produce proper output data for ssd according to different states.
	process (clk, pr_modul, tmpr_state, tmr_hh, tmr_mm)
		variable bcd_tm : std_logic_vector (15 downto 0);
	begin
			if (rising_edge(clk)) then
				if (pr_modul = TIMER_MD) then
					if (tmpr_state = SET_MIN or tmpr_state = SET_HOUR) then
					-- output timer setting data with format : HH.MM
						bcd_tm := Bin2BCD(tmr_mm);	
						tm_bcd(7 downto 0) <=  dp_OFF & BCD2ssd(bcd_tm(3 downto 0));
						tm_bcd(15 downto 8) <=  dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
						bcd_tm := Bin2BCD(tmr_hh);
						tm_bcd(23 downto 16) <= dp_ON & BCD2ssd(bcd_tm(3 downto 0));
						tm_bcd(31 downto 24) <= dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
					-- output start data of timer with HH.MM
					elsif (tmpr_state = READY) then
						bcd_tm := Bin2BCD(mm);	
						tm_bcd(7 downto 0) <=  dp_OFF & BCD2ssd(bcd_tm(3 downto 0));
						tm_bcd(15 downto 8) <=  dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
						bcd_tm := Bin2BCD(hh);
						tm_bcd(23 downto 16) <= dp_ON & BCD2ssd(bcd_tm(3 downto 0));
						tm_bcd(31 downto 24) <= dp_OFF & BCD2ssd(bcd_tm(7 downto 4));						
					else 
					-- output real time timer MM.SS
						bcd_tm := Bin2BCD(ss);	
						tm_bcd(7 downto 0)   <=  dp_OFF & BCD2ssd(bcd_tm(3 downto 0));
						tm_bcd(15 downto 8)  <=  dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
						bcd_tm := Bin2BCD(mm);
						tm_bcd(23 downto 16) <= dp_ON & BCD2ssd(bcd_tm(3 downto 0));
						tm_bcd(31 downto 24) <= dp_OFF & BCD2ssd(bcd_tm(7 downto 4));					
					end if;
				else
					tm_bcd <= (23 => dp_OFF, others => dp_ON);
				end if;
				
			end if;			
	end process;

end Behavioral;

