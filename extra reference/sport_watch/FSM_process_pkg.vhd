----------------------------------------------------------------------------------
-- Company: HSN	
-- Engineer: Qinghui Liu , Zhili Shao, Joseph Fotso
-- 
-- Create Date:    14:27:31 02/24/2016 
-- Design Name: 
-- Module Name:    inside FSM process package for smtWatch 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

package FSM_process_pkg is

--main 5 moduls switch on/off enable states
	subtype MODULE_STATES is std_ulogic_vector (2 downto 0);
	constant UNKNOWN  		: MODULE_STATES := "000";
	constant CLOCK_MD			: MODULE_STATES := "001";
	constant ALARM_MD			: MODULE_STATES := "010";
	constant CALENDAR_MD		: MODULE_STATES := "011";	
	constant STOPWATCH_MD	: MODULE_STATES := "100";	
	constant TIMER_MD			: MODULE_STATES := "101";	

--7segment LCD blink flag							
--	type SSD_BLINK_STATE is (NO_BLINK, BL0, BL1, BL01, BL2, BL3, BL23, BLALL);
	subtype SSD_BLINK_STATE is std_ulogic_vector (2 downto 0); 
	constant NO_BLINK : SSD_BLINK_STATE := "000";
	constant BL0 		: SSD_BLINK_STATE := "001";
	constant BL1 		: SSD_BLINK_STATE := "010";
	constant BL01 		: SSD_BLINK_STATE := "011";
	constant BL2 		: SSD_BLINK_STATE := "100";
	constant BL3 		: SSD_BLINK_STATE := "101";
	constant BL23 		: SSD_BLINK_STATE := "110";
	constant BLALL 	: SSD_BLINK_STATE := "111";	
	
--stopwatch mode inside states declaration
	type STOPWATCH_STATE is (STOP, TIMING, PAULSE, LAP, STW_RESET);
--clock mode, inside states declaration
	type CLOCK_STATE is (CLOCK, SET_MIN, SET_HOUR, CLK_RESET);
--alarm mode, inside states declaration
	type ALARM_STATE is (READY, SET_MIN, SET_HOUR, ALARMING, CLEAN, ALM_RESET);
--timer mode, inside states declaration
	type TIMER_STATE is (READY, START, PAULSE, SET_MIN, SET_HOUR,TMR_ALARM, TMR_RESET);
	
--calendar mode, inside states declaration
	type CALENDAR_STATE is (CALENDAR, CLD_YEAR, CLD_DWK, 
									SET_DAY, SET_MON, SET_Y0,SET_Y1,SET_Y2,SET_Y3, SET_DWK, CLD_RESET);
	
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--
	procedure Clock_FSM(	  signal ckpr_state 	: in CLOCK_STATE;
								  signal event_btn1	: in STD_LOGIC;
								  signal blink_flag 	: out SSD_BLINK_STATE;
								  signal cknx_state	: out CLOCK_STATE) ;
								  
	procedure ALARM_FSM(	  signal alpr_state 	: in ALARM_STATE;
								  signal event_btn1	: in STD_LOGIC;
								  signal event_btn2	: in STD_LOGIC;
								  signal alarm_flag  : in STD_LOGIC;
								  signal blink_flag 	: out SSD_BLINK_STATE;
								  signal alnx_state	: out ALARM_STATE) ;

	procedure StopWatch_FSM( signal swpr_state 	: in STOPWATCH_STATE;
									 signal event_btn1	: in STD_LOGIC;
								    signal event_btn2	: in STD_LOGIC;
								    signal blink_flag 	: out SSD_BLINK_STATE;
								    signal swnx_state	: out STOPWATCH_STATE);	

							
	procedure Calendar_FSM(signal cdpr_state 	: in CALENDAR_STATE;
								  signal event_btn1	: in STD_LOGIC;
								  signal event_btn2 	: in STD_LOGIC;
								  signal blink_flag 	: out SSD_BLINK_STATE;
								  signal cdnx_state	: out CALENDAR_STATE);
								  
	procedure TIMER_FSM(	  signal tmpr_state 	: in TIMER_STATE;
								  signal event_btn1	: in STD_LOGIC;
								  signal event_btn2 	: in STD_LOGIC;
								  signal alarm_flag 	: in STD_LOGIC;
								  signal blink_flag 	: out SSD_BLINK_STATE;
								  signal tmnx_state	: out TIMER_STATE);
										 
	procedure SetValueByHoldBtn3( signal BtnHold_flag 	: in std_logic;	-- button holding signal
										  signal Pulse_100Hz		: in std_logic;	-- 100hz sample signal (0.01 s)
										  variable HTime_MAX		: inout natural;	-- 100 means 1 second	
										  variable hold_tm		: inout natural;	-- counter to calculate time
										  Constant Speedup_Level: in natural;	-- if not zero, will speedup increase
										  Constant Max_Value		: in natural;	
										  Constant Min_Value		: in natural;
										  signal outValue			: inout natural
										 );

