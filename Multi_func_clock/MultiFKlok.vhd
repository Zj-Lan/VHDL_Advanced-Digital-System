----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure & Kaj Van der Hallen
-- Module Name:    	MultiFKlok - Structural
-- Project Name: 	Multifunctione klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MultiFKlok is
Port	(	clk50MHz : in STD_LOGIC;
			btn1 : in STD_LOGIC;
			btn2 : in STD_LOGIC;
			btn3 : in STD_LOGIC;
			btn4 : in STD_LOGIC;
			HSync : out STD_LOGIC;
			VSync : out STD_LOGIC;
			Red : out STD_LOGIC_VECTOR(2 downto 0);
			Green : out STD_LOGIC_VECTOR(2 downto 0);
			Blue : out STD_LOGIC_VECTOR(1 downto 0);
			clk4Hz : in std_logic
);
end MultiFKlok;

architecture Behavioral of MultiFKlok is

COMPONENT clock_divider
	PORT (  clk50MHz_in : in  STD_LOGIC;
           clk25MHz_out : out  STD_LOGIC;
			  TC_clk100Hz_out : out  STD_LOGIC;
           TC_clk4Hz_out : out  STD_LOGIC;
           TC_clk1Hz_out : out  STD_LOGIC);
	END COMPONENT;
	
COMPONENT state_control
	PORT (  clk : in std_logic;
			  sel : in std_logic;
			  time : OUT STD_LOGIC;
			  date : OUT STD_LOGIC;
			  alarm_clock : OUT STD_LOGIC;
			  timer_en : OUT STD_LOGIC;
			  chrono_en : OUT STD_LOGIC);
	END COMPONENT;
	
