-- Company: HSN	
-- Engineer: Group 4 (Qinghui Liu, Zhili Shao,  Joseph Fotso)
-- 
-- Create Date:    017:49:31 01/31/2016
-- Design Name: 
-- Module Name:    inside FSM process for stopwatch module 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use work.ssd_pkg.all;
use work.FSM_process_pkg.all;

entity Swatch_Module is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  pr_modul 	 : in  MODULE_STATES;
           event_btn2 : in  STD_LOGIC;
           event_btn3 : in  STD_LOGIC;
           sw_blink : out  SSD_BLINK_STATE;
           sw_bcd : out  STD_LOGIC_VECTOR (31 downto 0));
end Swatch_Module;

architecture Behavioral of Swatch_Module is

	signal swpr_state, swnx_state : STOPWATCH_STATE;
	signal hunSecPulse	: std_logic ;	-- 0.01 seconds pulse signal

	signal timerHH : natural range 0 to 99;
	signal timerLL : natural range 0 to 59;
	constant dp_ON  : std_logic := '0';
	constant dp_OFF : std_logic := '1';
begin
--lower section of state transitions process--
	process(clk, rst)
	begin	
		if(clk'EVENT and clk = '1') then
			if (rst = '1') then
				swpr_state <= STW_RESET;
			else 
				swpr_state <= swnx_state;
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

	process (pr_modul, swpr_state, event_btn2, event_btn3, swnx_state)
	begin 
		if (pr_modul = STOPWATCH_MD) then
			StopWatch_FSM( swpr_state, event_btn2, event_btn3, sw_blink, swnx_state);
		else
			swnx_state <= swpr_state;
			sw_blink <= NO_BLINK;
		end if;
	end process;


-- process stopwatch mode
	process (clk, hunSecPulse, swpr_state)
		variable counter : natural range 0 to 9;
		variable lap_flag : std_logic := '0';
		
		variable tmr_tss : natural range 0 to 9;
		variable tmr_ss, tmr_min : natural range 0 to 59;
		variable tmr_hour : natural range 0 to 99;

	begin
		if rising_edge(clk) then
			case swpr_state is
				when STOP =>
					tmr_tss := 0;
					tmr_ss := 0;
					tmr_min := 0;
					tmr_hour := 0;
					timerHH <= 0;
					timerLL <= 0;					
					counter := 0;
					lap_flag := '0';
					
				when TIMING =>					
					if (hunSecPulse = '1') then
						if (counter = 9) then	counter := 0; 						
							if tmr_tss = 9 then	 tmr_tss := 0;							
								if tmr_ss = 59 then 	tmr_ss := 0;									
									if tmr_min = 59 then tmr_min := 0;
										tmr_hour:= tmr_hour + 1;
									else
										tmr_min := tmr_min + 1; 
									end if;									
								else
									tmr_ss := tmr_ss + 1; --1s
								end if;							
							else
								tmr_tss := tmr_tss + 1;	--0.1s
							end if;							
						else
							counter := counter + 1;
						end if;									
					else
						if tmr_hour > 0 then
							timerHH <= tmr_hour;
							timerLL <= tmr_min;
						elsif tmr_min > 0 then
							timerHH <= tmr_min;
							timerLL <= tmr_ss;						
						else
							timerHH <= tmr_ss;
							timerLL <= tmr_tss;							
						end if;
				
					end if;

				when PAULSE =>					
					if tmr_hour > 0 then
						timerHH <= tmr_hour;
						timerLL <= tmr_min;
					elsif tmr_min > 0 then
						timerHH <= tmr_min;
						timerLL <= tmr_ss;						
					else
						timerHH <= tmr_ss;
						timerLL <= tmr_tss;							
					end if;	

				when LAP =>					
					if (hunSecPulse = '1') then
						if counter = 9 then	counter := 0; 						
							if tmr_tss = 9 then	 tmr_tss := 0;							
								if tmr_ss = 59 then 	tmr_ss := 0;									
									if tmr_min = 59 then	tmr_min := 0;
										tmr_hour:= tmr_hour + 1;	-- 1 hours
									else
										tmr_min := tmr_min + 1; -- 1 minues
									end if;									
								else
									tmr_ss := tmr_ss + 1;--1 s
								end if;							
							else
								tmr_tss := tmr_tss + 1; --0.1 s
							end if;							
						else
							counter := counter + 1;
						end if;
					end if;
				
				when others =>
					tmr_tss := 0;
					tmr_ss := 0;
					tmr_min := 0;
					tmr_hour := 0;
					counter := 0;
					lap_flag := '0';		
				
			end case;
		end if;
	end process;

	process (clk, pr_modul, timerHH, timerLL)
		variable bcd_tm  : std_logic_vector (15 downto 0);
	begin
			if (rising_edge(clk)) then
				if (pr_modul = STOPWATCH_MD) then
					bcd_tm := Bin2BCD(timerLL);	
					sw_bcd(7 downto 0)   <= dp_OFF & BCD2ssd(bcd_tm(3 downto 0));
					sw_bcd(15 downto 8)  <= dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
					bcd_tm := Bin2BCD(timerHH);
					sw_bcd(23 downto 16) <= dp_ON & BCD2ssd(bcd_tm(3 downto 0));
					sw_bcd(31 downto 24) <= dp_OFF & BCD2ssd(bcd_tm(7 downto 4));
				else
					sw_bcd <= (23 => dp_OFF, others => dp_ON);
				end if;
			end if;			
	end process;

end Behavioral;

