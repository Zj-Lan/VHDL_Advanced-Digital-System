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

-- DATE "04/20/2020 01:30:17"

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

ENTITY 	Q1_b IS
    PORT (
	clk : IN std_logic;
	test_Q_A : BUFFER std_logic;
	test_Q_B : BUFFER std_logic
	);
END Q1_b;

ARCHITECTURE structure OF Q1_b IS
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
SIGNAL ww_test_Q_A : std_logic;
SIGNAL ww_test_Q_B : std_logic;
SIGNAL \test_Q_A~output_o\ : std_logic;
SIGNAL \test_Q_B~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \T2|temp_Q~0_combout\ : std_logic;
SIGNAL \T2|temp_Q~q\ : std_logic;
SIGNAL \T1|temp_Q~0_combout\ : std_logic;
SIGNAL \T1|temp_Q~q\ : std_logic;
SIGNAL \T2|ALT_INV_temp_Q~q\ : std_logic;
SIGNAL \T1|ALT_INV_temp_Q~q\ : std_logic;

BEGIN

ww_clk <= clk;
test_Q_A <= ww_test_Q_A;
test_Q_B <= ww_test_Q_B;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\T2|ALT_INV_temp_Q~q\ <= NOT \T2|temp_Q~q\;
\T1|ALT_INV_temp_Q~q\ <= NOT \T1|temp_Q~q\;

\test_Q_A~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \T1|temp_Q~q\,
	devoe => ww_devoe,
	o => \test_Q_A~output_o\);

\test_Q_B~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \T2|temp_Q~q\,
	devoe => ww_devoe,
	o => \test_Q_B~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\T2|temp_Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \T2|temp_Q~0_combout\ = (!\T1|temp_Q~q\ & !\T2|temp_Q~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \T1|ALT_INV_temp_Q~q\,
	datab => \T2|ALT_INV_temp_Q~q\,
	combout => \T2|temp_Q~0_combout\);

\T2|temp_Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \T2|temp_Q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \T2|temp_Q~q\);

\T1|temp_Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \T1|temp_Q~0_combout\ = (!\T1|temp_Q~q\ & \T2|temp_Q~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \T1|ALT_INV_temp_Q~q\,
	datab => \T2|ALT_INV_temp_Q~q\,
	combout => \T1|temp_Q~0_combout\);

\T1|temp_Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \T1|temp_Q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \T1|temp_Q~q\);

ww_test_Q_A <= \test_Q_A~output_o\;

ww_test_Q_B <= \test_Q_B~output_o\;
END structure;


