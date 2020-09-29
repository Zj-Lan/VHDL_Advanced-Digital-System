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

-- DATE "02/09/2020 16:46:08"

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

ENTITY 	mux16 IS
    PORT (
	s0 : IN std_logic;
	s1 : IN std_logic;
	s2 : IN std_logic;
	s3 : IN std_logic;
	d0 : IN std_logic;
	d1 : IN std_logic;
	d2 : IN std_logic;
	d3 : IN std_logic;
	d4 : IN std_logic;
	d5 : IN std_logic;
	d6 : IN std_logic;
	d7 : IN std_logic;
	d8 : IN std_logic;
	d9 : IN std_logic;
	d10 : IN std_logic;
	d11 : IN std_logic;
	d12 : IN std_logic;
	d13 : IN std_logic;
	d14 : IN std_logic;
	d15 : IN std_logic;
	F_mux16 : OUT std_logic
	);
END mux16;

-- Design Ports Information
-- F_mux16	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d0	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d1	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d2	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d3	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s3	=>  Location: PIN_T19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s2	=>  Location: PIN_T20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d4	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d5	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d6	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d7	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d8	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d9	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d10	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d11	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d12	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d13	=>  Location: PIN_U17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d14	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d15	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s1	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s0	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF mux16 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_s0 : std_logic;
SIGNAL ww_s1 : std_logic;
SIGNAL ww_s2 : std_logic;
SIGNAL ww_s3 : std_logic;
SIGNAL ww_d0 : std_logic;
SIGNAL ww_d1 : std_logic;
SIGNAL ww_d2 : std_logic;
SIGNAL ww_d3 : std_logic;
SIGNAL ww_d4 : std_logic;
SIGNAL ww_d5 : std_logic;
SIGNAL ww_d6 : std_logic;
SIGNAL ww_d7 : std_logic;
SIGNAL ww_d8 : std_logic;
SIGNAL ww_d9 : std_logic;
SIGNAL ww_d10 : std_logic;
SIGNAL ww_d11 : std_logic;
SIGNAL ww_d12 : std_logic;
SIGNAL ww_d13 : std_logic;
SIGNAL ww_d14 : std_logic;
SIGNAL ww_d15 : std_logic;
SIGNAL ww_F_mux16 : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \s0~input_o\ : std_logic;
SIGNAL \d7~input_o\ : std_logic;
SIGNAL \d6~input_o\ : std_logic;
SIGNAL \s2~input_o\ : std_logic;
SIGNAL \d5~input_o\ : std_logic;
SIGNAL \s3~input_o\ : std_logic;
SIGNAL \d4~input_o\ : std_logic;
SIGNAL \mux2_1|O1|F_or_2~1_combout\ : std_logic;
SIGNAL \d13~input_o\ : std_logic;
SIGNAL \d15~input_o\ : std_logic;
SIGNAL \d12~input_o\ : std_logic;
SIGNAL \d14~input_o\ : std_logic;
SIGNAL \mux2_1|O1|F_or_2~3_combout\ : std_logic;
SIGNAL \d11~input_o\ : std_logic;
SIGNAL \d10~input_o\ : std_logic;
SIGNAL \d9~input_o\ : std_logic;
SIGNAL \d8~input_o\ : std_logic;
SIGNAL \mux2_1|O1|F_or_2~2_combout\ : std_logic;
SIGNAL \s1~input_o\ : std_logic;
SIGNAL \d2~input_o\ : std_logic;
SIGNAL \d0~input_o\ : std_logic;
SIGNAL \d1~input_o\ : std_logic;
SIGNAL \d3~input_o\ : std_logic;
SIGNAL \mux2_1|O1|F_or_2~0_combout\ : std_logic;
SIGNAL \mux2_1|O1|F_or_2~4_combout\ : std_logic;
SIGNAL \ALT_INV_s0~input_o\ : std_logic;
SIGNAL \ALT_INV_s1~input_o\ : std_logic;
SIGNAL \ALT_INV_d15~input_o\ : std_logic;
SIGNAL \ALT_INV_d14~input_o\ : std_logic;
SIGNAL \ALT_INV_d13~input_o\ : std_logic;
SIGNAL \ALT_INV_d12~input_o\ : std_logic;
SIGNAL \ALT_INV_d11~input_o\ : std_logic;
SIGNAL \ALT_INV_d10~input_o\ : std_logic;
SIGNAL \ALT_INV_d9~input_o\ : std_logic;
SIGNAL \ALT_INV_d8~input_o\ : std_logic;
SIGNAL \ALT_INV_d7~input_o\ : std_logic;
SIGNAL \ALT_INV_d6~input_o\ : std_logic;
SIGNAL \ALT_INV_d5~input_o\ : std_logic;
SIGNAL \ALT_INV_d4~input_o\ : std_logic;
SIGNAL \ALT_INV_s2~input_o\ : std_logic;
SIGNAL \ALT_INV_s3~input_o\ : std_logic;
SIGNAL \ALT_INV_d3~input_o\ : std_logic;
SIGNAL \ALT_INV_d2~input_o\ : std_logic;
SIGNAL \ALT_INV_d1~input_o\ : std_logic;
SIGNAL \ALT_INV_d0~input_o\ : std_logic;
SIGNAL \mux2_1|O1|ALT_INV_F_or_2~3_combout\ : std_logic;
SIGNAL \mux2_1|O1|ALT_INV_F_or_2~2_combout\ : std_logic;
SIGNAL \mux2_1|O1|ALT_INV_F_or_2~1_combout\ : std_logic;
SIGNAL \mux2_1|O1|ALT_INV_F_or_2~0_combout\ : std_logic;

