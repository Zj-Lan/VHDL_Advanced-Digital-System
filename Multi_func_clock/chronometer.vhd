----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    11:18:11 04/11/2012 
-- Module Name:    chronometer - Structural 
-- Project Name: Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity chronometer is
    Port ( moden : in  STD_LOGIC;
           ss : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  freeze : in STD_LOGIC;
           clk100Hz : in  STD_LOGIC;
           clk25MHz : in  STD_LOGIC;
           tH : out  STD_LOGIC_VECTOR (3 downto 0);
           eH : out  STD_LOGIC_VECTOR (3 downto 0);
           tS : out  STD_LOGIC_VECTOR (3 downto 0);
           eS : out  STD_LOGIC_VECTOR (3 downto 0);
           tM : out  STD_LOGIC_VECTOR (3 downto 0);
           eM : out  STD_LOGIC_VECTOR (3 downto 0);
           ftH : out  STD_LOGIC_VECTOR (3 downto 0);
           feH : out  STD_LOGIC_VECTOR (3 downto 0);
           ftS : out  STD_LOGIC_VECTOR (3 downto 0);
           feS : out  STD_LOGIC_VECTOR (3 downto 0);
           ftM : out  STD_LOGIC_VECTOR (3 downto 0);
           feM : out  STD_LOGIC_VECTOR (3 downto 0));
end chronometer;

architecture Structural of chronometer is



	COMPONENT c_besturing
	PORT(
		clk25MHz : in  STD_LOGIC;
		clk100Hz : in STD_LOGIC;
		moden : in  STD_LOGIC;
		startstop : in  STD_LOGIC;
		freeze : in  STD_LOGIC;
		reset : in  STD_LOGIC;
		en : out  STD_LOGIC;
		clr : out  STD_LOGIC;
		fze : out  STD_LOGIC);
	END COMPONENT;
	
	COMPONENT c_freeze
	PORT(
		clk25MHz : in  STD_LOGIC;
		freeze : in  STD_LOGIC;
		eH : in  STD_LOGIC_VECTOR (3 downto 0);
		tH : in  STD_LOGIC_VECTOR (3 downto 0);
		eS : in  STD_LOGIC_VECTOR (3 downto 0);
		tS : in  STD_LOGIC_VECTOR (3 downto 0);
		eM : in  STD_LOGIC_VECTOR (3 downto 0);
		tM : in  STD_LOGIC_VECTOR (3 downto 0);
		feH : out  STD_LOGIC_VECTOR (3 downto 0);
		ftH : out  STD_LOGIC_VECTOR (3 downto 0);
		feS : out  STD_LOGIC_VECTOR (3 downto 0);
		ftS : out  STD_LOGIC_VECTOR (3 downto 0);
		feM : out  STD_LOGIC_VECTOR (3 downto 0);
		ftM : out  STD_LOGIC_VECTOR (3 downto 0));
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
	
	COMPONENT HONDERDSTEN
	PORT(
		clk25MHz : in  STD_LOGIC;
		en : in STD_LOGIC;
		clr : in  STD_LOGIC;
		down : in  STD_LOGIC;
		eH : out  STD_LOGIC_VECTOR (3 downto 0);
		tH : out  STD_LOGIC_VECTOR (3 downto 0);
		sEn : out  STD_LOGIC);
	END COMPONENT;

signal hEn_int : std_logic := '0';
signal sEn_int : std_logic := '0';
signal mEn_int : std_logic := '0';
signal uEn_int : std_logic;

signal down_int : std_logic := '0';

signal eH_int : std_logic_vector(3 downto 0);
signal tH_int : std_logic_vector(3 downto 0);
signal eS_int : std_logic_vector(3 downto 0);
signal tS_int : std_logic_vector(3 downto 0);
signal eM_int : std_logic_vector(3 downto 0);
signal tM_int : std_logic_vector(3 downto 0);

signal freeze_int : std_logic;
signal clr_int : std_logic;
begin


Inst_besturing: c_besturing
PORT MAP(
		clk25MHz => clk25MHz,
		clk100Hz => clk100Hz,
		moden => moden,
		startstop => ss,
		freeze => freeze,
		reset => reset,
		en => hEn_int,
		clr => clr_int,
		fze => freeze_int
);

Inst_freeze: c_freeze
PORT MAP(
		clk25MHz => clk25MHz,
		freeze => freeze_int,
		eH => eH_int,
		tH => tH_int,
		eS => eS_int,
		tS => tS_int,
		eM => eM_int,
		tM => tM_int,
		feH => feH,
		ftH => ftH,
		feS => feS,
		ftS => ftS,
		feM => feM,
		ftM => ftM
);


Inst_HONDERDSTEN: HONDERDSTEN
PORT MAP(
		clk25MHz => clk25MHz,
		en => hEn_int,
		clr => clr_int,
		down => down_int,
		eH => eH_int,
		tH => tH_int,
		sEn => sEn_int
);
Inst_SEC: SEC
PORT MAP(
		clk25MHz => clk25MHz,
		sEn => sEn_int,
		clr => clr_int,
		DOWN => down_int,
		eS => eS_int,
		tS => tS_int,
		mEn => mEn_int
);
Inst_MIN: MIN
PORT MAP(
		clk25MHz => clk25MHz,
		mEn => mEn_int,
		clr => clr_int,
		DOWN => down_int,
		eM => eM_int,
		tM => tM_int,
		uEn => uEn_int
);

eH <= eH_int;
tH <= tH_int;
eS <= eS_int;
tS <= tS_int;
eM <= eM_int;
tM <= tM_int;
end Structural;