end FSM_process_pkg;

package body FSM_process_pkg is

--timer mode, inside states declaration
--	type TIMER_STATE is (READY, START, PAULSE, SET_MIN, SET_HOUR,END_ALARM);
	procedure TIMER_FSM(	  signal tmpr_state 	: in TIMER_STATE;
								  signal event_btn1	: in STD_LOGIC;
								  signal event_btn2 	: in STD_LOGIC;
								  signal alarm_flag 	: in STD_LOGIC;
								  signal blink_flag 	: out SSD_BLINK_STATE;
								  signal tmnx_state	: out TIMER_STATE) is
	begin 
		tmnx_state <= tmpr_state;
		case tmpr_state is
			when READY => 	
				blink_flag <= NO_BLINK;
				if (event_btn1 = '1') then 
					tmnx_state <= START;
				elsif (event_btn2 = '1') then
					tmnx_state <= SET_MIN;
				elsif (alarm_flag = '1') then
					tmnx_state <= TMR_ALARM;
				else
					tmnx_state <= READY;
				end if;				

			when START => 	
				blink_flag <= NO_BLINK;
				if (event_btn1 = '1') then 
					tmnx_state <= PAULSE;	
				elsif (event_btn2 = '1') then
					tmnx_state <= READY;	
				elsif (alarm_flag = '1') then
					tmnx_state <= TMR_ALARM;
				else
					tmnx_state <= START;						
				end if;	

			when PAULSE => 	
				blink_flag <= BLALL;
				if (event_btn1 = '1') then 
					tmnx_state <= START;	
				elsif (event_btn2 = '1') then
					tmnx_state <= TMR_RESET;	
				elsif (alarm_flag = '1') then
					tmnx_state <= TMR_ALARM;
				else 
					tmnx_state <= PAULSE;						
				end if;						
			when SET_MIN => 
				blink_flag <= BL01;
				if (event_btn1 = '1') then 
					tmnx_state <= READY;
				elsif (event_btn2 = '1') then
					tmnx_state <= SET_HOUR;	
				else
					tmnx_state <= SET_MIN;
				end if;	
			when SET_HOUR => 
				blink_flag <= BL23;
				if (event_btn1 = '1') then 
					tmnx_state <= READY;	
				elsif (event_btn2 = '1') then
					tmnx_state <= SET_MIN;	
				else
					tmnx_state <= SET_HOUR;							
				end if;	
			when TMR_ALARM => 
				blink_flag <= BLALL;
				if (event_btn1 = '1' or 
					 event_btn2 = '1'	or 
					 alarm_flag = '0' ) then 
					tmnx_state <= READY;	
				else
					tmnx_state <= TMR_ALARM;
				end if;
			when TMR_RESET =>
				blink_flag <= NO_BLINK;
				if (event_btn1 = '1') then 
					tmnx_state <= READY;	
				elsif (event_btn2 = '1') then
					tmnx_state <= SET_MIN;						
				end if;							
			when others => 
				--blink_flag <= BLALL;
				blink_flag <= (others => '0');
				if (event_btn1 = '1' or event_btn2 = '1'	) then 
					tmnx_state <= READY;	
				end if;
		end case;		
	
	end;