BEGIN

ww_s0 <= s0;
ww_s1 <= s1;
ww_s2 <= s2;
ww_s3 <= s3;
ww_d0 <= d0;
ww_d1 <= d1;
ww_d2 <= d2;
ww_d3 <= d3;
ww_d4 <= d4;
ww_d5 <= d5;
ww_d6 <= d6;
ww_d7 <= d7;
ww_d8 <= d8;
ww_d9 <= d9;
ww_d10 <= d10;
ww_d11 <= d11;
ww_d12 <= d12;
ww_d13 <= d13;
ww_d14 <= d14;
ww_d15 <= d15;
F_mux16 <= ww_F_mux16;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_s0~input_o\ <= NOT \s0~input_o\;
\ALT_INV_s1~input_o\ <= NOT \s1~input_o\;
\ALT_INV_d15~input_o\ <= NOT \d15~input_o\;
\ALT_INV_d14~input_o\ <= NOT \d14~input_o\;
\ALT_INV_d13~input_o\ <= NOT \d13~input_o\;
\ALT_INV_d12~input_o\ <= NOT \d12~input_o\;
\ALT_INV_d11~input_o\ <= NOT \d11~input_o\;
\ALT_INV_d10~input_o\ <= NOT \d10~input_o\;
\ALT_INV_d9~input_o\ <= NOT \d9~input_o\;
\ALT_INV_d8~input_o\ <= NOT \d8~input_o\;
\ALT_INV_d7~input_o\ <= NOT \d7~input_o\;
\ALT_INV_d6~input_o\ <= NOT \d6~input_o\;
\ALT_INV_d5~input_o\ <= NOT \d5~input_o\;
\ALT_INV_d4~input_o\ <= NOT \d4~input_o\;
\ALT_INV_s2~input_o\ <= NOT \s2~input_o\;
\ALT_INV_s3~input_o\ <= NOT \s3~input_o\;
\ALT_INV_d3~input_o\ <= NOT \d3~input_o\;
\ALT_INV_d2~input_o\ <= NOT \d2~input_o\;
\ALT_INV_d1~input_o\ <= NOT \d1~input_o\;
\ALT_INV_d0~input_o\ <= NOT \d0~input_o\;
\mux2_1|O1|ALT_INV_F_or_2~3_combout\ <= NOT \mux2_1|O1|F_or_2~3_combout\;
\mux2_1|O1|ALT_INV_F_or_2~2_combout\ <= NOT \mux2_1|O1|F_or_2~2_combout\;
\mux2_1|O1|ALT_INV_F_or_2~1_combout\ <= NOT \mux2_1|O1|F_or_2~1_combout\;
\mux2_1|O1|ALT_INV_F_or_2~0_combout\ <= NOT \mux2_1|O1|F_or_2~0_combout\;

-- Location: IOOBUF_X89_Y9_N39
\F_mux16~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \mux2_1|O1|F_or_2~4_combout\,
	devoe => ww_devoe,
	o => ww_F_mux16);

-- Location: IOIBUF_X89_Y6_N4
\s0~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s0,
	o => \s0~input_o\);

-- Location: IOIBUF_X89_Y6_N21
\d7~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d7,
	o => \d7~input_o\);

