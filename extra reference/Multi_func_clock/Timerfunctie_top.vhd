----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	timer_func - Structural
-- Target Devices: FPGA: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity timer_func is
    Port ( moden : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           inc : in  STD_LOGIC;
           dec : in  STD_LOGIC;
           clk1Hz : in  STD_LOGIC;
           clk25MHz : in  STD_LOGIC;
			  Aloff : in STD_LOGIC;
           TiSel : out  STD_LOGIC_VECTOR (1 downto 0);
           tS : out  STD_LOGIC_VECTOR (3 downto 0);
           eS : out  STD_LOGIC_VECTOR (3 downto 0);
           tM : out  STD_LOGIC_VECTOR (3 downto 0);
           eM : out  STD_LOGIC_VECTOR (3 downto 0);
           tU : out  STD_LOGIC_VECTOR (3 downto 0);
           eU : out  STD_LOGIC_VECTOR (3 downto 0);
			  TiAl : out STD_LOGIC);
end timer_func;


architecture Structural of timer_func is

COMPONENT selCtr
	PORT(
		clk25MHz : IN std_logic;
		moden : IN std_logic;
		sel : IN std_logic;          
		S : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
COMPONENT BesturingTiF
	PORT(
		sel : IN std_logic_vector(1 downto 0);
		moden : IN std_logic;
		clk25MHz : IN std_logic;
		clk1Hz : IN std_logic;
		inc : IN std_logic;
		dec : IN std_logic;         
		SEn : OUT std_logic;
		Ti_sEn : OUT std_logic;
		Ti_mEn : OUT std_logic;
		Ti_uEn : OUT std_logic;
		Ti_down : OUT std_logic;
		Ti_clr : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT Countdown
	PORT(
		clk25MHz : IN std_logic;
		clr : IN std_logic;
		SEn : IN std_logic;
		down : IN std_logic;
		incS : IN std_logic;
		incM : IN std_logic;
		incU : IN std_logic;          
		eS : OUT std_logic_vector(3 downto 0);
		tS : OUT std_logic_vector(3 downto 0);
		eM : OUT std_logic_vector(3 downto 0);
		tM : OUT std_logic_vector(3 downto 0);
		eU : OUT std_logic_vector(3 downto 0);
		tU : OUT std_logic_vector(3 downto 0);
		Alarm : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT Convert_Alarm
	PORT(
		clk25MHz : IN std_logic;
		start : IN std_logic;
		reset : IN std_logic;          
		start_con : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT Auto_Alarm
	PORT(
		clk25MHz : IN std_logic;
		EnTeller : IN std_logic;
		start : IN std_logic;         
		stop : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT Alarm
	PORT(
		klok25MHz : IN std_logic;
		activatie : IN std_logic;
		deactivatie : IN std_logic;
		deactivatie_out : IN std_logic;          
		alarm : OUT std_logic
		);
	END COMPONENT;
	
	signal TiSel_int : std_logic_vector(1 downto 0) := "00";
	signal Ti_sEn_int, Ti_mEn_int, Ti_uEn_int, Ti_down_int, Ti_clr_int, SEn_int : std_logic;
	signal alarm_act_int, alarm_act_con_int, alarm_off_int : std_logic;

begin

Inst_selCtr: selCtr 
	PORT MAP(
		clk25MHz => clk25MHz,
		moden => moden,
		sel => sel,
		S => TiSel_int
	);
	
Inst_BesturingTiF: BesturingTiF 
	PORT MAP(
		sel => TiSel_int,
		moden => moden,
		clk25MHz => clk25MHz,
		clk1Hz => clk1Hz,
		inc => inc,
		dec => dec,
		SEn => SEn_int,
		Ti_sEn => Ti_sEn_int,
		Ti_mEn => Ti_mEn_int,
		Ti_uEn => Ti_uEn_int,
		Ti_down => Ti_down_int,
		Ti_clr => Ti_clr_int
	);
	
Inst_Countdown: Countdown 
	PORT MAP(
		clk25MHz => clk25MHz,
		clr => Ti_clr_int,
		SEn => SEn_int,
		down => Ti_down_int,
		incS => Ti_sEn_int,
		incM => Ti_mEn_int,
		incU => Ti_uEn_int,
		eS => eS,
		tS => tS,
		eM => eM,
		tM => tM,
		eU => eU,
		tU => tU,
		Alarm => alarm_act_int
	);
	
Inst_Convert_Alarm: Convert_Alarm 
	PORT MAP(
		clk25MHz => clk25MHz,
		start => alarm_act_int,
		reset => Aloff,
		start_con => alarm_act_con_int
	);
	
Inst_Auto_Alarm: Auto_Alarm 
	PORT MAP(
		clk25MHz => clk25MHz,
		EnTeller => SEn_int,
		start => alarm_act_con_int,
		stop => alarm_off_int
	);
	
Inst_Alarm: Alarm 
	PORT MAP(
		klok25MHz => clk25MHz,
		activatie => alarm_act_int,
		deactivatie => alarm_off_int,
		deactivatie_out => Aloff,
		alarm => TiAl
	);

TiSel <= TiSel_int;

end Structural;