COMPONENT time_func
	PORT (  moden : in STD_LOGIC;
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
	END COMPONENT;
	
COMPONENT date_func
	PORT (  moden : in  STD_LOGIC;
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
	END COMPONENT;
	
COMPONENT alarm_clock_func
	PORT (  clk25MHz : in  STD_LOGIC;
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
           wSel : out  STD_LOGIC_VECTOR (1 downto 0);
			  active : out STD_LOGIC;
			  wakeup : out STD_LOGIC
			  );
	END COMPONENT;
	
	
	COMPONENT timer_func
	PORT (  moden : in  STD_LOGIC;
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
	END COMPONENT;
	
	
COMPONENT chronometer
	PORT (  moden : in  STD_LOGIC;
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
	END COMPONENT;
	
COMPONENT display_module
	PORT (  clk25MHz : in std_logic;
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
	END COMPONENT;
	
COMPONENT VGA
	PORT (  clk : in std_logic;								-- systeemklok
			  hsync : out std_logic;								-- horizontaal synchronisatiesignaal
			  vsync : out std_logic;								-- verticaal synchronisatiesignaal
			  red : out std_logic_vector(2 downto 0);				-- uitgang naar 3 bit da-converter (rood)voor VGA scherm
			  green : out std_logic_vector(2 downto 0);			-- uitgang naar 3 bit da-converter (groen)voor VGA scherm
			  blue : out std_logic_vector(1 downto 0);				-- uitgang naar 2 bit da-converter (blauw)voor VGA scherm
			  d1,d2,d4,d5,d7,d8 : in std_logic_vector(3 downto 0);
			  VSel : in std_logic_vector (2 downto 0); -- Selectie Functie
			  VSegSel : in std_logic_vector (1 downto 0); -- Selectie blok instellen
			  Wac : in std_logic; -- alarm_clock active?
			  Alac : in std_logic; -- Alarm active?
			  clk4Hz : in std_logic;
			  feS,ftS,feM,ftM,feH,ftH : in std_logic_vector(3 downto 0)
			  );
	END COMPONENT;

--Klokdeler	
signal C25MHz_int, C100Hz_int, C4Hz_int, C1Hz_int : std_logic;
--Debouncer
signal btn1_int, btn2_int, btn3_int, btn4_int : std_logic;
--State machine
signal tijd_en_int, datum_en_int, wekker_en_int, timer_en_int, chrono_en_int : std_logic;
--time_func
signal teS_int, ttS_int, teM_int, ttM_int, teU_int, ttU_int : std_logic_vector(3 downto 0);
--date_func
signal deD_int, dtD_int, deM_int, dtM_int, deJ_int, dtJ_int : std_logic_vector(3 downto 0);
--Wekerfunctie
signal weM_int, wtM_int, weU_int, wtU_int : std_logic_vector(3 downto 0);
--timer_func
signal TieS_int, TitS_int, TieM_int, TitM_int, TieU_int, TitU_int : std_logic_vector(3 downto 0);
--chronometer_func
signal ceH_int, ctH_int, ceS_int, ctS_int, ceM_int, ctM_int : std_logic_vector(3 downto 0);
signal feH_int, ftH_int, feS_int, ftS_int, feM_int, ftM_int : std_logic_vector(3 downto 0);
--VGA
signal d1_int, d2_int, d4_int, d5_int, d7_int, d8_int : std_logic_vector(3 downto 0);
--Selecties
signal tSel_int, dSel_int, wSel_int, TiSel_int, VSegSel_int : std_logic_vector(1 downto 0);
signal oD_int, w_ac_int, w_al_int, Ti_al_int, Wac_int, Alac_int : std_logic;
signal VSel_int : std_logic_vector(2 downto 0);
signal alarm_btn : std_logic := '0';


begin

alarm_btn <= btn1_int or btn2_int or btn3_int or btn4_int;

Inst_klokdeler: clock_divider
	PORT MAP(
			clk50MHz_in => clk50MHz,
			clk25MHz_out => C25MHz_int,
			TC_clk100Hz_out => C100Hz_int,
			TC_clk4Hz_out => C4Hz_int,
			TC_clk1Hz_out => C1Hz_int
	);
	
Inst_State_Bediening: state_control
	PORT MAP(
			clk => C25MHz_int,
			sel => btn1_int,
			time => tijd_en_int,
			date => datum_en_int,
			alarm_clock => wekker_en_int,
			timer_en => timer_en_int,
			chrono_en => chrono_en_int
	);
	
Inst_tijdsfunctie: time_func
	PORT MAP(
			moden => tijd_en_int,
			sel => btn2_int,
			inc => btn3_int,
			dec => btn4_int,
			clk1Hz => C1Hz_int,
			clk25MHz => C25MHz_int,
			oD => oD_int,
			tSel => tSel_int,
			tS => ttS_int,
			eS => teS_int,
			tM => ttM_int,
			eM => teM_int,
			tU => ttU_int,
			eU => teU_int
	);
	
Inst_Datumfunctie_top: date_func
	PORT MAP(
			moden => datum_en_int,
			sel => btn2_int,
			inc => btn3_int,
			dec => btn4_int,
			clk25MHz => C25MHz_int,
			oD => oD_int,
			dSel => dSel_int,
			tD => dtD_int,
			eD => deD_int,
			tM => dtM_int,
			eM => deM_int,
			tJ => dtJ_int,
			eJ => deJ_int
	);
	
Inst_Wekkerfunctie_top: alarm_clock_func
	PORT MAP(
			clk25MHz => C25MHz_int,
			dec => btn4_int,
			inc => btn3_int,
			moden => wekker_en_int,
			sel => btn2_int,
			aloff => alarm_btn,
			e_M => teM_int,
			t_M => ttM_int,
			e_U => teU_int,
			t_U => ttU_int,
			e_MW => weM_int,
			t_MW => wtM_int,
			e_UW => weU_int,
			t_UW => wtU_int,
			wSel => wSel_int,
			active => w_al_int,
			wakeup => w_ac_int
	);

Inst_Timerfunctie_top: timer_func
	PORT MAP(
			moden => timer_en_int,
         sel => btn2_int,
         inc => btn3_int,
         dec => btn4_int,
         clk1Hz => C1Hz_int,
         clk25MHz => C25MHz_int,
			Aloff => alarm_btn,
         TiSel => TiSel_int,
         tS => TitS_int,
         eS => TieS_int,
         tM => TitM_int,
         eM => TieM_int,
         tU => TitU_int,
         eU => TieU_int,
			TiAl => Ti_al_int
	);

	
Inst_chronometer: chronometer
	PORT MAP(
			moden => chrono_en_int,
			ss => btn3_int,
			reset => btn2_int,
			freeze => btn4_int,
			clk100Hz => C100Hz_int,
			clk25MHz => C25MHz_int,
			tH => ctH_int,
			eH => ceH_int,
			tS => ctS_int,
			eS => ceS_int,
			tM => ctM_int,
			eM => ceM_int,
			ftH => ftH_int,
			feH => feH_int,
			ftS => ftS_int,
			feS => feS_int,
			ftM => ftM_int,
			feM => feM_int
	);

Inst_WeergaveModule: display_module
	PORT MAP(
			clk25MHz => C25MHz_int,
			-- time_func
			tSel  => tSel_int,
			teS  => teS_int,
			ttS  => ttS_int,
			teM  => teM_int,
			ttM  => ttM_int,
			teU  => teU_int,
			ttU  => ttU_int,
			t_en  => tijd_en_int,
			-- date_func
			dSel  => dSel_int,
			deD  => deD_int,
			dtD  => dtD_int,
			deM  => deM_int,
			dtM  => dtM_int,
			deJ  => deJ_int,
			dtJ  => dtJ_int,
			d_en  => datum_en_int,
			-- alarm_clock_func
			wSel  => wSel_int,
			weM  => weM_int,
			wtM  => wtM_int,
			weU  => weU_int,
			wtU  => wtU_int,
			w_en  => wekker_en_int,
			w_al  => w_al_int,
			w_ac  => w_ac_int,
			-- timer_func
			TiSel  => TiSel_int,
			TieS  => TieS_int,
			TitS  => TitS_int,
			TieM  => TieM_int,
			TitM  => TitM_int,
			TieU  => TieU_int,
			TitU  => TitU_int,
			Ti_en  => timer_en_int,
			Ti_al  => Ti_al_int,
			-- chronometer_func
			ceH  => ceH_int,
			ctH  => ctH_int,
			ceS  => ceS_int,
			ctS  => ctS_int,
			ceM  => ceM_int,
			ctM  => ctM_int,
			leH  => feH_int,
			ltH  => ftH_int,
			leS  => feS_int,
			ltS  => ftS_int,
			leM  => feM_int,
			ltM  => ftM_int,
			cs_en  => btn4_int,
			c_en  => chrono_en_int,
			-- VGAscherm
			VSel  => VSel_int, -- nog te verbinden met VGA
			VSegSel  => VSegSel_int, -- nog te verbinden met VGA
			Vt1  => d1_int,
			Ve1  => d2_int,
			Vt2  => d4_int,
			Ve2  => d5_int,
			Vt3  => d7_int,
			Ve3  => d8_int,
			Wac  => Wac_int, -- nog te verbinden met VGA
			Alac  => Alac_int -- nog te verbinden met VGA
			);
			
Inst_vga_initials_top: VGA
	PORT MAP(
			clk => C25MHz_int,
			hsync => HSync,
			vsync => VSync,
			red => Red,
			green => Green,
			blue => Blue,
			d1 => d1_int,
			d2 => d2_int,
			d4 => d4_int,
			d5 => d5_int,
			d7 => d7_int,
			d8 => d8_int,
			VSel => VSel_int,
			VSegSel => VSegSel_int,
			Wac => Wac_int,
			Alac => Alac_int,
			clk4Hz => C4Hz_int,
			feS => feS_int,
			ftS => ftS_int,
			feM => feM_int,
			ftM => ftM_int,
			feH => feH_int,
			ftH => ftH_int
			);
	
end Behavioral;
