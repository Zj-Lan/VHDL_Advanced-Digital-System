-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "04/20/2020 18:30:23"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Q2 IS
    PORT (
	clk : IN std_logic;
	start : IN std_logic;
	M : IN std_logic_vector(3 DOWNTO 0);
	Q : IN std_logic_vector(3 DOWNTO 0);
	Mul : OUT std_logic_vector(7 DOWNTO 0)
	);
END Q2;

ARCHITECTURE structure OF Q2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_M : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Q : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Mul : std_logic_vector(7 DOWNTO 0);
SIGNAL \start~input_o\ : std_logic;
SIGNAL \Mul[0]~output_o\ : std_logic;
SIGNAL \Mul[1]~output_o\ : std_logic;
SIGNAL \Mul[2]~output_o\ : std_logic;
SIGNAL \Mul[3]~output_o\ : std_logic;
SIGNAL \Mul[4]~output_o\ : std_logic;
SIGNAL \Mul[5]~output_o\ : std_logic;
SIGNAL \Mul[6]~output_o\ : std_logic;
SIGNAL \Mul[7]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \n[0]~1_combout\ : std_logic;
SIGNAL \Add2~126_cout\ : std_logic;
SIGNAL \Add2~105_sumout\ : std_logic;
SIGNAL \Add2~106\ : std_logic;
SIGNAL \Add2~101_sumout\ : std_logic;
SIGNAL \n[2]~0_combout\ : std_logic;
SIGNAL \Add2~102\ : std_logic;
SIGNAL \Add2~97_sumout\ : std_logic;
SIGNAL \Add2~98\ : std_logic;
SIGNAL \Add2~93_sumout\ : std_logic;
SIGNAL \Add2~94\ : std_logic;
SIGNAL \Add2~89_sumout\ : std_logic;
SIGNAL \Add2~90\ : std_logic;
SIGNAL \Add2~85_sumout\ : std_logic;
SIGNAL \Add2~86\ : std_logic;
SIGNAL \Add2~81_sumout\ : std_logic;
SIGNAL \Add2~82\ : std_logic;
SIGNAL \Add2~109_sumout\ : std_logic;
SIGNAL \Add2~110\ : std_logic;
SIGNAL \Add2~113_sumout\ : std_logic;
SIGNAL \Add2~114\ : std_logic;
SIGNAL \Add2~117_sumout\ : std_logic;
SIGNAL \Add2~118\ : std_logic;
SIGNAL \Add2~121_sumout\ : std_logic;
SIGNAL \Add2~122\ : std_logic;
SIGNAL \Add2~57_sumout\ : std_logic;
SIGNAL \Add2~58\ : std_logic;
SIGNAL \Add2~61_sumout\ : std_logic;
SIGNAL \Add2~62\ : std_logic;
SIGNAL \Add2~65_sumout\ : std_logic;
SIGNAL \Add2~66\ : std_logic;
SIGNAL \Add2~69_sumout\ : std_logic;
SIGNAL \Add2~70\ : std_logic;
SIGNAL \Add2~73_sumout\ : std_logic;
SIGNAL \Add2~74\ : std_logic;
SIGNAL \Add2~77_sumout\ : std_logic;
SIGNAL \Add2~78\ : std_logic;
SIGNAL \Add2~33_sumout\ : std_logic;
SIGNAL \Add2~34\ : std_logic;
SIGNAL \Add2~37_sumout\ : std_logic;
SIGNAL \Add2~38\ : std_logic;
SIGNAL \Add2~41_sumout\ : std_logic;
SIGNAL \Add2~42\ : std_logic;
SIGNAL \Add2~45_sumout\ : std_logic;
SIGNAL \Add2~46\ : std_logic;
SIGNAL \Add2~49_sumout\ : std_logic;
SIGNAL \Add2~50\ : std_logic;
SIGNAL \Add2~53_sumout\ : std_logic;
SIGNAL \Add2~54\ : std_logic;
SIGNAL \Add2~9_sumout\ : std_logic;
SIGNAL \Add2~10\ : std_logic;
SIGNAL \Add2~13_sumout\ : std_logic;
SIGNAL \Add2~14\ : std_logic;
SIGNAL \Add2~17_sumout\ : std_logic;
SIGNAL \Add2~18\ : std_logic;
SIGNAL \Add2~21_sumout\ : std_logic;
SIGNAL \Add2~22\ : std_logic;
SIGNAL \Add2~25_sumout\ : std_logic;
SIGNAL \Add2~26\ : std_logic;
SIGNAL \Add2~29_sumout\ : std_logic;
SIGNAL \Add2~30\ : std_logic;
SIGNAL \Add2~1_sumout\ : std_logic;
SIGNAL \Add2~2\ : std_logic;
SIGNAL \Add2~5_sumout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \state.initial~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \state.get_A~q\ : std_logic;
SIGNAL \state.shift~q\ : std_logic;
SIGNAL \Q_1~q\ : std_logic;
SIGNAL \M[3]~input_o\ : std_logic;
SIGNAL \M[2]~input_o\ : std_logic;
SIGNAL \M[1]~input_o\ : std_logic;
SIGNAL \M[0]~input_o\ : std_logic;
SIGNAL \Add0~18_cout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \A[3]~1_combout\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \state.result~0_combout\ : std_logic;
SIGNAL \state.result~q\ : std_logic;
SIGNAL \A[0]~0_combout\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \Q[3]~input_o\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \tmp_Q~0_combout\ : std_logic;
SIGNAL \Q[2]~input_o\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Q[1]~input_o\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Q[0]~input_o\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Mul[0]~reg0_q\ : std_logic;
SIGNAL \Mul[1]~reg0_q\ : std_logic;
SIGNAL \Mul[2]~reg0_q\ : std_logic;
SIGNAL \Mul[3]~reg0_q\ : std_logic;
SIGNAL \Mul[4]~reg0_q\ : std_logic;
SIGNAL \Mul[5]~reg0_q\ : std_logic;
SIGNAL \Mul[6]~reg0_q\ : std_logic;
SIGNAL \Mul[7]~reg0_q\ : std_logic;
SIGNAL tmp_Q : std_logic_vector(3 DOWNTO 0);
SIGNAL A : std_logic_vector(3 DOWNTO 0);
SIGNAL n : std_logic_vector(31 DOWNTO 0);
SIGNAL tmp_A : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \ALT_INV_M[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_M[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_M[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_M[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Q[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_Q[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_Q[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Q[0]~input_o\ : std_logic;
SIGNAL ALT_INV_tmp_A : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_state.initial~q\ : std_logic;
SIGNAL \ALT_INV_Q_1~q\ : std_logic;
SIGNAL \ALT_INV_Equal0~6_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~5_combout\ : std_logic;
SIGNAL ALT_INV_n : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_Equal0~4_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_state.get_A~q\ : std_logic;
SIGNAL \ALT_INV_state.shift~q\ : std_logic;
SIGNAL ALT_INV_A : std_logic_vector(3 DOWNTO 0);
SIGNAL ALT_INV_tmp_Q : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_state.result~q\ : std_logic;
SIGNAL \ALT_INV_Add2~101_sumout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_start <= start;
ww_M <= M;
ww_Q <= Q;
Mul <= ww_Mul;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Add0~13_sumout\ <= NOT \Add0~13_sumout\;
\ALT_INV_Add0~9_sumout\ <= NOT \Add0~9_sumout\;
\ALT_INV_Add0~5_sumout\ <= NOT \Add0~5_sumout\;
\ALT_INV_Add0~1_sumout\ <= NOT \Add0~1_sumout\;
\ALT_INV_M[3]~input_o\ <= NOT \M[3]~input_o\;
\ALT_INV_M[2]~input_o\ <= NOT \M[2]~input_o\;
\ALT_INV_M[1]~input_o\ <= NOT \M[1]~input_o\;
\ALT_INV_M[0]~input_o\ <= NOT \M[0]~input_o\;
\ALT_INV_Q[3]~input_o\ <= NOT \Q[3]~input_o\;
\ALT_INV_Q[2]~input_o\ <= NOT \Q[2]~input_o\;
\ALT_INV_Q[1]~input_o\ <= NOT \Q[1]~input_o\;
\ALT_INV_Q[0]~input_o\ <= NOT \Q[0]~input_o\;
ALT_INV_tmp_A(2) <= NOT tmp_A(2);
ALT_INV_tmp_A(1) <= NOT tmp_A(1);
\ALT_INV_state.initial~q\ <= NOT \state.initial~q\;
\ALT_INV_Q_1~q\ <= NOT \Q_1~q\;
ALT_INV_tmp_A(0) <= NOT tmp_A(0);
\ALT_INV_Equal0~6_combout\ <= NOT \Equal0~6_combout\;
\ALT_INV_Equal0~5_combout\ <= NOT \Equal0~5_combout\;
ALT_INV_n(11) <= NOT n(11);
ALT_INV_n(10) <= NOT n(10);
ALT_INV_n(9) <= NOT n(9);
ALT_INV_n(8) <= NOT n(8);
ALT_INV_n(0) <= NOT n(0);
ALT_INV_n(1) <= NOT n(1);
\ALT_INV_Equal0~4_combout\ <= NOT \Equal0~4_combout\;
ALT_INV_n(2) <= NOT n(2);
ALT_INV_n(3) <= NOT n(3);
ALT_INV_n(4) <= NOT n(4);
ALT_INV_n(5) <= NOT n(5);
ALT_INV_n(6) <= NOT n(6);
ALT_INV_n(7) <= NOT n(7);
\ALT_INV_Equal0~3_combout\ <= NOT \Equal0~3_combout\;
ALT_INV_n(17) <= NOT n(17);
ALT_INV_n(16) <= NOT n(16);
ALT_INV_n(15) <= NOT n(15);
ALT_INV_n(14) <= NOT n(14);
ALT_INV_n(13) <= NOT n(13);
ALT_INV_n(12) <= NOT n(12);
\ALT_INV_Equal0~2_combout\ <= NOT \Equal0~2_combout\;
ALT_INV_n(23) <= NOT n(23);
ALT_INV_n(22) <= NOT n(22);
ALT_INV_n(21) <= NOT n(21);
ALT_INV_n(20) <= NOT n(20);
ALT_INV_n(19) <= NOT n(19);
ALT_INV_n(18) <= NOT n(18);
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
ALT_INV_n(29) <= NOT n(29);
ALT_INV_n(28) <= NOT n(28);
ALT_INV_n(27) <= NOT n(27);
ALT_INV_n(26) <= NOT n(26);
ALT_INV_n(25) <= NOT n(25);
ALT_INV_n(24) <= NOT n(24);
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
ALT_INV_n(31) <= NOT n(31);
ALT_INV_n(30) <= NOT n(30);
\ALT_INV_state.get_A~q\ <= NOT \state.get_A~q\;
\ALT_INV_state.shift~q\ <= NOT \state.shift~q\;
ALT_INV_A(3) <= NOT A(3);
ALT_INV_A(2) <= NOT A(2);
ALT_INV_A(1) <= NOT A(1);
ALT_INV_A(0) <= NOT A(0);
ALT_INV_tmp_Q(3) <= NOT tmp_Q(3);
ALT_INV_tmp_Q(2) <= NOT tmp_Q(2);
ALT_INV_tmp_Q(1) <= NOT tmp_Q(1);
\ALT_INV_state.result~q\ <= NOT \state.result~q\;
ALT_INV_tmp_Q(0) <= NOT tmp_Q(0);
\ALT_INV_Add2~101_sumout\ <= NOT \Add2~101_sumout\;

\Mul[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mul[0]~reg0_q\,
	devoe => ww_devoe,
	o => \Mul[0]~output_o\);

\Mul[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mul[1]~reg0_q\,
	devoe => ww_devoe,
	o => \Mul[1]~output_o\);

\Mul[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mul[2]~reg0_q\,
	devoe => ww_devoe,
	o => \Mul[2]~output_o\);

\Mul[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mul[3]~reg0_q\,
	devoe => ww_devoe,
	o => \Mul[3]~output_o\);

\Mul[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mul[4]~reg0_q\,
	devoe => ww_devoe,
	o => \Mul[4]~output_o\);

\Mul[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mul[5]~reg0_q\,
	devoe => ww_devoe,
	o => \Mul[5]~output_o\);

\Mul[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mul[6]~reg0_q\,
	devoe => ww_devoe,
	o => \Mul[6]~output_o\);

\Mul[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mul[7]~reg0_q\,
	devoe => ww_devoe,
	o => \Mul[7]~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\n[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \n[0]~1_combout\ = !n(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_n(0),
	combout => \n[0]~1_combout\);

\n[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \n[0]~1_combout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(0));

\Add2~126\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~126_cout\ = CARRY(( n(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(0),
	cin => GND,
	cout => \Add2~126_cout\);

\Add2~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~105_sumout\ = SUM(( n(1) ) + ( VCC ) + ( \Add2~126_cout\ ))
-- \Add2~106\ = CARRY(( n(1) ) + ( VCC ) + ( \Add2~126_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(1),
	cin => \Add2~126_cout\,
	sumout => \Add2~105_sumout\,
	cout => \Add2~106\);

\n[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~105_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(1));

\Add2~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~101_sumout\ = SUM(( !n(2) ) + ( VCC ) + ( \Add2~106\ ))
-- \Add2~102\ = CARRY(( !n(2) ) + ( VCC ) + ( \Add2~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(2),
	cin => \Add2~106\,
	sumout => \Add2~101_sumout\,
	cout => \Add2~102\);

\n[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \n[2]~0_combout\ = !\Add2~101_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add2~101_sumout\,
	combout => \n[2]~0_combout\);

\n[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \n[2]~0_combout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(2));

\Add2~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~97_sumout\ = SUM(( n(3) ) + ( VCC ) + ( \Add2~102\ ))
-- \Add2~98\ = CARRY(( n(3) ) + ( VCC ) + ( \Add2~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(3),
	cin => \Add2~102\,
	sumout => \Add2~97_sumout\,
	cout => \Add2~98\);

\n[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~97_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(3));

\Add2~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~93_sumout\ = SUM(( n(4) ) + ( VCC ) + ( \Add2~98\ ))
-- \Add2~94\ = CARRY(( n(4) ) + ( VCC ) + ( \Add2~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(4),
	cin => \Add2~98\,
	sumout => \Add2~93_sumout\,
	cout => \Add2~94\);

\n[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~93_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(4));

\Add2~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~89_sumout\ = SUM(( n(5) ) + ( VCC ) + ( \Add2~94\ ))
-- \Add2~90\ = CARRY(( n(5) ) + ( VCC ) + ( \Add2~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(5),
	cin => \Add2~94\,
	sumout => \Add2~89_sumout\,
	cout => \Add2~90\);

\n[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~89_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(5));

\Add2~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~85_sumout\ = SUM(( n(6) ) + ( VCC ) + ( \Add2~90\ ))
-- \Add2~86\ = CARRY(( n(6) ) + ( VCC ) + ( \Add2~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(6),
	cin => \Add2~90\,
	sumout => \Add2~85_sumout\,
	cout => \Add2~86\);

\n[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~85_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(6));

\Add2~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~81_sumout\ = SUM(( n(7) ) + ( VCC ) + ( \Add2~86\ ))
-- \Add2~82\ = CARRY(( n(7) ) + ( VCC ) + ( \Add2~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(7),
	cin => \Add2~86\,
	sumout => \Add2~81_sumout\,
	cout => \Add2~82\);

\n[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~81_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(7));

\Add2~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~109_sumout\ = SUM(( n(8) ) + ( VCC ) + ( \Add2~82\ ))
-- \Add2~110\ = CARRY(( n(8) ) + ( VCC ) + ( \Add2~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(8),
	cin => \Add2~82\,
	sumout => \Add2~109_sumout\,
	cout => \Add2~110\);

\n[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~109_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(8));

\Add2~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~113_sumout\ = SUM(( n(9) ) + ( VCC ) + ( \Add2~110\ ))
-- \Add2~114\ = CARRY(( n(9) ) + ( VCC ) + ( \Add2~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(9),
	cin => \Add2~110\,
	sumout => \Add2~113_sumout\,
	cout => \Add2~114\);

\n[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~113_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(9));

\Add2~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~117_sumout\ = SUM(( n(10) ) + ( VCC ) + ( \Add2~114\ ))
-- \Add2~118\ = CARRY(( n(10) ) + ( VCC ) + ( \Add2~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(10),
	cin => \Add2~114\,
	sumout => \Add2~117_sumout\,
	cout => \Add2~118\);

\n[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~117_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(10));

\Add2~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~121_sumout\ = SUM(( n(11) ) + ( VCC ) + ( \Add2~118\ ))
-- \Add2~122\ = CARRY(( n(11) ) + ( VCC ) + ( \Add2~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(11),
	cin => \Add2~118\,
	sumout => \Add2~121_sumout\,
	cout => \Add2~122\);

\n[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~121_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(11));

\Add2~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~57_sumout\ = SUM(( n(12) ) + ( VCC ) + ( \Add2~122\ ))
-- \Add2~58\ = CARRY(( n(12) ) + ( VCC ) + ( \Add2~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(12),
	cin => \Add2~122\,
	sumout => \Add2~57_sumout\,
	cout => \Add2~58\);

\n[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~57_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(12));

\Add2~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~61_sumout\ = SUM(( n(13) ) + ( VCC ) + ( \Add2~58\ ))
-- \Add2~62\ = CARRY(( n(13) ) + ( VCC ) + ( \Add2~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(13),
	cin => \Add2~58\,
	sumout => \Add2~61_sumout\,
	cout => \Add2~62\);

\n[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~61_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(13));

\Add2~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~65_sumout\ = SUM(( n(14) ) + ( VCC ) + ( \Add2~62\ ))
-- \Add2~66\ = CARRY(( n(14) ) + ( VCC ) + ( \Add2~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(14),
	cin => \Add2~62\,
	sumout => \Add2~65_sumout\,
	cout => \Add2~66\);

\n[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~65_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(14));

\Add2~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~69_sumout\ = SUM(( n(15) ) + ( VCC ) + ( \Add2~66\ ))
-- \Add2~70\ = CARRY(( n(15) ) + ( VCC ) + ( \Add2~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(15),
	cin => \Add2~66\,
	sumout => \Add2~69_sumout\,
	cout => \Add2~70\);

\n[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~69_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(15));

\Add2~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~73_sumout\ = SUM(( n(16) ) + ( VCC ) + ( \Add2~70\ ))
-- \Add2~74\ = CARRY(( n(16) ) + ( VCC ) + ( \Add2~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(16),
	cin => \Add2~70\,
	sumout => \Add2~73_sumout\,
	cout => \Add2~74\);

\n[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~73_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(16));

\Add2~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~77_sumout\ = SUM(( n(17) ) + ( VCC ) + ( \Add2~74\ ))
-- \Add2~78\ = CARRY(( n(17) ) + ( VCC ) + ( \Add2~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(17),
	cin => \Add2~74\,
	sumout => \Add2~77_sumout\,
	cout => \Add2~78\);

\n[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~77_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(17));

\Add2~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~33_sumout\ = SUM(( n(18) ) + ( VCC ) + ( \Add2~78\ ))
-- \Add2~34\ = CARRY(( n(18) ) + ( VCC ) + ( \Add2~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(18),
	cin => \Add2~78\,
	sumout => \Add2~33_sumout\,
	cout => \Add2~34\);

\n[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~33_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(18));

\Add2~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~37_sumout\ = SUM(( n(19) ) + ( VCC ) + ( \Add2~34\ ))
-- \Add2~38\ = CARRY(( n(19) ) + ( VCC ) + ( \Add2~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(19),
	cin => \Add2~34\,
	sumout => \Add2~37_sumout\,
	cout => \Add2~38\);

\n[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~37_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(19));

\Add2~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~41_sumout\ = SUM(( n(20) ) + ( VCC ) + ( \Add2~38\ ))
-- \Add2~42\ = CARRY(( n(20) ) + ( VCC ) + ( \Add2~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(20),
	cin => \Add2~38\,
	sumout => \Add2~41_sumout\,
	cout => \Add2~42\);

\n[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~41_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(20));

\Add2~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~45_sumout\ = SUM(( n(21) ) + ( VCC ) + ( \Add2~42\ ))
-- \Add2~46\ = CARRY(( n(21) ) + ( VCC ) + ( \Add2~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(21),
	cin => \Add2~42\,
	sumout => \Add2~45_sumout\,
	cout => \Add2~46\);

\n[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~45_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(21));

\Add2~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~49_sumout\ = SUM(( n(22) ) + ( VCC ) + ( \Add2~46\ ))
-- \Add2~50\ = CARRY(( n(22) ) + ( VCC ) + ( \Add2~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(22),
	cin => \Add2~46\,
	sumout => \Add2~49_sumout\,
	cout => \Add2~50\);

\n[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~49_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(22));

\Add2~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~53_sumout\ = SUM(( n(23) ) + ( VCC ) + ( \Add2~50\ ))
-- \Add2~54\ = CARRY(( n(23) ) + ( VCC ) + ( \Add2~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(23),
	cin => \Add2~50\,
	sumout => \Add2~53_sumout\,
	cout => \Add2~54\);

\n[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~53_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(23));

\Add2~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~9_sumout\ = SUM(( n(24) ) + ( VCC ) + ( \Add2~54\ ))
-- \Add2~10\ = CARRY(( n(24) ) + ( VCC ) + ( \Add2~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(24),
	cin => \Add2~54\,
	sumout => \Add2~9_sumout\,
	cout => \Add2~10\);

\n[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~9_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(24));

\Add2~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~13_sumout\ = SUM(( n(25) ) + ( VCC ) + ( \Add2~10\ ))
-- \Add2~14\ = CARRY(( n(25) ) + ( VCC ) + ( \Add2~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(25),
	cin => \Add2~10\,
	sumout => \Add2~13_sumout\,
	cout => \Add2~14\);

\n[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~13_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(25));

\Add2~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~17_sumout\ = SUM(( n(26) ) + ( VCC ) + ( \Add2~14\ ))
-- \Add2~18\ = CARRY(( n(26) ) + ( VCC ) + ( \Add2~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(26),
	cin => \Add2~14\,
	sumout => \Add2~17_sumout\,
	cout => \Add2~18\);

\n[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~17_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(26));

\Add2~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~21_sumout\ = SUM(( n(27) ) + ( VCC ) + ( \Add2~18\ ))
-- \Add2~22\ = CARRY(( n(27) ) + ( VCC ) + ( \Add2~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(27),
	cin => \Add2~18\,
	sumout => \Add2~21_sumout\,
	cout => \Add2~22\);

\n[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~21_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(27));

\Add2~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~25_sumout\ = SUM(( n(28) ) + ( VCC ) + ( \Add2~22\ ))
-- \Add2~26\ = CARRY(( n(28) ) + ( VCC ) + ( \Add2~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(28),
	cin => \Add2~22\,
	sumout => \Add2~25_sumout\,
	cout => \Add2~26\);

\n[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~25_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(28));

\Add2~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~29_sumout\ = SUM(( n(29) ) + ( VCC ) + ( \Add2~26\ ))
-- \Add2~30\ = CARRY(( n(29) ) + ( VCC ) + ( \Add2~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(29),
	cin => \Add2~26\,
	sumout => \Add2~29_sumout\,
	cout => \Add2~30\);

\n[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~29_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(29));

\Add2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~1_sumout\ = SUM(( n(30) ) + ( VCC ) + ( \Add2~30\ ))
-- \Add2~2\ = CARRY(( n(30) ) + ( VCC ) + ( \Add2~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(30),
	cin => \Add2~30\,
	sumout => \Add2~1_sumout\,
	cout => \Add2~2\);

\n[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~1_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(30));

\Add2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~5_sumout\ = SUM(( n(31) ) + ( VCC ) + ( \Add2~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_n(31),
	cin => \Add2~2\,
	sumout => \Add2~5_sumout\);

\n[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add2~5_sumout\,
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n(31));

\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!n(30) & !n(31))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_n(30),
	datab => ALT_INV_n(31),
	combout => \Equal0~0_combout\);

\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( !n(28) & ( !n(29) & ( (!n(24) & (!n(25) & (!n(26) & !n(27)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_n(24),
	datab => ALT_INV_n(25),
	datac => ALT_INV_n(26),
	datad => ALT_INV_n(27),
	datae => ALT_INV_n(28),
	dataf => ALT_INV_n(29),
	combout => \Equal0~1_combout\);

\Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = ( !n(22) & ( !n(23) & ( (!n(18) & (!n(19) & (!n(20) & !n(21)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_n(18),
	datab => ALT_INV_n(19),
	datac => ALT_INV_n(20),
	datad => ALT_INV_n(21),
	datae => ALT_INV_n(22),
	dataf => ALT_INV_n(23),
	combout => \Equal0~2_combout\);

\Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = ( !n(16) & ( !n(17) & ( (!n(12) & (!n(13) & (!n(14) & !n(15)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_n(12),
	datab => ALT_INV_n(13),
	datac => ALT_INV_n(14),
	datad => ALT_INV_n(15),
	datae => ALT_INV_n(16),
	dataf => ALT_INV_n(17),
	combout => \Equal0~3_combout\);

\Equal0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = ( !n(3) & ( n(2) & ( (!n(7) & (!n(6) & (!n(5) & !n(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_n(7),
	datab => ALT_INV_n(6),
	datac => ALT_INV_n(5),
	datad => ALT_INV_n(4),
	datae => ALT_INV_n(3),
	dataf => ALT_INV_n(2),
	combout => \Equal0~4_combout\);

\Equal0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = ( !n(10) & ( !n(11) & ( (!n(1) & (!n(0) & (!n(8) & !n(9)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_n(1),
	datab => ALT_INV_n(0),
	datac => ALT_INV_n(8),
	datad => ALT_INV_n(9),
	datae => ALT_INV_n(10),
	dataf => ALT_INV_n(11),
	combout => \Equal0~5_combout\);

\Equal0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = ( \Equal0~4_combout\ & ( \Equal0~5_combout\ & ( (\Equal0~0_combout\ & (\Equal0~1_combout\ & (\Equal0~2_combout\ & \Equal0~3_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~0_combout\,
	datab => \ALT_INV_Equal0~1_combout\,
	datac => \ALT_INV_Equal0~2_combout\,
	datad => \ALT_INV_Equal0~3_combout\,
	datae => \ALT_INV_Equal0~4_combout\,
	dataf => \ALT_INV_Equal0~5_combout\,
	combout => \Equal0~6_combout\);

\state.initial\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.initial~q\);

\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (!\state.initial~q\) # ((\state.shift~q\ & !\Equal0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010011110100111101001111010011110100111101001111010011110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.shift~q\,
	datab => \ALT_INV_Equal0~6_combout\,
	datac => \ALT_INV_state.initial~q\,
	combout => \Selector0~0_combout\);

\state.get_A\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.get_A~q\);

\state.shift\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \state.get_A~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.shift~q\);

Q_1 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => tmp_Q(0),
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q_1~q\);

\M[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_M(3),
	o => \M[3]~input_o\);

\M[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_M(2),
	o => \M[2]~input_o\);

\M[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_M(1),
	o => \M[1]~input_o\);

\M[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_M(0),
	o => \M[0]~input_o\);

\Add0~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~18_cout\ = CARRY(( (!\Q_1~q\) # (tmp_Q(0)) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q_1~q\,
	datab => ALT_INV_tmp_Q(0),
	cin => GND,
	cout => \Add0~18_cout\);

\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( !\M[0]~input_o\ $ (((\Q_1~q\ & !tmp_Q(0)))) ) + ( A(0) ) + ( \Add0~18_cout\ ))
-- \Add0~2\ = CARRY(( !\M[0]~input_o\ $ (((\Q_1~q\ & !tmp_Q(0)))) ) + ( A(0) ) + ( \Add0~18_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001011101101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q_1~q\,
	datab => ALT_INV_tmp_Q(0),
	datad => \ALT_INV_M[0]~input_o\,
	dataf => ALT_INV_A(0),
	cin => \Add0~18_cout\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( !\M[1]~input_o\ $ (((\Q_1~q\ & !tmp_Q(0)))) ) + ( A(1) ) + ( \Add0~2\ ))
-- \Add0~6\ = CARRY(( !\M[1]~input_o\ $ (((\Q_1~q\ & !tmp_Q(0)))) ) + ( A(1) ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001011101101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q_1~q\,
	datab => ALT_INV_tmp_Q(0),
	datad => \ALT_INV_M[1]~input_o\,
	dataf => ALT_INV_A(1),
	cin => \Add0~2\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( !\M[2]~input_o\ $ (((\Q_1~q\ & !tmp_Q(0)))) ) + ( A(2) ) + ( \Add0~6\ ))
-- \Add0~10\ = CARRY(( !\M[2]~input_o\ $ (((\Q_1~q\ & !tmp_Q(0)))) ) + ( A(2) ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001011101101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q_1~q\,
	datab => ALT_INV_tmp_Q(0),
	datad => \ALT_INV_M[2]~input_o\,
	dataf => ALT_INV_A(2),
	cin => \Add0~6\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( !\M[3]~input_o\ $ (((\Q_1~q\ & !tmp_Q(0)))) ) + ( A(3) ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001011101101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q_1~q\,
	datab => ALT_INV_tmp_Q(0),
	datad => \ALT_INV_M[3]~input_o\,
	dataf => ALT_INV_A(3),
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\);

\A[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \A[3]~1_combout\ = ( \Add0~13_sumout\ & ( ((\state.get_A~q\ & (!tmp_Q(0) $ (!\Q_1~q\)))) # (A(3)) ) ) # ( !\Add0~13_sumout\ & ( (A(3) & ((!\state.get_A~q\) # (!tmp_Q(0) $ (\Q_1~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001000110001001101110011101100110010001100010011011100111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_tmp_Q(0),
	datab => ALT_INV_A(3),
	datac => \ALT_INV_state.get_A~q\,
	datad => \ALT_INV_Q_1~q\,
	datae => \ALT_INV_Add0~13_sumout\,
	combout => \A[3]~1_combout\);

\A[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \A[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A(3));

\tmp_A[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => A(3),
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tmp_A(2));

\Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (!\state.shift~q\ & ((\Add0~9_sumout\))) # (\state.shift~q\ & (tmp_A(2)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.shift~q\,
	datab => ALT_INV_tmp_A(2),
	datac => \ALT_INV_Add0~9_sumout\,
	combout => \Selector6~0_combout\);

\state.result~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \state.result~0_combout\ = ((\state.shift~q\ & \Equal0~6_combout\)) # (\state.result~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011101010111010101110101011101010111010101110101011101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.result~q\,
	datab => \ALT_INV_state.shift~q\,
	datac => \ALT_INV_Equal0~6_combout\,
	combout => \state.result~0_combout\);

\state.result\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \state.result~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.result~q\);

\A[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \A[0]~0_combout\ = ( \state.initial~q\ & ( (!\state.result~q\ & ((!\state.get_A~q\) # (!tmp_Q(0) $ (!\Q_1~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110001001100100000000000000000001100010011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_tmp_Q(0),
	datab => \ALT_INV_state.result~q\,
	datac => \ALT_INV_state.get_A~q\,
	datad => \ALT_INV_Q_1~q\,
	datae => \ALT_INV_state.initial~q\,
	combout => \A[0]~0_combout\);

\A[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector6~0_combout\,
	ena => \A[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A(2));

\tmp_A[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => A(2),
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tmp_A(1));

\Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (!\state.shift~q\ & ((\Add0~5_sumout\))) # (\state.shift~q\ & (tmp_A(1)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.shift~q\,
	datab => ALT_INV_tmp_A(1),
	datac => \ALT_INV_Add0~5_sumout\,
	combout => \Selector7~0_combout\);

\A[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector7~0_combout\,
	ena => \A[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A(1));

\tmp_A[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => A(1),
	ena => \state.shift~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tmp_A(0));

\Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (!\state.shift~q\ & ((\Add0~1_sumout\))) # (\state.shift~q\ & (tmp_A(0)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.shift~q\,
	datab => ALT_INV_tmp_A(0),
	datac => \ALT_INV_Add0~1_sumout\,
	combout => \Selector8~0_combout\);

\A[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector8~0_combout\,
	ena => \A[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A(0));

\Q[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Q(3),
	o => \Q[3]~input_o\);

\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (!\state.shift~q\ & ((\Q[3]~input_o\))) # (\state.shift~q\ & (A(0)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_A(0),
	datab => \ALT_INV_state.shift~q\,
	datac => \ALT_INV_Q[3]~input_o\,
	combout => \Selector2~0_combout\);

\tmp_Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \tmp_Q~0_combout\ = (!\state.result~q\ & !\state.get_A~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.result~q\,
	datab => \ALT_INV_state.get_A~q\,
	combout => \tmp_Q~0_combout\);

\tmp_Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector2~0_combout\,
	ena => \tmp_Q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tmp_Q(3));

\Q[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Q(2),
	o => \Q[2]~input_o\);

\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (!\state.shift~q\ & ((\Q[2]~input_o\))) # (\state.shift~q\ & (tmp_Q(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_tmp_Q(3),
	datab => \ALT_INV_state.shift~q\,
	datac => \ALT_INV_Q[2]~input_o\,
	combout => \Selector3~0_combout\);

\tmp_Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector3~0_combout\,
	ena => \tmp_Q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tmp_Q(2));

\Q[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Q(1),
	o => \Q[1]~input_o\);

\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (!\state.shift~q\ & ((\Q[1]~input_o\))) # (\state.shift~q\ & (tmp_Q(2)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_tmp_Q(2),
	datab => \ALT_INV_state.shift~q\,
	datac => \ALT_INV_Q[1]~input_o\,
	combout => \Selector4~0_combout\);

\tmp_Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector4~0_combout\,
	ena => \tmp_Q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tmp_Q(1));

\Q[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Q(0),
	o => \Q[0]~input_o\);

\Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (!\state.shift~q\ & ((\Q[0]~input_o\))) # (\state.shift~q\ & (tmp_Q(1)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_tmp_Q(1),
	datab => \ALT_INV_state.shift~q\,
	datac => \ALT_INV_Q[0]~input_o\,
	combout => \Selector5~0_combout\);

\tmp_Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector5~0_combout\,
	ena => \tmp_Q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tmp_Q(0));

\Mul[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => tmp_Q(0),
	ena => \state.result~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Mul[0]~reg0_q\);

\Mul[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => tmp_Q(1),
	ena => \state.result~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Mul[1]~reg0_q\);

\Mul[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => tmp_Q(2),
	ena => \state.result~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Mul[2]~reg0_q\);

\Mul[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => tmp_Q(3),
	ena => \state.result~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Mul[3]~reg0_q\);

\Mul[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => A(0),
	ena => \state.result~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Mul[4]~reg0_q\);

\Mul[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => A(1),
	ena => \state.result~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Mul[5]~reg0_q\);

\Mul[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => A(2),
	ena => \state.result~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Mul[6]~reg0_q\);

\Mul[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => A(3),
	ena => \state.result~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Mul[7]~reg0_q\);

\start~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

ww_Mul(0) <= \Mul[0]~output_o\;

ww_Mul(1) <= \Mul[1]~output_o\;

ww_Mul(2) <= \Mul[2]~output_o\;

ww_Mul(3) <= \Mul[3]~output_o\;

ww_Mul(4) <= \Mul[4]~output_o\;

ww_Mul(5) <= \Mul[5]~output_o\;

ww_Mul(6) <= \Mul[6]~output_o\;

ww_Mul(7) <= \Mul[7]~output_o\;
END structure;


