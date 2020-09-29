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

-- DATE "02/17/2020 01:50:37"

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

ENTITY 	ward_switch_15 IS
    PORT (
	input : IN std_logic_vector(15 DOWNTO 0);
	output : OUT std_logic_vector(13 DOWNTO 0);
	signal_4 : OUT std_logic_vector(3 DOWNTO 0)
	);
END ward_switch_15;

-- Design Ports Information
-- output[0]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[1]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[2]	=>  Location: PIN_V19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[3]	=>  Location: PIN_U17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[4]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[5]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[6]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[7]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[8]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[9]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[10]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[11]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[12]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[13]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- signal_4[0]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- signal_4[1]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- signal_4[2]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- signal_4[3]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[15]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[13]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[11]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[8]	=>  Location: PIN_Y20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[9]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[5]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[2]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[0]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[1]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[3]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[6]	=>  Location: PIN_V20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[4]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[7]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[14]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[12]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[10]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ward_switch_15 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_output : std_logic_vector(13 DOWNTO 0);
SIGNAL ww_signal_4 : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \input[15]~input_o\ : std_logic;
SIGNAL \input[13]~input_o\ : std_logic;
SIGNAL \input[10]~input_o\ : std_logic;
SIGNAL \input[9]~input_o\ : std_logic;
SIGNAL \encoder|encoder_out~10_combout\ : std_logic;
SIGNAL \input[14]~input_o\ : std_logic;
SIGNAL \input[12]~input_o\ : std_logic;
SIGNAL \input[11]~input_o\ : std_logic;
SIGNAL \input[8]~input_o\ : std_logic;
SIGNAL \input[7]~input_o\ : std_logic;
SIGNAL \encoder|encoder_out~6_combout\ : std_logic;
SIGNAL \encoder|encoder_out[3]~14_combout\ : std_logic;
SIGNAL \encoder|encoder_out~4_combout\ : std_logic;
SIGNAL \input[2]~input_o\ : std_logic;
SIGNAL \input[5]~input_o\ : std_logic;
SIGNAL \input[1]~input_o\ : std_logic;
SIGNAL \input[0]~input_o\ : std_logic;
SIGNAL \input[3]~input_o\ : std_logic;
SIGNAL \encoder|encoder_out~1_combout\ : std_logic;
SIGNAL \input[6]~input_o\ : std_logic;
SIGNAL \input[4]~input_o\ : std_logic;
SIGNAL \encoder|encoder_out~2_combout\ : std_logic;
SIGNAL \encoder|encoder_out~3_combout\ : std_logic;
SIGNAL \encoder|encoder_out~0_combout\ : std_logic;
SIGNAL \encoder|encoder_out[0]~5_combout\ : std_logic;
SIGNAL \encoder|encoder_out[2]~12_combout\ : std_logic;
SIGNAL \encoder|encoder_out~11_combout\ : std_logic;
SIGNAL \encoder|encoder_out[2]~13_combout\ : std_logic;
SIGNAL \encoder|encoder_out[1]~7_combout\ : std_logic;
SIGNAL \encoder|encoder_out[1]~8_combout\ : std_logic;
SIGNAL \encoder|encoder_out[1]~9_combout\ : std_logic;
SIGNAL \decoder|Mux10~0_combout\ : std_logic;
SIGNAL \decoder|Mux9~0_combout\ : std_logic;
SIGNAL \decoder|Mux8~0_combout\ : std_logic;
SIGNAL \decoder|Mux7~0_combout\ : std_logic;
SIGNAL \decoder|Mux6~0_combout\ : std_logic;
SIGNAL \decoder|Mux5~0_combout\ : std_logic;
SIGNAL \decoder|Mux4~0_combout\ : std_logic;
SIGNAL \encoder|encoder_out~15_combout\ : std_logic;
SIGNAL \decoder|Mux3~0_combout\ : std_logic;
SIGNAL \ALT_INV_input[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[15]~input_o\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out~15_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux8~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out[3]~14_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out[2]~13_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out[2]~12_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out~11_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out~10_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out[1]~9_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out[1]~8_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out[1]~7_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out~6_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out[0]~5_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out~4_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out~3_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out~2_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out~1_combout\ : std_logic;
SIGNAL \encoder|ALT_INV_encoder_out~0_combout\ : std_logic;
SIGNAL \ALT_INV_input[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[5]~input_o\ : std_logic;

BEGIN

ww_input <= input;
output <= ww_output;
signal_4 <= ww_signal_4;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_input[9]~input_o\ <= NOT \input[9]~input_o\;
\ALT_INV_input[8]~input_o\ <= NOT \input[8]~input_o\;
\ALT_INV_input[11]~input_o\ <= NOT \input[11]~input_o\;
\ALT_INV_input[13]~input_o\ <= NOT \input[13]~input_o\;
\ALT_INV_input[15]~input_o\ <= NOT \input[15]~input_o\;
\encoder|ALT_INV_encoder_out~15_combout\ <= NOT \encoder|encoder_out~15_combout\;
\decoder|ALT_INV_Mux4~0_combout\ <= NOT \decoder|Mux4~0_combout\;
\decoder|ALT_INV_Mux5~0_combout\ <= NOT \decoder|Mux5~0_combout\;
\decoder|ALT_INV_Mux6~0_combout\ <= NOT \decoder|Mux6~0_combout\;
\decoder|ALT_INV_Mux7~0_combout\ <= NOT \decoder|Mux7~0_combout\;
\decoder|ALT_INV_Mux8~0_combout\ <= NOT \decoder|Mux8~0_combout\;
\decoder|ALT_INV_Mux9~0_combout\ <= NOT \decoder|Mux9~0_combout\;
\encoder|ALT_INV_encoder_out[3]~14_combout\ <= NOT \encoder|encoder_out[3]~14_combout\;
\encoder|ALT_INV_encoder_out[2]~13_combout\ <= NOT \encoder|encoder_out[2]~13_combout\;
\encoder|ALT_INV_encoder_out[2]~12_combout\ <= NOT \encoder|encoder_out[2]~12_combout\;
\encoder|ALT_INV_encoder_out~11_combout\ <= NOT \encoder|encoder_out~11_combout\;
\encoder|ALT_INV_encoder_out~10_combout\ <= NOT \encoder|encoder_out~10_combout\;
\encoder|ALT_INV_encoder_out[1]~9_combout\ <= NOT \encoder|encoder_out[1]~9_combout\;
\encoder|ALT_INV_encoder_out[1]~8_combout\ <= NOT \encoder|encoder_out[1]~8_combout\;
\encoder|ALT_INV_encoder_out[1]~7_combout\ <= NOT \encoder|encoder_out[1]~7_combout\;
\encoder|ALT_INV_encoder_out~6_combout\ <= NOT \encoder|encoder_out~6_combout\;
\encoder|ALT_INV_encoder_out[0]~5_combout\ <= NOT \encoder|encoder_out[0]~5_combout\;
\encoder|ALT_INV_encoder_out~4_combout\ <= NOT \encoder|encoder_out~4_combout\;
\encoder|ALT_INV_encoder_out~3_combout\ <= NOT \encoder|encoder_out~3_combout\;
\encoder|ALT_INV_encoder_out~2_combout\ <= NOT \encoder|encoder_out~2_combout\;
\encoder|ALT_INV_encoder_out~1_combout\ <= NOT \encoder|encoder_out~1_combout\;
\encoder|ALT_INV_encoder_out~0_combout\ <= NOT \encoder|encoder_out~0_combout\;
\ALT_INV_input[10]~input_o\ <= NOT \input[10]~input_o\;
\ALT_INV_input[12]~input_o\ <= NOT \input[12]~input_o\;
\ALT_INV_input[14]~input_o\ <= NOT \input[14]~input_o\;
\ALT_INV_input[7]~input_o\ <= NOT \input[7]~input_o\;
\ALT_INV_input[4]~input_o\ <= NOT \input[4]~input_o\;
\ALT_INV_input[6]~input_o\ <= NOT \input[6]~input_o\;
\ALT_INV_input[3]~input_o\ <= NOT \input[3]~input_o\;
\ALT_INV_input[1]~input_o\ <= NOT \input[1]~input_o\;
\ALT_INV_input[0]~input_o\ <= NOT \input[0]~input_o\;
\ALT_INV_input[2]~input_o\ <= NOT \input[2]~input_o\;
\ALT_INV_input[5]~input_o\ <= NOT \input[5]~input_o\;

-- Location: IOOBUF_X70_Y0_N36
\output[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux10~0_combout\,
	devoe => ww_devoe,
	o => ww_output(0));

-- Location: IOOBUF_X70_Y0_N2
\output[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_Mux9~0_combout\,
	devoe => ww_devoe,
	o => ww_output(1));

-- Location: IOOBUF_X70_Y0_N19
\output[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_Mux8~0_combout\,
	devoe => ww_devoe,
	o => ww_output(2));

-- Location: IOOBUF_X72_Y0_N2
\output[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_Mux7~0_combout\,
	devoe => ww_devoe,
	o => ww_output(3));

-- Location: IOOBUF_X72_Y0_N53
\output[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_output(4));

-- Location: IOOBUF_X89_Y4_N62
\output[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_output(5));

-- Location: IOOBUF_X70_Y0_N53
\output[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_output(6));

-- Location: IOOBUF_X56_Y81_N53
\output[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_output(7));

-- Location: IOOBUF_X60_Y0_N19
\output[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_output(8));

-- Location: IOOBUF_X60_Y0_N2
\output[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_output(9));

-- Location: IOOBUF_X60_Y0_N36
\output[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_output(10));

-- Location: IOOBUF_X64_Y81_N19
\output[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_output(11));

-- Location: IOOBUF_X64_Y81_N36
\output[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_output(12));

-- Location: IOOBUF_X60_Y0_N53
\output[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_output(13));

-- Location: IOOBUF_X72_Y0_N36
\signal_4[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \encoder|encoder_out[0]~5_combout\,
	devoe => ww_devoe,
	o => ww_signal_4(0));

-- Location: IOOBUF_X66_Y0_N42
\signal_4[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \encoder|encoder_out[1]~9_combout\,
	devoe => ww_devoe,
	o => ww_signal_4(1));

-- Location: IOOBUF_X68_Y0_N2
\signal_4[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \encoder|encoder_out[2]~13_combout\,
	devoe => ww_devoe,
	o => ww_signal_4(2));

-- Location: IOOBUF_X68_Y0_N53
\signal_4[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \encoder|encoder_out[3]~14_combout\,
	devoe => ww_devoe,
	o => ww_signal_4(3));

-- Location: IOIBUF_X68_Y0_N18
\input[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(15),
	o => \input[15]~input_o\);

-- Location: IOIBUF_X64_Y0_N35
\input[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(13),
	o => \input[13]~input_o\);

-- Location: IOIBUF_X64_Y0_N18
\input[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(10),
	o => \input[10]~input_o\);

-- Location: IOIBUF_X72_Y0_N18
\input[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(9),
	o => \input[9]~input_o\);

-- Location: LABCELL_X66_Y1_N6
\encoder|encoder_out~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out~10_combout\ = (!\input[10]~input_o\ & !\input[9]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_input[10]~input_o\,
	datad => \ALT_INV_input[9]~input_o\,
	combout => \encoder|encoder_out~10_combout\);

-- Location: IOIBUF_X54_Y0_N18
\input[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(14),
	o => \input[14]~input_o\);

-- Location: IOIBUF_X64_Y0_N1
\input[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(12),
	o => \input[12]~input_o\);

-- Location: IOIBUF_X64_Y0_N52
\input[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(11),
	o => \input[11]~input_o\);

-- Location: IOIBUF_X66_Y0_N58
\input[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(8),
	o => \input[8]~input_o\);

-- Location: IOIBUF_X66_Y0_N75
\input[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(7),
	o => \input[7]~input_o\);

-- Location: LABCELL_X66_Y1_N15
\encoder|encoder_out~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out~6_combout\ = ( !\input[7]~input_o\ & ( (!\input[12]~input_o\ & (!\input[11]~input_o\ & !\input[8]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[12]~input_o\,
	datab => \ALT_INV_input[11]~input_o\,
	datac => \ALT_INV_input[8]~input_o\,
	dataf => \ALT_INV_input[7]~input_o\,
	combout => \encoder|encoder_out~6_combout\);

-- Location: LABCELL_X66_Y1_N45
\encoder|encoder_out[3]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[3]~14_combout\ = ( \encoder|encoder_out~6_combout\ & ( (!\input[15]~input_o\ & (((!\encoder|encoder_out~10_combout\) # (\input[14]~input_o\)) # (\input[13]~input_o\))) ) ) # ( !\encoder|encoder_out~6_combout\ & ( !\input[15]~input_o\ 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010100010101010101010001010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[15]~input_o\,
	datab => \ALT_INV_input[13]~input_o\,
	datac => \encoder|ALT_INV_encoder_out~10_combout\,
	datad => \ALT_INV_input[14]~input_o\,
	dataf => \encoder|ALT_INV_encoder_out~6_combout\,
	combout => \encoder|encoder_out[3]~14_combout\);

-- Location: LABCELL_X66_Y1_N12
\encoder|encoder_out~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out~4_combout\ = ( \input[13]~input_o\ & ( !\input[14]~input_o\ ) ) # ( !\input[13]~input_o\ & ( (!\input[12]~input_o\ & (!\input[14]~input_o\ & ((!\input[10]~input_o\) # (\input[11]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001000000000101000100000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[12]~input_o\,
	datab => \ALT_INV_input[11]~input_o\,
	datac => \ALT_INV_input[10]~input_o\,
	datad => \ALT_INV_input[14]~input_o\,
	dataf => \ALT_INV_input[13]~input_o\,
	combout => \encoder|encoder_out~4_combout\);

-- Location: IOIBUF_X66_Y0_N92
\input[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(2),
	o => \input[2]~input_o\);

-- Location: IOIBUF_X62_Y0_N35
\input[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(5),
	o => \input[5]~input_o\);

-- Location: IOIBUF_X62_Y0_N1
\input[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(1),
	o => \input[1]~input_o\);

-- Location: IOIBUF_X62_Y0_N52
\input[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(0),
	o => \input[0]~input_o\);

-- Location: IOIBUF_X68_Y0_N35
\input[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(3),
	o => \input[3]~input_o\);

-- Location: LABCELL_X66_Y1_N39
\encoder|encoder_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out~1_combout\ = ( !\input[3]~input_o\ & ( (!\input[5]~input_o\ & (((!\input[1]~input_o\ & \input[0]~input_o\)) # (\input[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010011000100010001001100010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[2]~input_o\,
	datab => \ALT_INV_input[5]~input_o\,
	datac => \ALT_INV_input[1]~input_o\,
	datad => \ALT_INV_input[0]~input_o\,
	dataf => \ALT_INV_input[3]~input_o\,
	combout => \encoder|encoder_out~1_combout\);

-- Location: IOIBUF_X62_Y0_N18
\input[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(6),
	o => \input[6]~input_o\);

-- Location: IOIBUF_X89_Y4_N44
\input[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(4),
	o => \input[4]~input_o\);

-- Location: LABCELL_X66_Y1_N36
\encoder|encoder_out~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out~2_combout\ = ( \input[4]~input_o\ & ( (\input[5]~input_o\ & !\input[6]~input_o\) ) ) # ( !\input[4]~input_o\ & ( !\input[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000110000001100000011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_input[5]~input_o\,
	datac => \ALT_INV_input[6]~input_o\,
	dataf => \ALT_INV_input[4]~input_o\,
	combout => \encoder|encoder_out~2_combout\);

-- Location: LABCELL_X66_Y1_N3
\encoder|encoder_out~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out~3_combout\ = ( !\input[7]~input_o\ & ( (!\input[9]~input_o\ & (!\input[13]~input_o\ & !\input[11]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[9]~input_o\,
	datab => \ALT_INV_input[13]~input_o\,
	datac => \ALT_INV_input[11]~input_o\,
	dataf => \ALT_INV_input[7]~input_o\,
	combout => \encoder|encoder_out~3_combout\);

-- Location: LABCELL_X66_Y1_N0
\encoder|encoder_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out~0_combout\ = ( !\input[11]~input_o\ & ( (!\input[9]~input_o\ & (!\input[13]~input_o\ & \input[8]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010001000000000001000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[9]~input_o\,
	datab => \ALT_INV_input[13]~input_o\,
	datad => \ALT_INV_input[8]~input_o\,
	dataf => \ALT_INV_input[11]~input_o\,
	combout => \encoder|encoder_out~0_combout\);

-- Location: LABCELL_X67_Y1_N30
\encoder|encoder_out[0]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[0]~5_combout\ = ( !\input[15]~input_o\ & ( \encoder|encoder_out~0_combout\ ) ) # ( !\input[15]~input_o\ & ( !\encoder|encoder_out~0_combout\ & ( (!\encoder|encoder_out~4_combout\) # ((\encoder|encoder_out~3_combout\ & 
-- ((!\encoder|encoder_out~2_combout\) # (\encoder|encoder_out~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101011111011000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \encoder|ALT_INV_encoder_out~4_combout\,
	datab => \encoder|ALT_INV_encoder_out~1_combout\,
	datac => \encoder|ALT_INV_encoder_out~2_combout\,
	datad => \encoder|ALT_INV_encoder_out~3_combout\,
	datae => \ALT_INV_input[15]~input_o\,
	dataf => \encoder|ALT_INV_encoder_out~0_combout\,
	combout => \encoder|encoder_out[0]~5_combout\);

-- Location: LABCELL_X66_Y1_N42
\encoder|encoder_out[2]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[2]~12_combout\ = ( !\input[11]~input_o\ & ( (!\input[13]~input_o\ & (!\input[12]~input_o\ & !\input[14]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000110000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_input[13]~input_o\,
	datac => \ALT_INV_input[12]~input_o\,
	datad => \ALT_INV_input[14]~input_o\,
	dataf => \ALT_INV_input[11]~input_o\,
	combout => \encoder|encoder_out[2]~12_combout\);

-- Location: LABCELL_X66_Y1_N9
\encoder|encoder_out~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out~11_combout\ = ( !\input[3]~input_o\ & ( (!\input[6]~input_o\ & (!\input[4]~input_o\ & !\input[5]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[6]~input_o\,
	datab => \ALT_INV_input[4]~input_o\,
	datac => \ALT_INV_input[5]~input_o\,
	dataf => \ALT_INV_input[3]~input_o\,
	combout => \encoder|encoder_out~11_combout\);

-- Location: LABCELL_X66_Y1_N48
\encoder|encoder_out[2]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[2]~13_combout\ = ( \input[8]~input_o\ & ( \encoder|encoder_out~10_combout\ & ( (!\input[15]~input_o\ & !\encoder|encoder_out[2]~12_combout\) ) ) ) # ( !\input[8]~input_o\ & ( \encoder|encoder_out~10_combout\ & ( (!\input[15]~input_o\ 
-- & ((!\encoder|encoder_out[2]~12_combout\) # ((!\input[7]~input_o\ & !\encoder|encoder_out~11_combout\)))) ) ) ) # ( \input[8]~input_o\ & ( !\encoder|encoder_out~10_combout\ & ( (!\input[15]~input_o\ & !\encoder|encoder_out[2]~12_combout\) ) ) ) # ( 
-- !\input[8]~input_o\ & ( !\encoder|encoder_out~10_combout\ & ( (!\input[15]~input_o\ & !\encoder|encoder_out[2]~12_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010101000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[15]~input_o\,
	datab => \encoder|ALT_INV_encoder_out[2]~12_combout\,
	datac => \ALT_INV_input[7]~input_o\,
	datad => \encoder|ALT_INV_encoder_out~11_combout\,
	datae => \ALT_INV_input[8]~input_o\,
	dataf => \encoder|ALT_INV_encoder_out~10_combout\,
	combout => \encoder|encoder_out[2]~13_combout\);

-- Location: LABCELL_X66_Y1_N18
\encoder|encoder_out[1]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[1]~7_combout\ = ( \input[1]~input_o\ & ( !\input[4]~input_o\ & ( !\input[3]~input_o\ ) ) ) # ( !\input[1]~input_o\ & ( !\input[4]~input_o\ & ( (!\input[3]~input_o\ & \input[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[3]~input_o\,
	datac => \ALT_INV_input[2]~input_o\,
	datae => \ALT_INV_input[1]~input_o\,
	dataf => \ALT_INV_input[4]~input_o\,
	combout => \encoder|encoder_out[1]~7_combout\);

-- Location: LABCELL_X66_Y1_N24
\encoder|encoder_out[1]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[1]~8_combout\ = ( \input[9]~input_o\ & ( !\input[13]~input_o\ & ( (!\input[14]~input_o\ & ((\input[11]~input_o\) # (\input[12]~input_o\))) ) ) ) # ( !\input[9]~input_o\ & ( !\input[13]~input_o\ & ( (!\input[14]~input_o\ & 
-- ((!\input[10]~input_o\) # ((\input[11]~input_o\) # (\input[12]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000110011001100000011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[10]~input_o\,
	datab => \ALT_INV_input[14]~input_o\,
	datac => \ALT_INV_input[12]~input_o\,
	datad => \ALT_INV_input[11]~input_o\,
	datae => \ALT_INV_input[9]~input_o\,
	dataf => \ALT_INV_input[13]~input_o\,
	combout => \encoder|encoder_out[1]~8_combout\);

-- Location: LABCELL_X66_Y1_N30
\encoder|encoder_out[1]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out[1]~9_combout\ = ( \input[5]~input_o\ & ( !\input[15]~input_o\ & ( (!\encoder|encoder_out[1]~8_combout\) # (\encoder|encoder_out~6_combout\) ) ) ) # ( !\input[5]~input_o\ & ( !\input[15]~input_o\ & ( 
-- (!\encoder|encoder_out[1]~8_combout\) # ((\encoder|encoder_out~6_combout\ & ((\encoder|encoder_out[1]~7_combout\) # (\input[6]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100010011111111110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[6]~input_o\,
	datab => \encoder|ALT_INV_encoder_out~6_combout\,
	datac => \encoder|ALT_INV_encoder_out[1]~7_combout\,
	datad => \encoder|ALT_INV_encoder_out[1]~8_combout\,
	datae => \ALT_INV_input[5]~input_o\,
	dataf => \ALT_INV_input[15]~input_o\,
	combout => \encoder|encoder_out[1]~9_combout\);

-- Location: LABCELL_X67_Y1_N9
\decoder|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux10~0_combout\ = ( \encoder|encoder_out[1]~9_combout\ & ( (!\encoder|encoder_out[3]~14_combout\ & ((!\encoder|encoder_out[0]~5_combout\) # (!\encoder|encoder_out[2]~13_combout\))) # (\encoder|encoder_out[3]~14_combout\ & 
-- ((\encoder|encoder_out[2]~13_combout\))) ) ) # ( !\encoder|encoder_out[1]~9_combout\ & ( (\encoder|encoder_out[2]~13_combout\) # (\encoder|encoder_out[3]~14_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111010101011111111110101010111101011010101011110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \encoder|ALT_INV_encoder_out[3]~14_combout\,
	datac => \encoder|ALT_INV_encoder_out[0]~5_combout\,
	datad => \encoder|ALT_INV_encoder_out[2]~13_combout\,
	dataf => \encoder|ALT_INV_encoder_out[1]~9_combout\,
	combout => \decoder|Mux10~0_combout\);

-- Location: LABCELL_X67_Y1_N12
\decoder|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux9~0_combout\ = ( \encoder|encoder_out[1]~9_combout\ & ( (!\encoder|encoder_out[2]~13_combout\ & ((!\encoder|encoder_out[3]~14_combout\) # (\encoder|encoder_out[0]~5_combout\))) # (\encoder|encoder_out[2]~13_combout\ & 
-- (\encoder|encoder_out[0]~5_combout\ & !\encoder|encoder_out[3]~14_combout\)) ) ) # ( !\encoder|encoder_out[1]~9_combout\ & ( (!\encoder|encoder_out[2]~13_combout\ & (\encoder|encoder_out[0]~5_combout\ & !\encoder|encoder_out[3]~14_combout\)) # 
-- (\encoder|encoder_out[2]~13_combout\ & ((\encoder|encoder_out[3]~14_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010010100100101001001010010010110110010101100101011001010110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \encoder|ALT_INV_encoder_out[2]~13_combout\,
	datab => \encoder|ALT_INV_encoder_out[0]~5_combout\,
	datac => \encoder|ALT_INV_encoder_out[3]~14_combout\,
	dataf => \encoder|ALT_INV_encoder_out[1]~9_combout\,
	combout => \decoder|Mux9~0_combout\);

-- Location: LABCELL_X67_Y1_N21
\decoder|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux8~0_combout\ = ( \encoder|encoder_out[1]~9_combout\ & ( ((\encoder|encoder_out[3]~14_combout\ & \encoder|encoder_out[2]~13_combout\)) # (\encoder|encoder_out[0]~5_combout\) ) ) # ( !\encoder|encoder_out[1]~9_combout\ & ( 
-- ((!\encoder|encoder_out[3]~14_combout\ & \encoder|encoder_out[2]~13_combout\)) # (\encoder|encoder_out[0]~5_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111110101111000011111010111100001111010111110000111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \encoder|ALT_INV_encoder_out[3]~14_combout\,
	datac => \encoder|ALT_INV_encoder_out[0]~5_combout\,
	datad => \encoder|ALT_INV_encoder_out[2]~13_combout\,
	dataf => \encoder|ALT_INV_encoder_out[1]~9_combout\,
	combout => \decoder|Mux8~0_combout\);

-- Location: LABCELL_X67_Y1_N24
\decoder|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux7~0_combout\ = ( \encoder|encoder_out[1]~9_combout\ & ( (!\encoder|encoder_out[2]~13_combout\ & (\encoder|encoder_out[0]~5_combout\ & \encoder|encoder_out[3]~14_combout\)) # (\encoder|encoder_out[2]~13_combout\ & 
-- (!\encoder|encoder_out[0]~5_combout\ $ (!\encoder|encoder_out[3]~14_combout\))) ) ) # ( !\encoder|encoder_out[1]~9_combout\ & ( (!\encoder|encoder_out[3]~14_combout\ & (!\encoder|encoder_out[2]~13_combout\ $ (!\encoder|encoder_out[0]~5_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000001100000011000000110000000010110000101100001011000010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \encoder|ALT_INV_encoder_out[2]~13_combout\,
	datab => \encoder|ALT_INV_encoder_out[0]~5_combout\,
	datac => \encoder|ALT_INV_encoder_out[3]~14_combout\,
	dataf => \encoder|ALT_INV_encoder_out[1]~9_combout\,
	combout => \decoder|Mux7~0_combout\);

-- Location: LABCELL_X67_Y1_N3
\decoder|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux6~0_combout\ = ( \encoder|encoder_out[1]~9_combout\ & ( (!\encoder|encoder_out[3]~14_combout\ & (!\encoder|encoder_out[0]~5_combout\ & !\encoder|encoder_out[2]~13_combout\)) ) ) # ( !\encoder|encoder_out[1]~9_combout\ & ( 
-- (\encoder|encoder_out[3]~14_combout\ & (!\encoder|encoder_out[0]~5_combout\ & \encoder|encoder_out[2]~13_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010000000000000101000010100000000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \encoder|ALT_INV_encoder_out[3]~14_combout\,
	datac => \encoder|ALT_INV_encoder_out[0]~5_combout\,
	datad => \encoder|ALT_INV_encoder_out[2]~13_combout\,
	dataf => \encoder|ALT_INV_encoder_out[1]~9_combout\,
	combout => \decoder|Mux6~0_combout\);

-- Location: LABCELL_X67_Y1_N36
\decoder|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux5~0_combout\ = ( \encoder|encoder_out[1]~9_combout\ & ( (\encoder|encoder_out[2]~13_combout\ & (!\encoder|encoder_out[0]~5_combout\ $ (\encoder|encoder_out[3]~14_combout\))) ) ) # ( !\encoder|encoder_out[1]~9_combout\ & ( 
-- (\encoder|encoder_out[2]~13_combout\ & (\encoder|encoder_out[0]~5_combout\ & !\encoder|encoder_out[3]~14_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000000100000001000001000001010000010100000101000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \encoder|ALT_INV_encoder_out[2]~13_combout\,
	datab => \encoder|ALT_INV_encoder_out[0]~5_combout\,
	datac => \encoder|ALT_INV_encoder_out[3]~14_combout\,
	dataf => \encoder|ALT_INV_encoder_out[1]~9_combout\,
	combout => \decoder|Mux5~0_combout\);

-- Location: LABCELL_X67_Y1_N45
\decoder|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux4~0_combout\ = ( \encoder|encoder_out[1]~9_combout\ & ( (\encoder|encoder_out[3]~14_combout\ & (!\encoder|encoder_out[0]~5_combout\ $ (!\encoder|encoder_out[2]~13_combout\))) ) ) # ( !\encoder|encoder_out[1]~9_combout\ & ( 
-- (!\encoder|encoder_out[3]~14_combout\ & (!\encoder|encoder_out[0]~5_combout\ $ (!\encoder|encoder_out[2]~13_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101010100000000010101010000000000101010100000000010101010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \encoder|ALT_INV_encoder_out[3]~14_combout\,
	datac => \encoder|ALT_INV_encoder_out[0]~5_combout\,
	datad => \encoder|ALT_INV_encoder_out[2]~13_combout\,
	dataf => \encoder|ALT_INV_encoder_out[1]~9_combout\,
	combout => \decoder|Mux4~0_combout\);

-- Location: LABCELL_X66_Y1_N57
\encoder|encoder_out~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \encoder|encoder_out~15_combout\ = ( !\input[11]~input_o\ & ( (!\input[13]~input_o\ & !\input[9]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_input[13]~input_o\,
	datad => \ALT_INV_input[9]~input_o\,
	dataf => \ALT_INV_input[11]~input_o\,
	combout => \encoder|encoder_out~15_combout\);

-- Location: LABCELL_X66_Y1_N54
\decoder|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux3~0_combout\ = ( \input[15]~input_o\ ) # ( !\input[15]~input_o\ & ( (!\input[10]~input_o\ & (!\input[14]~input_o\ & (!\input[12]~input_o\ & \encoder|encoder_out~15_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000001000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[10]~input_o\,
	datab => \ALT_INV_input[14]~input_o\,
	datac => \ALT_INV_input[12]~input_o\,
	datad => \encoder|ALT_INV_encoder_out~15_combout\,
	dataf => \ALT_INV_input[15]~input_o\,
	combout => \decoder|Mux3~0_combout\);

-- Location: LABCELL_X77_Y10_N3
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


