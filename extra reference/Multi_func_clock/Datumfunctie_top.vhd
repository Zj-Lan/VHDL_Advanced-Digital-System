----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	date_func - Structural
-- Project Name: 	date_func
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity date_func is
    Port ( moden : in  STD_LOGIC;
           sel : in  STD_LOGIC;
			  inc : in STD_LOGIC;
			  dec : in STD_LOGIC;
           clk25MHz : in  STD_LOGIC;
			  oD : in STD_LOGIC;
			  dSel : out STD_LOGIC_VECTOR (1 downto 0);
           tD : out  STD_LOGIC_VECTOR (3 downto 0);
           eD : out  STD_LOGIC_VECTOR (3 downto 0);
           tM : out  STD_LOGIC_VECTOR (3 downto 0);
           eM : out  STD_LOGIC_VECTOR (3 downto 0);
           tJ : out  STD_LOGIC_VECTOR (3 downto 0);
           eJ : out  STD_LOGIC_VECTOR (3 downto 0));
end date_func;

architecture Structural of date_func is

	COMPONENT selCtr
	PORT(
		clk25Mhz : IN std_logic;
		moden : IN std_logic;
		sel : IN std_logic;          
		S : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	COMPONENT BesturingDatF
	PORT(
		klok25MHz : IN std_logic;
		DagEn : IN std_logic;
		MaandEn : IN std_logic;
		JaarEn : IN std_logic;
		inc : IN std_logic;
		dec : IN std_logic;
		sel : IN std_logic_vector(1 downto 0);          
		d_DagEn : OUT std_logic;
		d_MaandEn : OUT std_logic;
		d_JaarEn : OUT std_logic;
		d_down : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Dagen
	PORT(
		klokDn : IN std_logic;
		klok25MHz : IN std_logic;
		Up_Down : IN std_logic;
		SJaar : IN std_logic;
		FEB : IN std_logic;
		GMaand : IN std_logic;
		SEL : IN std_logic_vector(1 downto 0);
		eD : OUT std_logic_vector(3 downto 0);
		tD : OUT std_logic_vector(3 downto 0);
		oM : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Maanden
	PORT(
		enMn : IN std_logic;
		klok25MHz : IN std_logic;
		Up_Down : IN std_logic;          
		eM : OUT std_logic_vector(3 downto 0);
		tM : OUT std_logic_vector(3 downto 0);
		oJ : OUT std_logic;
		GMaand : OUT std_logic;
		FEB : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Jaren
	PORT(
		enJn : IN std_logic;
		klok25MHz : IN std_logic;
		Up_Down : IN std_logic;          
		eJ : OUT std_logic_vector(3 downto 0);
		tJ : OUT std_logic_vector(3 downto 0);
		SJ : OUT std_logic
		);
	END COMPONENT;

signal enMn_intern, enJn_intern: std_logic;
signal Februari, GroteMaand, SchrikkelJaar: std_logic;
signal d_DEn_int, d_MEn_int, d_JEn_int, d_down_int: std_logic;
signal dSel_int: std_logic_vector(1 downto 0);
begin

	Inst_selCtr: selCtr PORT MAP(
		clk25Mhz => clk25MHz,
		moden => moden,
		sel => sel,
		S => dSel_int
	);

	Inst_BesturingDatF: BesturingDatF PORT MAP(
		klok25MHz => clk25Mhz,
		DagEn => oD,
		MaandEn => enMn_intern,
		JaarEn => enJn_intern,
		inc => inc,
		dec => dec,
		sel => dSel_int,
		d_DagEn => d_DEn_int,
		d_MaandEn => d_MEn_int,
		d_JaarEn => d_JEn_int,
		d_down => d_down_int
	);
	
	Inst_Dagen: Dagen PORT MAP(
		klokDn => d_DEn_int,
		klok25MHz => clk25MHz,
		Up_Down => d_down_int,
		SJaar => SchrikkelJaar,
		FEB => Februari,
		GMaand => GroteMaand,
		SEL => dSel_int,
		eD => eD,
		tD => tD,
		oM => enMn_intern
	);
		
	Inst_Maanden: Maanden PORT MAP(
		enMn => d_MEn_int,
		klok25MHz => clk25Mhz,
		Up_Down => d_down_int,
		eM => eM,
		tM => tM,
		oJ => enJn_intern,
		GMaand => GroteMaand,
		FEB => Februari
	);


	Inst_Jaren: Jaren PORT MAP(
		enJn => d_JEn_int,
		klok25MHz => clk25MHz,
		Up_Down => d_down_int,
		eJ => eJ,
		tJ => tJ,
		SJ => SchrikkelJaar
	);
	
	dSel <= dSel_int;

end Structural;