-- calendar state machine transition process						  
	procedure Calendar_FSM(signal cdpr_state 	: in CALENDAR_STATE;
								  signal event_btn1	: in STD_LOGIC;
								  signal event_btn2 	: in STD_LOGIC;
								  signal blink_flag 	: out SSD_BLINK_STATE;
								  signal cdnx_state	: out CALENDAR_STATE) is
	begin
		cdnx_state <= cdpr_state;
		case cdpr_state is
			when CALENDAR => 	
				blink_flag <= NO_BLINK;
				if (event_btn1 = '1') then 
					cdnx_state <= CLD_YEAR;
				elsif (event_btn2 = '1') then
					cdnx_state <= SET_DAY;
				else 
					cdnx_state <= CALENDAR;
				end if;
			when CLD_YEAR => 	
				blink_flag <= NO_BLINK;
				if (event_btn1 = '1') then 
					cdnx_state <= CLD_DWK;	
				elsif (event_btn2 = '1') then
					cdnx_state <= SET_Y0;	
				else 
					cdnx_state <= CLD_YEAR;						
				end if;				
			when CLD_DWK => 	
				blink_flag <= NO_BLINK;
				if (event_btn1 = '1') then 
					cdnx_state <= CALENDAR;	
				elsif (event_btn2 = '1') then
					cdnx_state <= SET_DWK;
				else 
					cdnx_state <= CLD_DWK;							
				end if;						
			when SET_DAY => 
				blink_flag <= BL01;
				if (event_btn1 = '1') then 
					cdnx_state <= CALENDAR;
				elsif (event_btn2 = '1') then
					cdnx_state <= SET_MON;	
				else 
					cdnx_state <= SET_DAY;
				end if;	
			when SET_MON => 
				blink_flag <= BL23;
				if (event_btn1 = '1') then 
					cdnx_state <= CALENDAR;	
				elsif (event_btn2 = '1') then
					cdnx_state <= SET_DAY;	
				else 
					cdnx_state <= SET_MON;							
				end if;		
			when SET_Y0 => 
				blink_flag <= BL0;
				if (event_btn1 = '1') then
					cdnx_state <= CLD_YEAR;
				elsif (event_btn2 = '1') then
					cdnx_state <= SET_Y1;	
				else 
					cdnx_state <= SET_Y0;
				end if;		
			when SET_Y1 => 
				blink_flag <= BL1;
				if (event_btn1 = '1') then
					cdnx_state <= CLD_YEAR;
				elsif (event_btn2 = '1') then
					cdnx_state <= SET_Y2;	
				else 
					cdnx_state <= SET_Y1;
				end if;	
			when SET_Y2 => 
				blink_flag <= BL2;
				if (event_btn1 = '1') then
					cdnx_state <= CLD_YEAR;
				elsif (event_btn2 = '1') then
					cdnx_state <= SET_Y3;	
				else 
					cdnx_state <= SET_Y2;
				end if;	
			when SET_Y3 => 
				blink_flag <= BL3;
				if (event_btn1 = '1') then
					cdnx_state <= CLD_YEAR;
				elsif (event_btn2 = '1') then
					cdnx_state <= SET_Y0;	
				else 
					cdnx_state <= SET_Y3;
				end if;	
			when SET_DWK => 
				blink_flag <= BL0;
				if (event_btn1 = '1') then
					cdnx_state <= CLD_DWK;	
				else 
					cdnx_state <= SET_DWK;
				end if;							
			when others => 
				--blink_flag <= BLALL;
				blink_flag <= (others => '0');
				if (event_btn1 = '1' or event_btn2 = '1'	) then 
					cdnx_state <= CALENDAR;		
				end if;
		end case;		
	end;

-- Clock mode inside state machine transition process
	procedure Clock_FSM(	  signal ckpr_state 	: in CLOCK_STATE;
								  signal event_btn1	: in STD_LOGIC;
								  signal blink_flag 	: out SSD_BLINK_STATE;
								  signal cknx_state	: out CLOCK_STATE) is
	begin
		cknx_state <= ckpr_state;
		case ckpr_state is
			when CLOCK => 	
				blink_flag <= NO_BLINK;
				if (event_btn1 = '1') then 
					cknx_state <= SET_MIN;	
				else 
					cknx_state <= CLOCK;			
				end if;				
			when SET_MIN => 
				blink_flag <= BL01;
				if (event_btn1 = '1') then 
					cknx_state <= SET_HOUR;	
				else 
					cknx_state <= SET_MIN;								
				end if;	
			when SET_HOUR => 
				blink_flag <= BL23;
				if (event_btn1 = '1') then 
					cknx_state <= CLOCK;	
				else 
					cknx_state <= SET_HOUR;				
				end if;						
			when others => 	
				--blink_flag <= BLALL;
				blink_flag <= (others => '0');
				if (event_btn1 = '1') then 
					cknx_state <= CLOCK;	
				end if;
				
		end case;						
	end;

