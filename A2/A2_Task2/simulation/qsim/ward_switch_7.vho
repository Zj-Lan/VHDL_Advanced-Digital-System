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

-- DATE "02/16/2020 23:39:54"

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

ENTITY 	ward_switch_7 IS
    PORT (
	input : IN std_logic_vector(7 DOWNTO 0);
	output : OUT std_logic_vector(6 DOWNTO 0);
	signal_3 : OUT std_logic_vector(2 DOWNTO 0)
	);
END ward_switch_7;

-- Design Ports Information
-- output[0]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[1]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[2]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[3]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[4]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[5]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[6]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- signal_3[0]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- signal_3[1]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- signal_3[2]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[5]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[3]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[4]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[1]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[2]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[6]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[7]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[0]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ward_switch_7 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_output : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_signal_3 : std_logic_vector(2 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \input[2]~input_o\ : std_logic;
SIGNAL \input[1]~input_o\ : std_logic;
SIGNAL \input[5]~input_o\ : std_logic;
SIGNAL \input[4]~input_o\ : std_logic;
SIGNAL \input[3]~input_o\ : std_logic;
SIGNAL \encoder|encoder_out[2]~0_combout\ : std_logic;
SIGNAL \input[7]~input_o\ : std_logic;
SIGNAL \input[6]~input_o\ : std_logic;
SIGNAL \decoder|Mux6~0_combout\ : std_logic;
SIGNAL \input[0]~input_o\ : std_logic;
SIGNAL \decoder|Mux5~0_combout\ : std_logic;
SIGNAL \encoder|encoder_out[0]~1_combout\ : std_logic;
SIGNAL \decoder|Mux4~0_combout\ : std_logic;
SIGNAL \decoder|Mux3~0_combout\ : std_logic;
SIGNAL \decoder|Mux3~1_combout\ : std_logic;
SIGNAL \encoder|encoder_out[2]~4_combout\ : std_logic;
SIGNAL \encoder|encoder_out~3_combout\ : std_logic;
SIGNAL \encoder|encoder_out[0]~2_combout\ : std_logic;
SIGNAL \decoder|Mux2~0_combout\ : std_logic;
SIGNAL \decoder|Mux1~0_combout\ : std_logic;
SIGNAL \decoder|Mux0~0_combout\ : std_logic;
SIGNAL \encoder|encoder_out[0]~5_combout\ : std_logic;
SIGNAL \encoder|encoder_out[1]~6_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out[2]~0_combout\ : std_logic;
SIGNAL \ALT_INV_input[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[2]~input_o\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out[0]~1_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out[0]~2_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out~3_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out[2]~4_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \ALT_INV_input[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[0]~input_o\ : std_logic;

BEGIN

ww_input <= input;
output <= ww_output;
signal_3 <= ww_signal_3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\encoder|ALT_INV_encoder_out[2]~0_combout\ <= NOT \encoder|encoder_out[2]~0_combout\;
\ALT_INV_input[1]~input_o\ <= NOT \input[1]~input_o\;
\ALT_INV_input[2]~input_o\ <= NOT \input[2]~input_o\;
\encoder|ALT_INV_encoder_out[0]~1_combout\ <= NOT \encoder|encoder_out[0]~1_combout\;
\decoder|ALT_INV_Mux4~0_combout\ <= NOT \decoder|Mux4~0_combout\;
\decoder|ALT_INV_Mux3~0_combout\ <= NOT \decoder|Mux3~0_combout\;
\encoder|ALT_INV_encoder_out[0]~2_combout\ <= NOT \encoder|encoder_out[0]~2_combout\;
\encoder|ALT_INV_encoder_out~3_combout\ <= NOT \encoder|encoder_out~3_combout\;
\encoder|ALT_INV_encoder_out[2]~4_combout\ <= NOT \encoder|encoder_out[2]~4_combout\;
\decoder|ALT_INV_Mux2~0_combout\ <= NOT \decoder|Mux2~0_combout\;
\ALT_INV_input[5]~input_o\ <= NOT \input[5]~input_o\;
\ALT_INV_input[3]~input_o\ <= NOT \input[3]~input_o\;
\ALT_INV_input[4]~input_o\ <= NOT \input[4]~input_o\;
\ALT_INV_input[6]~input_o\ <= NOT \input[6]~input_o\;
\ALT_INV_input[7]~input_o\ <= NOT \input[7]~input_o\;
\ALT_INV_input[0]~input_o\ <= NOT \input[0]~input_o\;

-- Location: IOOBUF_X89_Y36_N22
\output[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_output(0));

-- Location: IOOBUF_X89_Y36_N5
\output[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_output(1));

-- Location: IOOBUF_X89_Y37_N5
\output[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_output(2));

-- Location: IOOBUF_X89_Y35_N96
\output[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux3~1_combout\,
	devoe => ww_devoe,
	o => ww_output(3));

-- Location: IOOBUF_X89_Y35_N79
\output[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_output(4));

-- Location: IOOBUF_X89_Y9_N56
\output[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_output(5));

-- Location: IOOBUF_X89_Y35_N62
\output[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_output(6));

-- Location: IOOBUF_X89_Y36_N39
\signal_3[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \encoder|encoder_out[0]~5_combout\,
	devoe => ww_devoe,
	o => ww_signal_3(0));

-- Location: IOOBUF_X89_Y9_N5
\signal_3[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \encoder|encoder_out[1]~6_combout\,
	devoe => ww_devoe,
	o => ww_signal_3(1));

-- Location: IOOBUF_X89_Y35_N45
\signal_3[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \encoder|encoder_out[2]~4_combout\,
	devoe => ww_devoe,
	o => ww_signal_3(2));

-- Location: IOIBUF_X89_Y37_N21
\input[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(2),
	o => \input[2]~input_o\);

-- Location: IOIBUF_X89_Y37_N38
\input[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(1),
	o => \input[1]~input_o\);

-- Location: IOIBUF_X89_Y36_N55
\input[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(5),
	o => \input[5]~input_o\);

-- Location: IOIBUF_X89_Y38_N55
\input[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(4),
	o => \input[4]~input_o\);

-- Location: IOIBUF_X89_Y38_N38
\input[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(3),
	o => \input[3]~input_o\);

-- Location: LABCELL_X88_Y37_N30
\encoder|encoder_out[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[2]~0_combout\ = ( !\input[3]~input_o\ & ( (!\input[5]~input_o\ & !\input[4]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_input[5]~input_o\,
	datad => \ALT_INV_input[4]~input_o\,
	dataf => \ALT_INV_input[3]~input_o\,
	combout => \encoder|encoder_out[2]~0_combout\);

-- Location: IOIBUF_X89_Y37_N55
\input[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(7),
	o => \input[7]~input_o\);

-- Location: IOIBUF_X89_Y38_N4
\input[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(6),
	o => \input[6]~input_o\);

-- Location: LABCELL_X88_Y37_N33
\decoder|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux6~0_combout\ = ( !\input[6]~input_o\ & ( (!\input[7]~input_o\ & (((!\encoder|encoder_out[2]~0_combout\) # (\input[1]~input_o\)) # (\input[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111011100000000111101110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[2]~input_o\,
	datab => \ALT_INV_input[1]~input_o\,
	datac => \encoder|ALT_INV_encoder_out[2]~0_combout\,
	datad => \ALT_INV_input[7]~input_o\,
	dataf => \ALT_INV_input[6]~input_o\,
	combout => \decoder|Mux6~0_combout\);

-- Location: IOIBUF_X89_Y38_N21
\input[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(0),
	o => \input[0]~input_o\);

-- Location: LABCELL_X88_Y37_N6
\decoder|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux5~0_combout\ = ( \input[0]~input_o\ & ( \input[6]~input_o\ & ( \input[7]~input_o\ ) ) ) # ( !\input[0]~input_o\ & ( \input[6]~input_o\ & ( \input[7]~input_o\ ) ) ) # ( \input[0]~input_o\ & ( !\input[6]~input_o\ & ( 
-- (!\encoder|encoder_out[2]~0_combout\) # (\input[7]~input_o\) ) ) ) # ( !\input[0]~input_o\ & ( !\input[6]~input_o\ & ( ((!\encoder|encoder_out[2]~0_combout\) # ((!\input[2]~input_o\ & !\input[1]~input_o\))) # (\input[7]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110111011101110111011101110101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[7]~input_o\,
	datab => \encoder|ALT_INV_encoder_out[2]~0_combout\,
	datac => \ALT_INV_input[2]~input_o\,
	datad => \ALT_INV_input[1]~input_o\,
	datae => \ALT_INV_input[0]~input_o\,
	dataf => \ALT_INV_input[6]~input_o\,
	combout => \decoder|Mux5~0_combout\);

-- Location: LABCELL_X88_Y37_N42
\encoder|encoder_out[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[0]~1_combout\ = ( !\input[3]~input_o\ & ( (!\input[5]~input_o\ & (((!\input[1]~input_o\ & \input[0]~input_o\)) # (\input[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101010001010000010101000101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[5]~input_o\,
	datab => \ALT_INV_input[1]~input_o\,
	datac => \ALT_INV_input[2]~input_o\,
	datad => \ALT_INV_input[0]~input_o\,
	dataf => \ALT_INV_input[3]~input_o\,
	combout => \encoder|encoder_out[0]~1_combout\);

-- Location: LABCELL_X88_Y37_N18
\decoder|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux4~0_combout\ = ( \input[5]~input_o\ & ( \input[3]~input_o\ & ( (!\input[7]~input_o\ & ((\input[6]~input_o\) # (\encoder|encoder_out[0]~1_combout\))) ) ) ) # ( !\input[5]~input_o\ & ( \input[3]~input_o\ & ( !\input[7]~input_o\ ) ) ) # ( 
-- \input[5]~input_o\ & ( !\input[3]~input_o\ & ( (!\input[7]~input_o\ & ((\input[6]~input_o\) # (\encoder|encoder_out[0]~1_combout\))) ) ) ) # ( !\input[5]~input_o\ & ( !\input[3]~input_o\ & ( (!\input[7]~input_o\ & (((\input[6]~input_o\) # 
-- (\encoder|encoder_out[0]~1_combout\)) # (\input[4]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000011110000001100001111000011110000111100000011000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[4]~input_o\,
	datab => \encoder|ALT_INV_encoder_out[0]~1_combout\,
	datac => \ALT_INV_input[7]~input_o\,
	datad => \ALT_INV_input[6]~input_o\,
	datae => \ALT_INV_input[5]~input_o\,
	dataf => \ALT_INV_input[3]~input_o\,
	combout => \decoder|Mux4~0_combout\);

-- Location: LABCELL_X88_Y37_N27
\decoder|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux3~0_combout\ = ( \input[0]~input_o\ & ( !\input[3]~input_o\ & ( (\input[1]~input_o\) # (\input[2]~input_o\) ) ) ) # ( !\input[0]~input_o\ & ( !\input[3]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111010111110101111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[2]~input_o\,
	datac => \ALT_INV_input[1]~input_o\,
	datae => \ALT_INV_input[0]~input_o\,
	dataf => \ALT_INV_input[3]~input_o\,
	combout => \decoder|Mux3~0_combout\);

-- Location: LABCELL_X88_Y37_N0
\decoder|Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux3~1_combout\ = ( \input[6]~input_o\ & ( \input[7]~input_o\ ) ) # ( !\input[6]~input_o\ & ( (((\input[5]~input_o\) # (\decoder|Mux3~0_combout\)) # (\input[4]~input_o\)) # (\input[7]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111111111111011111111111111101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[7]~input_o\,
	datab => \ALT_INV_input[4]~input_o\,
	datac => \decoder|ALT_INV_Mux3~0_combout\,
	datad => \ALT_INV_input[5]~input_o\,
	dataf => \ALT_INV_input[6]~input_o\,
	combout => \decoder|Mux3~1_combout\);

-- Location: LABCELL_X88_Y37_N15
\encoder|encoder_out[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[2]~4_combout\ = ( \input[5]~input_o\ & ( \input[4]~input_o\ & ( !\input[7]~input_o\ ) ) ) # ( !\input[5]~input_o\ & ( \input[4]~input_o\ & ( !\input[7]~input_o\ ) ) ) # ( \input[5]~input_o\ & ( !\input[4]~input_o\ & ( 
-- !\input[7]~input_o\ ) ) ) # ( !\input[5]~input_o\ & ( !\input[4]~input_o\ & ( (!\input[7]~input_o\ & ((\input[6]~input_o\) # (\input[3]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101000101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[7]~input_o\,
	datab => \ALT_INV_input[3]~input_o\,
	datac => \ALT_INV_input[6]~input_o\,
	datae => \ALT_INV_input[5]~input_o\,
	dataf => \ALT_INV_input[4]~input_o\,
	combout => \encoder|encoder_out[2]~4_combout\);

-- Location: LABCELL_X88_Y37_N36
\encoder|encoder_out~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out~3_combout\ = ( !\input[5]~input_o\ & ( \input[3]~input_o\ & ( !\input[6]~input_o\ ) ) ) # ( !\input[5]~input_o\ & ( !\input[3]~input_o\ & ( (!\input[6]~input_o\ & (((!\input[1]~input_o\ & !\input[2]~input_o\)) # (\input[4]~input_o\))) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101010100000000000000000000000011111111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[4]~input_o\,
	datab => \ALT_INV_input[1]~input_o\,
	datac => \ALT_INV_input[2]~input_o\,
	datad => \ALT_INV_input[6]~input_o\,
	datae => \ALT_INV_input[5]~input_o\,
	dataf => \ALT_INV_input[3]~input_o\,
	combout => \encoder|encoder_out~3_combout\);

-- Location: LABCELL_X88_Y37_N45
\encoder|encoder_out[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[0]~2_combout\ = ( \input[4]~input_o\ & ( (\input[5]~input_o\ & !\input[6]~input_o\) ) ) # ( !\input[4]~input_o\ & ( !\input[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000001010000010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[5]~input_o\,
	datac => \ALT_INV_input[6]~input_o\,
	dataf => \ALT_INV_input[4]~input_o\,
	combout => \encoder|encoder_out[0]~2_combout\);

-- Location: LABCELL_X88_Y37_N48
\decoder|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux2~0_combout\ = ( !\encoder|encoder_out[0]~1_combout\ & ( (!\input[7]~input_o\ & (!\encoder|encoder_out[2]~4_combout\ & (!\encoder|encoder_out~3_combout\ & \encoder|encoder_out[0]~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000001000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[7]~input_o\,
	datab => \encoder|ALT_INV_encoder_out[2]~4_combout\,
	datac => \encoder|ALT_INV_encoder_out~3_combout\,
	datad => \encoder|ALT_INV_encoder_out[0]~2_combout\,
	dataf => \encoder|ALT_INV_encoder_out[0]~1_combout\,
	combout => \decoder|Mux2~0_combout\);

-- Location: LABCELL_X88_Y37_N51
\decoder|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux1~0_combout\ = ( \encoder|encoder_out[0]~1_combout\ & ( ((!\encoder|encoder_out[2]~4_combout\) # (!\encoder|encoder_out~3_combout\)) # (\input[7]~input_o\) ) ) # ( !\encoder|encoder_out[0]~1_combout\ & ( ((!\encoder|encoder_out[2]~4_combout\) 
-- # (!\encoder|encoder_out[0]~2_combout\ $ (\encoder|encoder_out~3_combout\))) # (\input[7]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110111011111111111011101111111111111110111011111111111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[7]~input_o\,
	datab => \encoder|ALT_INV_encoder_out[2]~4_combout\,
	datac => \encoder|ALT_INV_encoder_out[0]~2_combout\,
	datad => \encoder|ALT_INV_encoder_out~3_combout\,
	dataf => \encoder|ALT_INV_encoder_out[0]~1_combout\,
	combout => \decoder|Mux1~0_combout\);

-- Location: LABCELL_X88_Y37_N54
\decoder|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux0~0_combout\ = ( \encoder|encoder_out[2]~4_combout\ & ( (!\input[7]~input_o\ & (((!\encoder|encoder_out~3_combout\) # (!\encoder|encoder_out[0]~2_combout\)) # (\encoder|encoder_out[0]~1_combout\))) ) ) # ( !\encoder|encoder_out[2]~4_combout\ & 
-- ( ((!\encoder|encoder_out~3_combout\) # ((!\encoder|encoder_out[0]~1_combout\ & \encoder|encoder_out[0]~2_combout\))) # (\input[7]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010111111101111101011111110110101010101000101010101010100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[7]~input_o\,
	datab => \encoder|ALT_INV_encoder_out[0]~1_combout\,
	datac => \encoder|ALT_INV_encoder_out~3_combout\,
	datad => \encoder|ALT_INV_encoder_out[0]~2_combout\,
	dataf => \encoder|ALT_INV_encoder_out[2]~4_combout\,
	combout => \decoder|Mux0~0_combout\);

-- Location: LABCELL_X88_Y37_N3
\encoder|encoder_out[0]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[0]~5_combout\ = ( \encoder|encoder_out[0]~1_combout\ & ( !\input[7]~input_o\ ) ) # ( !\encoder|encoder_out[0]~1_combout\ & ( (!\input[7]~input_o\ & !\encoder|encoder_out[0]~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000101000001010000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[7]~input_o\,
	datac => \encoder|ALT_INV_encoder_out[0]~2_combout\,
	dataf => \encoder|ALT_INV_encoder_out[0]~1_combout\,
	combout => \encoder|encoder_out[0]~5_combout\);

-- Location: LABCELL_X88_Y37_N57
\encoder|encoder_out[1]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[1]~6_combout\ = (!\input[7]~input_o\ & !\encoder|encoder_out~3_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000000010101010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[7]~input_o\,
	datad => \encoder|ALT_INV_encoder_out~3_combout\,
	combout => \encoder|encoder_out[1]~6_combout\);

-- Location: LABCELL_X29_Y16_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


