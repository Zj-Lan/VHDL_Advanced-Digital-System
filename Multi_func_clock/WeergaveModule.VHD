----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	display_module - Structural
-- Project Name: 	Weergave_Module
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity display_module is
port (	clk25MHz : in std_logic;
			-- time_func
			tSel : in std_logic_vector (1 downto 0);
			teS : in std_logic_vector (3 downto 0);
			ttS : in std_logic_vector (3 downto 0);
			teM : in std_logic_vector (3 downto 0);
			ttM : in std_logic_vector (3 downto 0);
			teU : in std_logic_vector (3 downto 0);
			ttU : in std_logic_vector (3 downto 0);
			t_en : in std_logic; -- time enable from control
			-- date_func
			dSel : in std_logic_vector (1 downto 0);
			deD : in std_logic_vector (3 downto 0);
			dtD : in std_logic_vector (3 downto 0);
			deM : in std_logic_vector (3 downto 0);
			dtM : in std_logic_vector (3 downto 0);
			deJ : in std_logic_vector (3 downto 0);
			dtJ : in std_logic_vector (3 downto 0);
			d_en : in std_logic; -- date enable from control
			-- alarm_clock_func
			wSel : in std_logic_vector (1 downto 0);
			weM : in std_logic_vector (3 downto 0);
			wtM : in std_logic_vector (3 downto 0);
			weU : in std_logic_vector (3 downto 0);
			wtU : in std_logic_vector (3 downto 0);
			w_en : in std_logic; -- alarm_clock enable from control
			w_al : in std_logic; -- alarm_clock Alarm
			w_ac : in std_logic; -- alarm_clock active?
			-- timer_func
			TiSel : in std_logic_vector (1 downto 0);
			TieS : in std_logic_vector (3 downto 0);
			TitS : in std_logic_vector (3 downto 0);
			TieM : in std_logic_vector (3 downto 0);
			TitM : in std_logic_vector (3 downto 0);
			TieU : in std_logic_vector (3 downto 0);
			TitU : in std_logic_vector (3 downto 0);
			Ti_en : in std_logic; -- Timer enable from control
			Ti_al : in std_logic; -- Timer Alarm
			-- chronometer_func
			ceH : in std_logic_vector (3 downto 0);
			ctH : in std_logic_vector (3 downto 0);
			ceS : in std_logic_vector (3 downto 0);
			ctS : in std_logic_vector (3 downto 0);
			ceM : in std_logic_vector (3 downto 0);
			ctM : in std_logic_vector (3 downto 0);
			leH : in std_logic_vector (3 downto 0);
			ltH : in std_logic_vector (3 downto 0);
			leS : in std_logic_vector (3 downto 0);
			ltS : in std_logic_vector (3 downto 0);
			leM : in std_logic_vector (3 downto 0);
			ltM : in std_logic_vector (3 downto 0);
			cs_en : in std_logic; -- switch between chrono en lap time.
			c_en : in std_logic; -- Chrono enable from control
			-- VGAscherm
			VSel : out std_logic_vector (2 downto 0); -- Selectie Functie
			VSegSel : out std_logic_vector (1 downto 0); -- Selectie blok instellen
			Vt1 : out std_logic_vector (3 downto 0); -- X0:00:00
			Ve1 : out std_logic_vector (3 downto 0); -- 0X:00:00
			Vt2 : out std_logic_vector (3 downto 0); -- 00:X0:00
			Ve2 : out std_logic_vector (3 downto 0); -- 00:0X:00
			Vt3 : out std_logic_vector (3 downto 0); -- 00:00:X0
			Ve3 : out std_logic_vector (3 downto 0); -- 00:00:0X
			Wac : out std_logic; -- alarm_clock active?
			Alac : out std_logic -- Alarm active?
			);
end display_module;

architecture Structural of display_module is

