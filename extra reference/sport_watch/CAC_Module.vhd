----------------------------------------------------------------------------------
-- Company: HSN	
-- Engineer: Qinghui Liu 
-- Create Date:    20:55:10 02/10/2016  
-- Design Name: 
-- Module Name:    CAC_Module - Behavioral 
-- Description: 
-- 	cac module includes 3 sub-mode, clock, alarm and canlendar mode, 
-- 	by press btn1 to change among them, and by press btn2 and btn3
--    change the nest-FSM upon individual sub-mode selected.
-- Revision: 
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use work.ssd_pkg.all;
use work.FSM_process_pkg.all;


entity CAC_Module is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           pr_modul 	 : in  MODULE_STATES;
           event_btn2 : in  STD_LOGIC;
           event_btn3 : in  STD_LOGIC;
			  hold_btn3  : in  STD_LOGIC;
			  alarm_flag  : inout  STD_LOGIC;
           cac_blink : out  SSD_BLINK_STATE;		  
           cac_bcd : out  STD_LOGIC_VECTOR (31 downto 0));
end CAC_Module;

architecture Behavioral of CAC_Module is
	signal ckpr_state, cknx_state : CLOCK_STATE;
	signal alpr_state, alnx_state : ALARM_STATE;
	signal cdpr_state, cdnx_state : CALENDAR_STATE;
	signal ck_blink, al_blink, cd_blink: SSD_BLINK_STATE;
	
	signal hh : natural range 0 to 23 := 0; -- hours
	signal mm, ss : natural range 0 to 59 := 0; -- minutes and seconds
	signal dd : natural range 1 to 31 := 1;	-- days
	signal mth : natural range 1 to 12 := 1; -- months
	signal dow : natural range 1 to 7 := 1; -- days of weeks
	signal yy : natural range 1600 to 9999 := 1600; -- years since 1600;
	signal alm_hh : natural range 0 to 23 :=0 ; -- clock alarm setting of hours
	signal alm_mm : natural range 0 to 23 := 0; -- clock alarm setting of minutes
	
	-- number of days in different months and years
	shared variable n_days : natural range 1 to 31 := 31; 
	
	signal hunSecPulse	: std_logic ;	-- 0.01 seconds pulse signal
	shared variable day_flag : std_logic := '0';
	shared variable day_temp : natural range 1 to 31 := 1;
	shared variable month_temp : natural range 1 to 12 := 1;
	shared variable year_temp : natural range 1600 to 9999 := 1600;
	shared variable daysw_temp : natural range 1 to 7 := 1;
	constant dp_ON  : std_logic := '0'; -- decimal point on/off
	constant dp_OFF : std_logic := '1';
	
