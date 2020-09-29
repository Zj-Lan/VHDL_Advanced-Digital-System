----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    10:12:18 02/23/2012 
-- Module Name:    time_func - structural 
-- Project Name: 	Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity time_func is
    Port ( moden : in STD_LOGIC;
			  sel : in  STD_LOGIC;
           inc : in  STD_LOGIC;
			  dec : in STD_LOGIC;
           clk1Hz : in STD_LOGIC;
			  clk25MHz : in STD_LOGIC;
           tSel : out  STD_LOGIC_VECTOR (1 downto 0);
           tS : out  STD_LOGIC_VECTOR (3 downto 0);
           eS : out  STD_LOGIC_VECTOR (3 downto 0);
           tM : out  STD_LOGIC_VECTOR (3 downto 0);
           eM : out  STD_LOGIC_VECTOR (3 downto 0);
           tU : out  STD_LOGIC_VECTOR (3 downto 0);
           eU : out  STD_LOGIC_VECTOR (3 downto 0);
			  oD : out  STD_LOGIC );
end time_func;

architecture Structural of time_func is

	
	COMPONENT besturing
	PORT(
		sel : in  std_logic;
		moden : in std_logic;
		clk25MHz : in STD_LOGIC;
		secEn : in STD_LOGIC;			  
		minEn : in STD_LOGIC;
		hrEn : in STD_LOGIC;
		inc : in STD_LOGIC;
		dec : in STD_LOGIC;
		t_sEn : out STD_LOGIC;
		t_mEn : out STD_LOGIC;
		t_uEn : out STD_LOGIC;
		t_down : out STD_LOGIC;
		t_clr : out STD_LOGIC;
		S : out std_logic_vector(1 downto 0));
	END COMPONENT;
	
	COMPONENT SEC
	PORT(
		clk25MHz : in  STD_LOGIC;
		sEn : in STD_LOGIC;
		clr : in STD_LOGIC;
		DOWN : in  STD_LOGIC;
		eS : out  STD_LOGIC_VECTOR (3 downto 0);
		tS : out  STD_LOGIC_VECTOR (3 downto 0);
		mEn : out  STD_LOGIC);
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

	signal mEn_int : std_logic;
	signal uEn_int : std_logic;
	signal t_sEn_int : std_logic;
	signal t_mEn_int : std_logic;
	signal t_uEn_int : std_logic;
	signal t_down_int : std_logic;
	signal t_sclr_int : std_logic;
	signal t_mclr_int,t_uclr_int : std_logic := '0';
	
begin


Inst_besturing: besturing
PORT MAP(
		sel => sel,
		moden => moden,
		clk25MHz => clk25MHz,
		secEn => clk1Hz,
		minEn => mEn_int,
		hrEn => uEn_int,
		inc => inc,
		dec => dec,
		t_sEn => t_sEn_int,
		t_mEn => t_mEn_int,
		t_uEn => t_uEn_int,
		t_down => t_down_int,
		t_clr => t_sclr_int,
		S => tSel
);
Inst_SEC: SEC
PORT MAP(
		clk25MHz => clk25MHz,
		sEn => t_sEn_int,
		clr => t_sclr_int,
		DOWN => t_down_int,
		eS => eS,
		tS => tS,
		mEn => mEn_int
);
Inst_MIN: MIN
PORT MAP(
		clk25MHz => clk25MHz,
		mEn => t_mEn_int,
		clr => t_mclr_int,
		DOWN => t_down_int,
		eM => eM,
		tM => tM,
		uEn => uEn_int
);
Inst_UREN: UREN
PORT MAP(
		clk25MHz => clk25MHz,
		uEn => t_uEn_int,
		clr => t_uclr_int,
		DOWN => t_down_int,
		eU => eU,
		tU => tU,
		oD => oD
);

end Structural;