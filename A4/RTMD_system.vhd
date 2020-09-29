--student name: ZHIJIE LAN
--student number: 201990309
--RTMD_Controller module

library ieee; 
use ieee.std_logic_1164.all;

entity RTMD_system is
	port (CLK, RST, ResetAlarm, V5 : in std_logic;
			Temp, DetNo, MaxRate, MaxTemp : STD_LOGIC_VECTOR (7 DOWNTO 0);
			TxData, Alarm: out std_logic);
end RTMD_system;


ARCHITECTURE design_system OF RTMD_system is

component timer is -- timer module
	PORT ( Clk , Reset : in std_logic ;
			Pulse: out std_logic);
end component ;

component RTMD_Controller is -- controller module
	PORT( Trigger, Reset, Clock : IN STD_LOGIC;
			Temp, DetNo, MaxRate, MaxTemp : STD_LOGIC_VECTOR (7 DOWNTO 0);
			RstAlarm, TxBusy : IN STD_LOGIC;
			TxWrite, Alarm : OUT STD_LOGIC;
			TxData : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
end component ;

component TxSystemRTL is -- TxSystemRTL module
	PORT( clock, reset,odd_noteven, write_l : IN STD_LOGIC; 
			Datain : IN std_logic_vector (7 downto 0);
			busy, TxData : OUT STD_LOGIC
			); 
end component ;

-- internal signal, prodeced by each module
signal Pulse_Sig, Busy_sig, Write_sig : std_logic; 
signal Data_sig : std_logic_vector(7 downto 0);

begin

-- 
T0: timer port map (CLK, RST, Pulse_sig);

C0: RTMD_Controller port map (Pulse_sig, RST, CLK, 
										Temp, DetNo, MaxRate, MaxTemp, 
										ResetAlarm, Busy_sig, 
										Write_sig, Alarm,
										Data_sig);
									
R0: TxSystemRTL port map (CLK, RST, V5, Write_sig,
									Data_sig, Busy_sig, TxData);
	
end design_system;