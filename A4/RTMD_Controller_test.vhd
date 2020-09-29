--student name: ZHIJIE LAN
--student number: 201990309
--RTMD_Controller module

library ieee; 
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RTMD_Controller IS 
	PORT( Trigger, Reset, Clock : IN STD_LOGIC;
			Temp, DetNo, MaxRate, MaxTemp : STD_LOGIC_VECTOR (7 DOWNTO 0);
			RstAlarm, TxBusy : IN STD_LOGIC;
			TxWrite, Alarm : OUT STD_LOGIC;
			state, n_state, p: out std_logic_vector(2 downto 0);
			t : buffer boolean;
			TxData : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END RTMD_Controller; 

ARCHITECTURE design_RTMD OF RTMD_Controller IS

-- Declare temperature rate
shared variable TempRate: integer :=0;
-- Declare a state type
type state_type is (Initial, Normal_1, Normal_2, Alarm_1, Alarm_2);
-- Declare current and next state variables .
signal next_state, current_state: state_type := Initial ;

BEGIN
-- Process to next state
	process ( Clock, Trigger, RstAlarm)
	begin
		if Reset = '1' then
			Current_state <= Initial;
		elsif (Clock'event and Clock='1') then
				current_state <= next_state ;
		end if ;
	end process ;

	
-- record temp per second (every 32768 cycle) to determine Temp rate
	process ( Clock)
	variable cy, currentTemp, lastTemp  : integer := 0;
	begin
		if (Clock'event and Clock='1') then
				cy := cy + 1;
				
				if (cy = 32768) then 
					
						lastTemp := currentTemp;
						currentTemp := to_integer(unsigned(Temp));
						TempRate := currentTemp - lastTemp;
						cy:=0;
						
				end if;
		end if;
	end process ;

-- determine the next state
process ( current_state, Trigger, RstAlarm)
begin
--	t<=(next_state = Initial);
	case current_state is
		when Initial =>
			if (Trigger = '1') then
				p<="001";
				if (to_integer(unsigned(Temp)) <= to_integer(unsigned(MaxTemp)) 
					and TempRate <= to_integer(unsigned(MaxRate))) then
					-- both temp and rate are within limits
					p<="101";
					next_state <= Normal_1;
				else
					p<="110";
					next_state <= Alarm_1;
				end if;
			else
			p<="010";
				next_state <= Initial;
			end if ;

		-- directly go to next state
		when Normal_1 =>
				next_state <= Normal_2;
		when Normal_2 =>
				next_state <= Initial;
			
		-- loop in alarm_1 and alarm_2, until RstAlarm
		when Alarm_1 =>
				if (RstAlarm = '1') then
					next_state <= Initial ;
				else
					next_state <= Alarm_2;
				end if;
		when Alarm_2 =>
			if (RstAlarm = '1') then
				next_state <= Initial ;
			else
				next_state <= Alarm_1 ;
			end if ;
	end case ;
end process ;

-- Conditional assignments for outputs:
TxWrite <= '0' when ((TxBusy = '1') 
						or (Current_state = Initial) ) else '1';

Alarm <= '1' when (( current_state = Alarm_1 )
						or ( current_state = Alarm_2 ) ) else '0';						

TxData <= DetNo when (( current_state = Alarm_1 )
						or ( current_state = Normal_1 ) ) else
			 Temp	 when ( current_state = Normal_2 ) else
			 "11110000" when (current_state = Alarm_2) else 
			 "00000000";
			 
state <= "001"	when (Current_state = Initial ) else
			"010"	when (Current_state = Normal_1) else
			"011"	when (Current_state = Normal_2) else
			"100"	when (Current_state = Alarm_1) else
			"101"	when (Current_state = Alarm_2) else "111";
			
n_state <= "001"	when (next_state = Initial ) else
			"010"	when (next_state = Normal_1) else
			"011"	when (next_state = Normal_2) else
			"100"	when (next_state = Alarm_1) else
			"101"	when (next_state = Alarm_2) else "111";
			 
END design_RTMD ;