begin
--lower section of state transitions process--
	process(clk, rst, pr_modul)
	begin	
		if(clk'EVENT and clk = '1') then
			if (rst = '1') then
				ckpr_state <= CLK_RESET;
				alpr_state <= ALM_RESET;
				cdpr_state <= CLD_RESET;
			else 
				ckpr_state <= cknx_state;
				alpr_state <= alnx_state;
				cdpr_state <= cdnx_state;
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
	
	-- when module activated, to change inside state by btn2 or btn3,  
	-- provoking CLOCK_FSM procedure, refer to FSM_process_pkg
	process (pr_modul,ckpr_state, event_btn2, ck_blink, cknx_state)
	begin 
		if (pr_modul = CLOCK_MD) then
			Clock_FSM( ckpr_state, event_btn2, ck_blink, cknx_state ); 
		else
			cknx_state <= ckpr_state;
			ck_blink <= NO_BLINK;			
		end if;
	end process;
 
	-- provoking ALARM_FSM procedure, refer to FSM_process_pkg
	process (pr_modul,alpr_state, event_btn2, event_btn3, alarm_flag, al_blink, alnx_state)
	begin 
		if (pr_modul = ALARM_MD) then
			ALARM_FSM( alpr_state, event_btn2, event_btn3, alarm_flag, al_blink, alnx_state);
		else
			alnx_state <= alpr_state;
			al_blink <= NO_BLINK;			
		end if;
	end process;

	-- provoking CANLENDAR_FSM procedure, refer to FSM_process_pkg
	process (pr_modul,cdpr_state, event_btn2, event_btn3, cd_blink, cdnx_state)
	begin 
		if (pr_modul = CALENDAR_MD) then
			Calendar_FSM(cdpr_state, event_btn2, event_btn3, cd_blink, cdnx_state);
		else
			cdnx_state <= cdpr_state;
			cd_blink <= NO_BLINK;			
		end if;
	end process;

	process (clk, pr_modul, alm_mm, alm_hh, mm, hh, dd, mth, yy) 
		variable bcd_tm : std_logic_vector (15 downto 0) := (others => '0');
		constant SSEG_a: std_logic_vector (6 downto 0):= "0001000"; -- a --
		constant SSEG_d: std_logic_vector (6 downto 0):= "1000010"; -- d --
	begin
			if (rising_edge(clk)) then
				case pr_modul is
					when CLOCK_MD =>
						bcd_tm := Bin2BCD(mm);	
						cac_bcd(7 downto 0)  <= dp_OFF & BCD2ssd(bcd_tm(3 downto 0));
						cac_bcd(15 downto 8) <=  dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
						bcd_tm := Bin2BCD(hh);
						cac_bcd(23 downto 16) <= dp_ON & BCD2ssd(bcd_tm(3 downto 0));
						cac_bcd(31 downto 24) <= dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
					
						cac_blink <= ck_blink;
						
					when ALARM_MD =>
						bcd_tm := Bin2BCD(alm_mm);	
						cac_bcd(7 downto 0)  <= dp_OFF & BCD2ssd(bcd_tm(3 downto 0));
						cac_bcd(15 downto 8) <=  dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
						bcd_tm := Bin2BCD(alm_hh);
						cac_bcd(23 downto 16) <= dp_ON & BCD2ssd(bcd_tm(3 downto 0));
						cac_bcd(31 downto 24) <= dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
					
						cac_blink <= al_blink;
						
					when CALENDAR_MD =>
						if (cdpr_state = CALENDAR or 
							 cdpr_state = SET_DAY  or 
							 cdpr_state = SET_MON  		) then
							bcd_tm := Bin2BCD(dd);
							cac_bcd(7 downto 0)  <= dp_OFF & BCD2ssd(bcd_tm(3 downto 0));
							cac_bcd(15 downto 8) <= dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
							
							bcd_tm := Bin2BCD(mth);
							cac_bcd(23 downto 16) <= dp_ON & BCD2ssd(bcd_tm(3 downto 0));
							cac_bcd(31 downto 24) <= dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
						elsif (cdpr_state = CLD_DWK or cdpr_state = SET_DWK ) then							
							bcd_tm := Bin2BCD(dow);							
							cac_bcd(7 downto 0)   <= dp_OFF & BCD2ssd(bcd_tm(3 downto 0));
							cac_bcd(15 downto 8)  <= dp_OFF & BCD2ssd(bcd_tm(7 downto 4));	
							cac_bcd(23 downto 16) <= dp_ON & SSEG_a;
							cac_bcd(31 downto 24) <= dp_OFF & SSEG_d;
						else 	 
							bcd_tm := Bin2BCD(yy);
							cac_bcd(7 downto 0)   <= dp_OFF & BCD2ssd(bcd_tm(3 downto 0));
							cac_bcd(15 downto 8)  <= dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
							cac_bcd(23 downto 16) <= dp_OFF & BCD2ssd(bcd_tm(11 downto 8));
							cac_bcd(31 downto 24) <= dp_OFF & BCD2ssd(bcd_tm(15 downto 12));				
						end if;						
						cac_blink <= cd_blink;						
					when others =>
						cac_bcd <= (others => dp_ON);
						cac_blink <= NO_BLINK;
				end case;

			end if;			
	end process;

--	type ALARM_STATE is (READY, SET_MIN, SET_HOUR, ALARMING, CLEAN);
	process (clk, hunSecPulse, pr_modul, alpr_state, hold_btn3)
		-- a delay counter for time counting in hundth seconds;
		variable HOLDMAX : natural range 1 to 100 := 99; -- 100 x 0.01 seconds;
		variable hold_tm : natural range 0 to 100 := 0; 
		variable secNo : natural range 0 to 99 := 0; -- 1 second
		variable alarmCounter : natural range 0 to 49 := 0; -- wait for 50 sec to remove alarm 
	begin
		if rising_edge(clk) then	
			case alpr_state is			
				when READY =>
					secNo := 0;
					alarmCounter := 0;
					alarm_flag <= '0';
					if (alm_hh = 0 and alm_mm = 0) then
						 alarm_flag <= '0';
					elsif (alm_hh = hh and alm_mm = mm and ss = 1) then
						 alarm_flag <= '1';
					end if;
					
				when SET_MIN =>
					if (pr_modul = ALARM_MD) then
						alarm_flag <= '0';
						SetValueByHoldBtn3(hold_btn3,hunSecPulse,
												 HOLDMAX, hold_tm, 20, 59,0,alm_mm);	
					else
						hold_tm := 0;							
						HOLDMAX := 100;
					end if;
					
				when SET_HOUR =>	
					if (pr_modul = ALARM_MD) then
						alarm_flag <= '0';
						SetValueByHoldBtn3(hold_btn3,hunSecPulse,
												 HOLDMAX, hold_tm, 10, 23, 0, alm_hh);
					else
						hold_tm := 0;	
						HOLDMAX := 100;					
					end if;
				
				when ALARMING =>
					if (alarm_flag = '1') then
						if (hunSecPulse = '1') then						
							if (secNo = 99) then
								 secNo := 0;	
								if (alarmCounter = 49) then -- wait for 50 seconds, auto remove alarm
									alarm_flag <= '0';
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
					
				when CLEAN =>
					alarm_flag <= '0';
					secNo := 0;
					alarmCounter := 0;
					hold_tm := 0;
					alm_hh <= 0;
					alm_mm <= 0;
					
				when others =>
					secNo := 0;
					alarmCounter := 0;
					hold_tm := 0;
					alarm_flag <= '0';	
					alm_hh <= 0;
					alm_mm <= 0;				
			end case;
		end if;
	end process;


-- process clock mode
	process (clk, hunSecPulse, pr_modul, ckpr_state, event_btn3)
		-- a delay counter for time counting in hundth seconds;
		variable HOLDMAX : natural range 1 to 100 := 99; -- 100 x 0.01 seconds;
		variable secNo : natural range 0 to 100 := 0; -- 60 seconds
		variable hold_tm : natural range 0 to 100 := 0; 
	begin
		if rising_edge(clk) then	
			case ckpr_state is			
				when CLOCK =>
					if (hunSecPulse = '1') then								
						if (secNo = 99) then
							secNo := 0;	
							day_flag := '0';
							
							day_temp := dd;
							daysw_temp := dow;
							month_temp := mth;
							year_temp := yy;
							n_days := nDays_In_Month(mth, yy);
							if (ss = 59) then ss <= 0;																			
								if (mm = 59) then	mm <= 0;									
									if (hh = 23 ) then hh <= 0;																				
										-- caculate days, months, days of weeks, and years
										if (day_temp < n_days) then
											day_temp := day_temp + 1;											
										else
											day_temp := 1;
											if (month_temp < 12) then
												month_temp := month_temp + 1;
											else 
												year_temp := year_temp + 1;	
												month_temp := 1 ;												
											end if;											
										end if;																			
										
										if (daysw_temp < 7) then 
											daysw_temp := daysw_temp + 1;
										else 
											daysw_temp := 1;
										end if;											
										
										day_flag := '1';
									else										
										hh <= hh + 1;	
									end if;
								else
									mm <= mm + 1;
								end if;
							else
								ss <= ss + 1;	
							end if;
						else
							secNo := secNo + 1;								
						end if;
					end if;
					
				when SET_MIN =>
				if (pr_modul = CLOCK_MD) then
					SetValueByHoldBtn3(hold_btn3,hunSecPulse,
											 HOLDMAX, hold_tm, 20, 59 , 0, mm);
				else
					hold_tm := 0;
					HOLDMAX := 100;						
				end if;
				
				when SET_HOUR =>	
				if (pr_modul = CLOCK_MD) then				
					SetValueByHoldBtn3(hold_btn3,hunSecPulse,
											 HOLDMAX, hold_tm, 10, 23, 0, hh);	
				else
					hold_tm := 0;
					HOLDMAX := 100;	
				end if;
				
				when others =>
					secNo := 0;
					ss <= 0;
					mm <= 0;
					hh	 <= 0;
			end case;
		end if;
	end process;
	
-- process calendar mode
	process (clk, hunSecPulse, pr_modul, hh, cdpr_state, hold_btn3)
		variable HOLDMAX : natural range 1 to 100 := 99; -- 100 x 0.01 seconds;
		variable hold_tm : natural range 0 to 100 := 0; 

	begin
		if rising_edge(clk) then
			case cdpr_state is				
				when CALENDAR | CLD_YEAR | CLD_DWK =>	
				   if (day_flag = '1') then
						if (hunSecPulse = '1') then 
							dd   <= day_temp;
							dow  <= daysw_temp;
							mth <= month_temp;
							yy  <= year_temp;
						end if;
					end if;
				when SET_DAY =>
				if (pr_modul = CALENDAR_MD) then
					SetValueByHoldBtn3(hold_btn3,hunSecPulse,
											 HOLDMAX, hold_tm, 10, 31,1, dd);
											
				else
					hold_tm := 0;
					HOLDMAX := 100;	
				end if;
				
				when SET_MON =>
				if (pr_modul = CALENDAR_MD) then
					SetValueByHoldBtn3(hold_btn3,hunSecPulse,
											 HOLDMAX, hold_tm, 0, 12, 1, mth);
				else
					hold_tm := 0;	
					HOLDMAX := 100;	
				end if;
				
				when SET_Y0 =>	
				if (pr_modul = CALENDAR_MD) then
					if (hold_btn3 = '1') then
						if (hunSecPulse = '1') then
							if hold_tm = HOLDMAX then
								hold_tm := 0;
								yy <= yy + 1;													
							else
								hold_tm := hold_tm + 1;
							end if;
						end if;
					else
						hold_tm := 0;
						HOLDMAX := 100;
						
					end if;
				else
					hold_tm := 0;
					HOLDMAX := 100;	
				end if;
				
				when SET_Y1 =>	
				if (pr_modul = CALENDAR_MD) then
					if (hold_btn3 = '1') then
						if (hunSecPulse = '1') then
							if hold_tm = HOLDMAX then
								hold_tm := 0;
								yy <= yy + 10;															
							else
								hold_tm := hold_tm + 1;
							end if;
						end if;
					else
						hold_tm := 0;
						HOLDMAX := 100;
					end if;
				else
					hold_tm := 0;	
					HOLDMAX := 100;	
				end if;
				
				when SET_Y2 =>	
				if (pr_modul = CALENDAR_MD) then
					if (hold_btn3 = '1') then
						if (hunSecPulse = '1') then
							if hold_tm = HOLDMAX then
								hold_tm := 0;
								yy <= yy + 100;															
							else
								hold_tm := hold_tm + 1;
							end if;
						end if;
					else
						hold_tm := 0;
						HOLDMAX := 100;
					end if;
				else
					hold_tm := 0;
					HOLDMAX := 100;	
				end if;
				
				when SET_Y3 =>	
				if (pr_modul = CALENDAR_MD) then
					if (hold_btn3 = '1') then
						if (hunSecPulse = '1') then
							if hold_tm = HOLDMAX then
								hold_tm := 0;
								yy <= yy + 1000;															
							else
								hold_tm := hold_tm + 1;
							end if;
						end if;
					else
						hold_tm := 0;
						HOLDMAX := 100;
					end if;
				else
					hold_tm := 0;
					HOLDMAX := 100;	
				end if;
				
				when SET_DWK =>
				if (pr_modul = CALENDAR_MD) then
					SetValueByHoldBtn3(hold_btn3,hunSecPulse,
											 HOLDMAX, hold_tm, 0, 7, 1, dow);
				else
					hold_tm := 0;
					HOLDMAX := 100;	
				end if;
				
				when CLD_RESET =>
					yy <= 1600;	
					mth <= 1;	
					dd <= 1; 
					dow <= 1;
					hold_tm := 0;
					HOLDMAX := 100;	
				
				when others =>	
					hold_tm := 0;
					HOLDMAX := 100;	
			end case;
			
		end if;
	end process;

end Behavioral;

