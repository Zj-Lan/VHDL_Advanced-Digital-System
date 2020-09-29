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

-- DATE "04/21/2020 00:00:25"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Q3_D1_decoder IS
    PORT (
	code_ham : IN std_logic_vector(6 DOWNTO 0);
	parity : IN std_logic;
	code_ori : OUT std_logic_vector(3 DOWNTO 0);
	syndrome : OUT std_logic_vector(2 DOWNTO 0)
	);
END Q3_D1_decoder;

ARCHITECTURE structure OF Q3_D1_decoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_code_ham : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_parity : std_logic;
SIGNAL ww_code_ori : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_syndrome : std_logic_vector(2 DOWNTO 0);
SIGNAL \code_ori[0]~output_o\ : std_logic;
SIGNAL \code_ori[1]~output_o\ : std_logic;
SIGNAL \code_ori[2]~output_o\ : std_logic;
SIGNAL \code_ori[3]~output_o\ : std_logic;
SIGNAL \syndrome[0]~output_o\ : std_logic;
SIGNAL \syndrome[1]~output_o\ : std_logic;
SIGNAL \syndrome[2]~output_o\ : std_logic;
SIGNAL \code_ham[2]~input_o\ : std_logic;
SIGNAL \code_ham[4]~input_o\ : std_logic;
SIGNAL \code_ham[5]~input_o\ : std_logic;
SIGNAL \code_ham[6]~input_o\ : std_logic;
SIGNAL \code_ham[0]~input_o\ : std_logic;
SIGNAL \parity~input_o\ : std_logic;
SIGNAL \S1~0_combout\ : std_logic;
SIGNAL \code_ham[1]~input_o\ : std_logic;
SIGNAL \S2~0_combout\ : std_logic;
SIGNAL \code_ham[3]~input_o\ : std_logic;
SIGNAL \S3~0_combout\ : std_logic;
SIGNAL \ALT_INV_code_ham[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_code_ham[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_parity~input_o\ : std_logic;
SIGNAL \ALT_INV_code_ham[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_code_ham[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_code_ham[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_code_ham[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_code_ham[2]~input_o\ : std_logic;

BEGIN

ww_code_ham <= code_ham;
ww_parity <= parity;
code_ori <= ww_code_ori;
syndrome <= ww_syndrome;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_code_ham[3]~input_o\ <= NOT \code_ham[3]~input_o\;
\ALT_INV_code_ham[1]~input_o\ <= NOT \code_ham[1]~input_o\;
\ALT_INV_parity~input_o\ <= NOT \parity~input_o\;
\ALT_INV_code_ham[0]~input_o\ <= NOT \code_ham[0]~input_o\;
\ALT_INV_code_ham[6]~input_o\ <= NOT \code_ham[6]~input_o\;
\ALT_INV_code_ham[5]~input_o\ <= NOT \code_ham[5]~input_o\;
\ALT_INV_code_ham[4]~input_o\ <= NOT \code_ham[4]~input_o\;
\ALT_INV_code_ham[2]~input_o\ <= NOT \code_ham[2]~input_o\;

\code_ori[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \code_ham[2]~input_o\,
	devoe => ww_devoe,
	o => \code_ori[0]~output_o\);

\code_ori[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \code_ham[4]~input_o\,
	devoe => ww_devoe,
	o => \code_ori[1]~output_o\);

\code_ori[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \code_ham[5]~input_o\,
	devoe => ww_devoe,
	o => \code_ori[2]~output_o\);

\code_ori[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \code_ham[6]~input_o\,
	devoe => ww_devoe,
	o => \code_ori[3]~output_o\);

\syndrome[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \S1~0_combout\,
	devoe => ww_devoe,
	o => \syndrome[0]~output_o\);

\syndrome[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \S2~0_combout\,
	devoe => ww_devoe,
	o => \syndrome[1]~output_o\);

\syndrome[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \S3~0_combout\,
	devoe => ww_devoe,
	o => \syndrome[2]~output_o\);

\code_ham[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code_ham(2),
	o => \code_ham[2]~input_o\);

\code_ham[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code_ham(4),
	o => \code_ham[4]~input_o\);

\code_ham[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code_ham(5),
	o => \code_ham[5]~input_o\);

\code_ham[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code_ham(6),
	o => \code_ham[6]~input_o\);

\code_ham[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code_ham(0),
	o => \code_ham[0]~input_o\);

\parity~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_parity,
	o => \parity~input_o\);

\S1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \S1~0_combout\ = ( \parity~input_o\ & ( !\code_ham[2]~input_o\ $ (!\code_ham[4]~input_o\ $ (!\code_ham[6]~input_o\ $ (\code_ham[0]~input_o\))) ) ) # ( !\parity~input_o\ & ( !\code_ham[2]~input_o\ $ (!\code_ham[4]~input_o\ $ (!\code_ham[6]~input_o\ $ 
-- (!\code_ham[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100110010110100101100110100101101001100101101001011001101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code_ham[2]~input_o\,
	datab => \ALT_INV_code_ham[4]~input_o\,
	datac => \ALT_INV_code_ham[6]~input_o\,
	datad => \ALT_INV_code_ham[0]~input_o\,
	datae => \ALT_INV_parity~input_o\,
	combout => \S1~0_combout\);

\code_ham[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code_ham(1),
	o => \code_ham[1]~input_o\);

\S2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \S2~0_combout\ = ( \code_ham[1]~input_o\ & ( !\code_ham[2]~input_o\ $ (!\code_ham[5]~input_o\ $ (!\code_ham[6]~input_o\ $ (\parity~input_o\))) ) ) # ( !\code_ham[1]~input_o\ & ( !\code_ham[2]~input_o\ $ (!\code_ham[5]~input_o\ $ (!\code_ham[6]~input_o\ $ 
-- (!\parity~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100110010110100101100110100101101001100101101001011001101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code_ham[2]~input_o\,
	datab => \ALT_INV_code_ham[5]~input_o\,
	datac => \ALT_INV_code_ham[6]~input_o\,
	datad => \ALT_INV_parity~input_o\,
	datae => \ALT_INV_code_ham[1]~input_o\,
	combout => \S2~0_combout\);

\code_ham[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code_ham(3),
	o => \code_ham[3]~input_o\);

\S3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \S3~0_combout\ = ( \code_ham[3]~input_o\ & ( !\code_ham[4]~input_o\ $ (!\code_ham[5]~input_o\ $ (!\code_ham[6]~input_o\ $ (\parity~input_o\))) ) ) # ( !\code_ham[3]~input_o\ & ( !\code_ham[4]~input_o\ $ (!\code_ham[5]~input_o\ $ (!\code_ham[6]~input_o\ $ 
-- (!\parity~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100110010110100101100110100101101001100101101001011001101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code_ham[4]~input_o\,
	datab => \ALT_INV_code_ham[5]~input_o\,
	datac => \ALT_INV_code_ham[6]~input_o\,
	datad => \ALT_INV_parity~input_o\,
	datae => \ALT_INV_code_ham[3]~input_o\,
	combout => \S3~0_combout\);

ww_code_ori(0) <= \code_ori[0]~output_o\;

ww_code_ori(1) <= \code_ori[1]~output_o\;

ww_code_ori(2) <= \code_ori[2]~output_o\;

ww_code_ori(3) <= \code_ori[3]~output_o\;

ww_syndrome(0) <= \syndrome[0]~output_o\;

ww_syndrome(1) <= \syndrome[1]~output_o\;

ww_syndrome(2) <= \syndrome[2]~output_o\;
END structure;


