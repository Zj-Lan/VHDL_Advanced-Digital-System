----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	alarm_clock_func - Structural
-- Project Name: 	alarm_clock_func
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alarm_clock_func is
    Port ( clk4Hz : in  STD_LOGIC;
           clk25MHz : in  STD_LOGIC;
           --clr : in  STD_LOGIC;
           dec : in  STD_LOGIC;
           inc : in  STD_LOGIC;
           moden : in  STD_LOGIC;
           sel : in  STD_LOGIC;
			  aloff : in STD_LOGIC;
           e_M : in  STD_LOGIC_VECTOR (3 downto 0);
           t_M : in  STD_LOGIC_VECTOR (3 downto 0);
           e_U : in  STD_LOGIC_VECTOR (3 downto 0);
           t_U : in  STD_LOGIC_VECTOR (3 downto 0);
           e_MW : out  STD_LOGIC_VECTOR (3 downto 0);
           t_MW : out  STD_LOGIC_VECTOR (3 downto 0);
           e_UW : out  STD_LOGIC_VECTOR (3 downto 0);
           t_UW : out  STD_LOGIC_VECTOR (3 downto 0);
           WSel : out  STD_LOGIC_VECTOR (1 downto 0);
			  active : out STD_LOGIC;
			  wakeup : out STD_LOGIC
			  );
end alarm_clock_func;

architecture Structural of alarm_clock_func is

COMPONENT selCtr
	PORT(
		clk25MHz : IN std_logic;
		moden : IN std_logic;
		sel : IN std_logic;          
		S : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
COMPONENT BesturingWekF
	PORT(
		klok25MHz : IN std_logic;
		klok4Hz : IN std_logic;
		inc : IN std_logic;
		dec : IN std_logic;
		sel : IN std_logic_vector(1 downto 0);          
		w_MinEn : OUT std_logic;
		w_UurEn : OUT std_logic;
		w_down : OUT std_logic;
		w_clr : OUT std_logic;
		w_act : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT MIN
	PORT(
		clk25MHz : in  STD_LOGIC;
		mEn : in STD_LOGIC;
		clr : in  STD_LOGIC;
		DOWN : in  STD_LOGIC;
		eM : out  STD_LOGIC_VECTOR (3 downto 0);
		tM : out  STD_LOGIC_VECTOR (3 downto 0);
		uEn : out  STD_LOGIC);
	END COMPONENT;

	
COMPONENT UREN
	PORT(
		clk25MHz : in  STD_LOGIC;
		uEn : in STD_LOGIC;
		clr : in  STD_LOGIC;
		DOWN : in  STD_LOGIC;
		eU : out  STD_LOGIC_VECTOR (3 downto 0);
		tU : out  STD_LOGIC_VECTOR (3 downto 0);
		oD : out  STD_LOGIC);
	END COMPONENT;
	
COMPONENT Comporator
	PORT(
		clk25MHz : IN std_logic;
		eMW : IN std_logic_vector(3 downto 0);
		tMW : IN std_logic_vector(3 downto 0);
		eUW : IN std_logic_vector(3 downto 0);
		tUW : IN std_logic_vector(3 downto 0);
		eM : IN std_logic_vector(3 downto 0);
		tM : IN std_logic_vector(3 downto 0);
		eU : IN std_logic_vector(3 downto 0);
		tU : IN std_logic_vector(3 downto 0);
		w_on : IN std_logic;          
		gelijk : OUT std_logic;
		OFFA : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT Alarm
	PORT(
		klok25MHz : IN std_logic;
		activatie : IN std_logic;
		deactivatie : IN std_logic;
		deactivatie_out : in STD_LOGIC;		
		alarm : OUT std_logic
		);
	END COMPONENT;
	
signal w_MinEn_int, w_UurEn_int, w_down_int, w_clr_int, w_act_int : std_logic;
signal gelijk_int, deac_int : std_logic;
signal WSel_int : std_logic_vector(1 downto 0);
signal e_MW_int, t_MW_int, e_UW_int, t_UW_int : std_logic_vector(3 downto 0);

begin

Inst_selCtr: selCtr PORT MAP(
		clk25MHz => clk25MHz,
		moden => moden,
		sel => sel,
		S => WSel_int
	);
	
Inst_BesturingWekF: BesturingWekF PORT MAP(
		klok25MHz => clk25MHZ,
		klok4Hz => clk4Hz,
		inc => inc,
		dec => dec,
		sel => WSel_int,
		w_MinEn => w_MinEn_int,
		w_UurEn => w_UurEn_int,
		w_down => w_down_int,
		w_clr => w_clr_int,
		w_act => w_act_int
	);
	
Inst_MIN: MIN PORT MAP(
		clk25MHz => clk25MHz,
		mEn => w_MinEn_int,
		clr => w_clr_int,
		DOWN => w_down_int,
		eM => e_MW_int,
		tM => t_MW_int
	);
	
Inst_UREN: UREN PORT MAP(
		clk25MHz => clk25MHz,
		uEn => w_UurEn_int,
		clr => w_clr_int,
		Down => w_down_int,
		eU => e_UW_int,
		tU => t_UW_int
	);
	
Inst_Comporator: Comporator PORT MAP(
		clk25MHz => clk25MHz,
		eMW => e_MW_int,
		tMW => t_MW_int,
		eUW => e_UW_int,
		tUW => t_UW_int,
		eM => e_M,
		tM => t_M,
		eU => e_U,
		tU => t_U,
		w_on => w_act_int,
		gelijk => gelijk_int,
		OFFA => deac_int
	);	
	
Inst_Alarm: Alarm PORT MAP(
		klok25MHz => clk25MHz,
		activatie => gelijk_int,
		deactivatie => deac_int,
		deactivatie_out => aloff,
		alarm => active
	);
	
e_MW <= e_MW_int;
t_MW <= t_MW_int;
e_UW <= e_UW_int;
t_UW <= t_UW_int;
WSel <= WSel_int;
wakeup <= w_act_int;


end Structural;