COMPONENT Sel_Uit_VGA
	PORT(
		klok25MHz : IN std_logic;
		t_en : IN std_logic;
		d_en : IN std_logic;
		w_en : IN std_logic;
		Ti_en : IN std_logic;
		cs_en : IN std_logic;
		c_en : IN std_logic;          
		SEL : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

COMPONENT Keuze_Uitgang_VGA
	PORT(
		klok25MHz : IN std_logic;
		sel : IN std_logic_vector(2 downto 0);
		t_eS : IN std_logic_vector(3 downto 0);
		t_tS : IN std_logic_vector(3 downto 0);
		t_eM : IN std_logic_vector(3 downto 0);
		t_tM : IN std_logic_vector(3 downto 0);
		t_eU : IN std_logic_vector(3 downto 0);
		t_tU : IN std_logic_vector(3 downto 0);
		d_eD : IN std_logic_vector(3 downto 0);
		d_tD : IN std_logic_vector(3 downto 0);
		d_eM : IN std_logic_vector(3 downto 0);
		d_tM : IN std_logic_vector(3 downto 0);
		d_eJ : IN std_logic_vector(3 downto 0);
		d_tJ : IN std_logic_vector(3 downto 0);
		w_eM : IN std_logic_vector(3 downto 0);
		w_tM : IN std_logic_vector(3 downto 0);
		w_eU : IN std_logic_vector(3 downto 0);
		w_tU : IN std_logic_vector(3 downto 0);
		Ti_eS : IN std_logic_vector(3 downto 0);
		Ti_tS : IN std_logic_vector(3 downto 0);
		Ti_eM : IN std_logic_vector(3 downto 0);
		Ti_tM : IN std_logic_vector(3 downto 0);
		Ti_eU : IN std_logic_vector(3 downto 0);
		Ti_tU : IN std_logic_vector(3 downto 0);
		c_eH : IN std_logic_vector(3 downto 0);
		c_tH : IN std_logic_vector(3 downto 0);
		c_eS : IN std_logic_vector(3 downto 0);
		c_tS : IN std_logic_vector(3 downto 0);
		c_eM : IN std_logic_vector(3 downto 0);
		c_tM : IN std_logic_vector(3 downto 0);
		l_eH : IN std_logic_vector(3 downto 0);
		l_tH : IN std_logic_vector(3 downto 0);
		l_eS : IN std_logic_vector(3 downto 0);
		l_tS : IN std_logic_vector(3 downto 0);
		l_eM : IN std_logic_vector(3 downto 0);
		l_tM : IN std_logic_vector(3 downto 0);          
		V_t1 : OUT std_logic_vector(3 downto 0);
		V_e1 : OUT std_logic_vector(3 downto 0);
		V_t2 : OUT std_logic_vector(3 downto 0);
		V_e2 : OUT std_logic_vector(3 downto 0);
		V_t3 : OUT std_logic_vector(3 downto 0);
		V_e3 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
COMPONENT sel_intern
	PORT(
		klok25MHz : IN std_logic;
		sel : IN std_logic_vector(2 downto 0);
		t_Sel : IN std_logic_vector(1 downto 0);
		d_Sel : IN std_logic_vector(1 downto 0);
		w_Sel : IN std_logic_vector(1 downto 0);
		Ti_Sel : IN std_logic_vector(1 downto 0);          
		VGA_sel : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	signal sel_int : std_logic_vector(2 downto 0);

begin

	Inst_Sel_Uit_VGA: Sel_Uit_VGA PORT MAP(
		klok25MHz => clk25MHz,
		t_en => t_en,
		d_en => d_en,
		w_en => w_en,
		Ti_en => Ti_en,
		cs_en => cs_en,
		c_en => c_en,
		SEL => sel_int
	);

Inst_Keuze_Uitgang_VGA: Keuze_Uitgang_VGA PORT MAP(
		klok25MHz => clk25MHz,
		sel => sel_int,
		t_eS => teS,
		t_tS => ttS,
		t_eM => teM,
		t_tM => ttM,
		t_eU => teU,
		t_tU => ttU,
		d_eD => deD,
		d_tD => dtD,
		d_eM => deM,
		d_tM => dtM,
		d_eJ => deJ,
		d_tJ => dtJ,
		w_eM => weM,
		w_tM => wtM,
		w_eU => weU,
		w_tU => wtU,
		Ti_eS => TieS,
		Ti_tS => TitS,
		Ti_eM => TieM,
		Ti_tM => TitM,
		Ti_eU => TieU,
		Ti_tU => Titu,
		c_eH => CeH,
		c_tH => ctH,
		c_eS => ceS,
		c_tS => ctS,
		c_eM => ceM,
		c_tM => ctM,
		l_eH => leH,
		l_tH => ltH,
		l_eS => leS,
		l_tS => ltS,
		l_eM => leM,
		l_tM => ltM,
		V_t1 => Vt1,
		V_e1 => Ve1,
		V_t2 => Vt2,
		V_e2 => Ve2,
		V_t3 => Vt3,
		V_e3 => Ve3
	);
	
	Inst_sel_intern: sel_intern PORT MAP(
		klok25MHz => clk25MHz,
		sel => sel_int,
		t_Sel => tSel,
		d_Sel => dSel,
		w_Sel => wSel,
		Ti_Sel => TiSel,
		VGA_sel => VSegSel
	);
	
	Alac <= w_al or Ti_al;
	Wac <= w_ac;
	VSel <= sel_int;

end Structural;