-- Location: IOIBUF_X72_Y0_N18
\d6~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d6,
	o => \d6~input_o\);

-- Location: IOIBUF_X89_Y4_N95
\s2~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s2,
	o => \s2~input_o\);

-- Location: IOIBUF_X89_Y8_N55
\d5~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d5,
	o => \d5~input_o\);

-- Location: IOIBUF_X89_Y4_N78
\s3~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s3,
	o => \s3~input_o\);

-- Location: IOIBUF_X89_Y9_N21
\d4~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d4,
	o => \d4~input_o\);

-- Location: LABCELL_X88_Y6_N6
\mux2_1|O1|F_or_2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux2_1|O1|F_or_2~1_combout\ = ( \s3~input_o\ & ( \d4~input_o\ & ( (!\s2~input_o\ & ((\d5~input_o\))) # (\s2~input_o\ & (\d7~input_o\)) ) ) ) # ( !\s3~input_o\ & ( \d4~input_o\ & ( (!\s2~input_o\) # (\d6~input_o\) ) ) ) # ( \s3~input_o\ & ( !\d4~input_o\ 
-- & ( (!\s2~input_o\ & ((\d5~input_o\))) # (\s2~input_o\ & (\d7~input_o\)) ) ) ) # ( !\s3~input_o\ & ( !\d4~input_o\ & ( (\d6~input_o\ & \s2~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000001011111010111110011111100110000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d7~input_o\,
	datab => \ALT_INV_d6~input_o\,
	datac => \ALT_INV_s2~input_o\,
	datad => \ALT_INV_d5~input_o\,
	datae => \ALT_INV_s3~input_o\,
	dataf => \ALT_INV_d4~input_o\,
	combout => \mux2_1|O1|F_or_2~1_combout\);

-- Location: IOIBUF_X72_Y0_N1
\d13~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d13,
	o => \d13~input_o\);

-- Location: IOIBUF_X72_Y0_N52
\d15~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d15,
	o => \d15~input_o\);

-- Location: IOIBUF_X89_Y8_N38
\d12~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d12,
	o => \d12~input_o\);

-- Location: IOIBUF_X72_Y0_N35
\d14~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d14,
	o => \d14~input_o\);

-- Location: LABCELL_X88_Y6_N18
\mux2_1|O1|F_or_2~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux2_1|O1|F_or_2~3_combout\ = ( \s2~input_o\ & ( \d14~input_o\ & ( (!\s3~input_o\) # (\d15~input_o\) ) ) ) # ( !\s2~input_o\ & ( \d14~input_o\ & ( (!\s3~input_o\ & ((\d12~input_o\))) # (\s3~input_o\ & (\d13~input_o\)) ) ) ) # ( \s2~input_o\ & ( 
-- !\d14~input_o\ & ( (\s3~input_o\ & \d15~input_o\) ) ) ) # ( !\s2~input_o\ & ( !\d14~input_o\ & ( (!\s3~input_o\ & ((\d12~input_o\))) # (\s3~input_o\ & (\d13~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000110111011000001010000010100010001101110111010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s3~input_o\,
	datab => \ALT_INV_d13~input_o\,
	datac => \ALT_INV_d15~input_o\,
	datad => \ALT_INV_d12~input_o\,
	datae => \ALT_INV_s2~input_o\,
	dataf => \ALT_INV_d14~input_o\,
	combout => \mux2_1|O1|F_or_2~3_combout\);

-- Location: IOIBUF_X89_Y8_N4
\d11~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d11,
	o => \d11~input_o\);

-- Location: IOIBUF_X89_Y4_N61
\d10~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d10,
	o => \d10~input_o\);

-- Location: IOIBUF_X89_Y9_N4
\d9~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d9,
	o => \d9~input_o\);

-- Location: IOIBUF_X89_Y35_N61
\d8~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d8,
	o => \d8~input_o\);