-- alarm mode 
--	type ALARM_STATE is (READY, SET_MIN, SET_HOUR, ALARMING, CLEAN);
	procedure ALARM_FSM(	  signal alpr_state 	: in ALARM_STATE;
								  signal event_btn1	: in STD_LOGIC;
								  signal event_btn2	: in STD_LOGIC;
								  signal alarm_flag  : in STD_LOGIC;
								  signal blink_flag 	: out SSD_BLINK_STATE;
								  signal alnx_state	: out ALARM_STATE) is
	begin
		alnx_state <= alpr_state;
		case alpr_state is
			when READY => 	
				blink_flag <= NO_BLINK;
				if (event_btn1 = '1') then 
					alnx_state <= SET_MIN;
				elsif (event_btn2 = '1') then
					alnx_state <= CLEAN;
				elsif (alarm_flag = '1') then
					alnx_state <= ALARMING;
				else
					alnx_state <= READY;
				end if;
			when SET_MIN => 	
				blink_flag <= BL01;
				if (event_btn1 = '1') then 
					alnx_state <= SET_HOUR;
				else
					alnx_state <= SET_MIN;
				end if;				
			when SET_HOUR => 	
				blink_flag <= BL23;
				if (event_btn1 = '1') then 
					alnx_state <= READY;	
				else
					alnx_state <= SET_HOUR;					
				end if;						
			when ALARMING => 
				blink_flag <= BLALL;
				if (event_btn1 = '1' or 
					 event_btn2 = '1' or 
					 alarm_flag = '0') then 
					alnx_state <= READY;
				else
					alnx_state <= ALARMING;						
				end if;	
			when CLEAN => 
				blink_flag <= NO_BLINK;
				if (event_btn1 = '1' or event_btn2 = '1') then 
					alnx_state <= READY;
				else
					alnx_state <= CLEAN;					
				end if;		
			when others => 
				--blink_flag <= BLALL;
				blink_flag <= (others => '0');
				if (event_btn1 = '1' or event_btn2 = '1') then 
					alnx_state <= READY;
				end if;
		end case;
	end;
-- stopwatch mode 
	procedure StopWatch_FSM( signal swpr_state 	: in STOPWATCH_STATE;
									 signal event_btn1	: in STD_LOGIC;
								    signal event_btn2	: in STD_LOGIC;
								    signal blink_flag 	: out SSD_BLINK_STATE;
								    signal swnx_state	: out STOPWATCH_STATE) is
	begin
		swnx_state <= swpr_state;
		case swpr_state is
			when STOP => 	
				blink_flag <= NO_BLINK;
				if (event_btn1 = '1') then 
					swnx_state <= TIMING;
				else
					swnx_state <= STOP;
				end if;				
			when TIMING => 
				blink_flag <= NO_BLINK;
				if (event_btn1 = '1') then 
					swnx_state <= PAULSE;
				elsif (event_btn2 = '1') then
					swnx_state <= LAP;
				else
					swnx_state <= TIMING;
				end if;	
			when PAULSE => 
				blink_flag <= BLALL;
				if (event_btn1 = '1') then 
					swnx_state <= TIMING;	
				elsif (event_btn2 = '1') then
					swnx_state <= STOP;
				else
					swnx_state <= PAULSE;						
				end if;		
			when LAP => 
				blink_flag <= BLALL;
				if (event_btn1 = '1' or event_btn2 = '1') then
					swnx_state <= TIMING;
				else
					swnx_state <= LAP;
				end if;							
			when others => 
				--blink_flag <= BLALL;
				blink_flag <= (others => '0');
				if (event_btn1 = '1' or event_btn2 = '1') then
					swnx_state <= STOP;
				end if;
		end case;				
	end;

	procedure SetValueByHoldBtn3( signal BtnHold_flag 	: in std_logic;	-- button holding signal
										  signal Pulse_100Hz		: in std_logic;	-- 100hz sample signal (0.01 s)
										  variable HTime_MAX		: inout natural;	-- 100 means 1 second	
										  variable hold_tm		: inout natural;	-- counter to calculate time
										  Constant Speedup_Level: in natural;	-- if not zero, will speedup increase
										  Constant Max_Value		: in natural;	
										  Constant Min_Value		: in natural;
										  signal outValue			: inout natural
										 ) is
	begin 
		if (BtnHold_flag = '1') then
			if (Pulse_100Hz = '1') then
				if hold_tm <  HTime_MAX then 
					hold_tm := hold_tm + 1;								
				else
					hold_tm := 0;
					
					if (outValue < Max_Value) then
						 outValue <= outValue + 1;
					else
						 outValue <= Min_Value;								
					end if;
					
					if (HTime_MAX > 20) then
						if (HTime_MAX > Speedup_Level) then
							HTime_MAX :=  HTime_MAX - Speedup_Level; -- speed up 0.1s/s
						end if;
					else
						HTime_MAX := 20;
					end if;														
				end if;
			end if;
		else
			 HTime_MAX := 100;
			 hold_tm := 0;
		end if;	
	end;	

end FSM_process_pkg;