-- Location: LABCELL_X88_Y6_N42
\mux2_1|O1|F_or_2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux2_1|O1|F_or_2~2_combout\ = ( \s3~input_o\ & ( \d8~input_o\ & ( (!\s2~input_o\ & ((\d9~input_o\))) # (\s2~input_o\ & (\d11~input_o\)) ) ) ) # ( !\s3~input_o\ & ( \d8~input_o\ & ( (!\s2~input_o\) # (\d10~input_o\) ) ) ) # ( \s3~input_o\ & ( 
-- !\d8~input_o\ & ( (!\s2~input_o\ & ((\d9~input_o\))) # (\s2~input_o\ & (\d11~input_o\)) ) ) ) # ( !\s3~input_o\ & ( !\d8~input_o\ & ( (\s2~input_o\ & \d10~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000100011011101110101111101011110001000110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s2~input_o\,
	datab => \ALT_INV_d11~input_o\,
	datac => \ALT_INV_d10~input_o\,
	datad => \ALT_INV_d9~input_o\,
	datae => \ALT_INV_s3~input_o\,
	dataf => \ALT_INV_d8~input_o\,
	combout => \mux2_1|O1|F_or_2~2_combout\);

-- Location: IOIBUF_X89_Y6_N55
\s1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s1,
	o => \s1~input_o\);

-- Location: IOIBUF_X89_Y6_N38
\d2~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d2,
	o => \d2~input_o\);

-- Location: IOIBUF_X89_Y9_N55
\d0~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d0,
	o => \d0~input_o\);

-- Location: IOIBUF_X89_Y4_N44
\d1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d1,
	o => \d1~input_o\);

-- Location: IOIBUF_X89_Y8_N21
\d3~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d3,
	o => \d3~input_o\);

-- Location: LABCELL_X88_Y6_N30
\mux2_1|O1|F_or_2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux2_1|O1|F_or_2~0_combout\ = ( \d1~input_o\ & ( \d3~input_o\ & ( ((!\s2~input_o\ & ((\d0~input_o\))) # (\s2~input_o\ & (\d2~input_o\))) # (\s3~input_o\) ) ) ) # ( !\d1~input_o\ & ( \d3~input_o\ & ( (!\s2~input_o\ & (((!\s3~input_o\ & \d0~input_o\)))) # 
-- (\s2~input_o\ & (((\s3~input_o\)) # (\d2~input_o\))) ) ) ) # ( \d1~input_o\ & ( !\d3~input_o\ & ( (!\s2~input_o\ & (((\d0~input_o\) # (\s3~input_o\)))) # (\s2~input_o\ & (\d2~input_o\ & (!\s3~input_o\))) ) ) ) # ( !\d1~input_o\ & ( !\d3~input_o\ & ( 
-- (!\s3~input_o\ & ((!\s2~input_o\ & ((\d0~input_o\))) # (\s2~input_o\ & (\d2~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000010110000000110101011101000010101101101010001111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s2~input_o\,
	datab => \ALT_INV_d2~input_o\,
	datac => \ALT_INV_s3~input_o\,
	datad => \ALT_INV_d0~input_o\,
	datae => \ALT_INV_d1~input_o\,
	dataf => \ALT_INV_d3~input_o\,
	combout => \mux2_1|O1|F_or_2~0_combout\);

-- Location: LABCELL_X88_Y6_N54
\mux2_1|O1|F_or_2~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux2_1|O1|F_or_2~4_combout\ = ( \s1~input_o\ & ( \mux2_1|O1|F_or_2~0_combout\ & ( (!\s0~input_o\ & (\mux2_1|O1|F_or_2~1_combout\)) # (\s0~input_o\ & ((\mux2_1|O1|F_or_2~3_combout\))) ) ) ) # ( !\s1~input_o\ & ( \mux2_1|O1|F_or_2~0_combout\ & ( 
-- (!\s0~input_o\) # (\mux2_1|O1|F_or_2~2_combout\) ) ) ) # ( \s1~input_o\ & ( !\mux2_1|O1|F_or_2~0_combout\ & ( (!\s0~input_o\ & (\mux2_1|O1|F_or_2~1_combout\)) # (\s0~input_o\ & ((\mux2_1|O1|F_or_2~3_combout\))) ) ) ) # ( !\s1~input_o\ & ( 
-- !\mux2_1|O1|F_or_2~0_combout\ & ( (\s0~input_o\ & \mux2_1|O1|F_or_2~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101001001110010011110101010111111110010011100100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s0~input_o\,
	datab => \mux2_1|O1|ALT_INV_F_or_2~1_combout\,
	datac => \mux2_1|O1|ALT_INV_F_or_2~3_combout\,
	datad => \mux2_1|O1|ALT_INV_F_or_2~2_combout\,
	datae => \ALT_INV_s1~input_o\,
	dataf => \mux2_1|O1|ALT_INV_F_or_2~0_combout\,
	combout => \mux2_1|O1|F_or_2~4_combout\);

-- Location: LABCELL_X61_Y16_N0
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


