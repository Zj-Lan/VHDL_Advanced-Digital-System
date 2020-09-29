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

-- DATE "02/09/2020 00:24:02"

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

ENTITY 	Subtractor IS
    PORT (
	X : IN std_logic_vector(3 DOWNTO 0);
	Y : IN std_logic_vector(3 DOWNTO 0);
	Cin : IN std_logic;
	Cout : OUT std_logic;
	Sum : OUT std_logic_vector(3 DOWNTO 0)
	);
END Subtractor;

-- Design Ports Information
-- Cin	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cout	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum[0]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum[1]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum[2]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum[3]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[3]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[3]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[2]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[2]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[1]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[1]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[0]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[0]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Subtractor IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_X : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Y : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Cin : std_logic;
SIGNAL ww_Cout : std_logic;
SIGNAL ww_Sum : std_logic_vector(3 DOWNTO 0);
SIGNAL \Cin~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \X[2]~input_o\ : std_logic;
SIGNAL \Y[0]~input_o\ : std_logic;
SIGNAL \X[1]~input_o\ : std_logic;
SIGNAL \X[0]~input_o\ : std_logic;
SIGNAL \Y[1]~input_o\ : std_logic;
SIGNAL \sub2|Cout~0_combout\ : std_logic;
SIGNAL \Y[3]~input_o\ : std_logic;
SIGNAL \Y[2]~input_o\ : std_logic;
SIGNAL \X[3]~input_o\ : std_logic;
SIGNAL \sub4|Cout~0_combout\ : std_logic;
SIGNAL \sub1|Sum~0_combout\ : std_logic;
SIGNAL \sub2|Sum~combout\ : std_logic;
SIGNAL \sub3|Sum~combout\ : std_logic;
SIGNAL \sub4|Sum~combout\ : std_logic;
SIGNAL \ALT_INV_X[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_Y[2]~input_o\ : std_logic;
SIGNAL \sub2|ALT_INV_Cout~0_combout\ : std_logic;
SIGNAL \ALT_INV_X[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Y[1]~input_o\ : std_logic;
SIGNAL \sub2|ALT_INV_Sum~combout\ : std_logic;
SIGNAL \sub3|ALT_INV_Sum~combout\ : std_logic;
SIGNAL \sub4|ALT_INV_Sum~combout\ : std_logic;
SIGNAL \ALT_INV_X[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_Y[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_Y[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_X[0]~input_o\ : std_logic;

BEGIN

ww_X <= X;
ww_Y <= Y;
ww_Cin <= Cin;
Cout <= ww_Cout;
Sum <= ww_Sum;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_X[2]~input_o\ <= NOT \X[2]~input_o\;
\ALT_INV_Y[2]~input_o\ <= NOT \Y[2]~input_o\;
\sub2|ALT_INV_Cout~0_combout\ <= NOT \sub2|Cout~0_combout\;
\ALT_INV_X[1]~input_o\ <= NOT \X[1]~input_o\;
\ALT_INV_Y[1]~input_o\ <= NOT \Y[1]~input_o\;
\sub2|ALT_INV_Sum~combout\ <= NOT \sub2|Sum~combout\;
\sub3|ALT_INV_Sum~combout\ <= NOT \sub3|Sum~combout\;
\sub4|ALT_INV_Sum~combout\ <= NOT \sub4|Sum~combout\;
\ALT_INV_X[3]~input_o\ <= NOT \X[3]~input_o\;
\ALT_INV_Y[3]~input_o\ <= NOT \Y[3]~input_o\;
\ALT_INV_Y[0]~input_o\ <= NOT \Y[0]~input_o\;
\ALT_INV_X[0]~input_o\ <= NOT \X[0]~input_o\;

-- Location: IOOBUF_X89_Y38_N56
\Cout~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sub4|Cout~0_combout\,
	devoe => ww_devoe,
	o => ww_Cout);

-- Location: IOOBUF_X89_Y35_N96
\Sum[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sub1|Sum~0_combout\,
	devoe => ww_devoe,
	o => ww_Sum(0));

-- Location: IOOBUF_X89_Y37_N22
\Sum[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sub2|ALT_INV_Sum~combout\,
	devoe => ww_devoe,
	o => ww_Sum(1));

-- Location: IOOBUF_X89_Y37_N5
\Sum[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sub3|ALT_INV_Sum~combout\,
	devoe => ww_devoe,
	o => ww_Sum(2));

-- Location: IOOBUF_X89_Y38_N39
\Sum[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sub4|ALT_INV_Sum~combout\,
	devoe => ww_devoe,
	o => ww_Sum(3));

-- Location: IOIBUF_X89_Y36_N21
\X[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(2),
	o => \X[2]~input_o\);

-- Location: IOIBUF_X89_Y35_N78
\Y[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y(0),
	o => \Y[0]~input_o\);

-- Location: IOIBUF_X89_Y35_N61
\X[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(1),
	o => \X[1]~input_o\);

-- Location: IOIBUF_X89_Y35_N44
\X[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(0),
	o => \X[0]~input_o\);

-- Location: IOIBUF_X89_Y36_N38
\Y[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y(1),
	o => \Y[1]~input_o\);

-- Location: LABCELL_X88_Y36_N30
\sub2|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sub2|Cout~0_combout\ = ( \X[0]~input_o\ & ( \Y[1]~input_o\ & ( !\X[1]~input_o\ ) ) ) # ( !\X[0]~input_o\ & ( \Y[1]~input_o\ & ( (!\X[1]~input_o\) # (\Y[0]~input_o\) ) ) ) # ( !\X[0]~input_o\ & ( !\Y[1]~input_o\ & ( (\Y[0]~input_o\ & !\X[1]~input_o\) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000000000000000000011110101111101011111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Y[0]~input_o\,
	datac => \ALT_INV_X[1]~input_o\,
	datae => \ALT_INV_X[0]~input_o\,
	dataf => \ALT_INV_Y[1]~input_o\,
	combout => \sub2|Cout~0_combout\);

-- Location: IOIBUF_X89_Y36_N4
\Y[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y(3),
	o => \Y[3]~input_o\);

-- Location: IOIBUF_X89_Y36_N55
\Y[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y(2),
	o => \Y[2]~input_o\);

-- Location: IOIBUF_X89_Y38_N21
\X[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(3),
	o => \X[3]~input_o\);

-- Location: LABCELL_X88_Y36_N39
\sub4|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sub4|Cout~0_combout\ = ( \X[3]~input_o\ & ( (!\Y[3]~input_o\) # ((!\X[2]~input_o\ & (!\sub2|Cout~0_combout\ & !\Y[2]~input_o\)) # (\X[2]~input_o\ & ((!\sub2|Cout~0_combout\) # (!\Y[2]~input_o\)))) ) ) # ( !\X[3]~input_o\ & ( (!\Y[3]~input_o\ & 
-- ((!\X[2]~input_o\ & (!\sub2|Cout~0_combout\ & !\Y[2]~input_o\)) # (\X[2]~input_o\ & ((!\sub2|Cout~0_combout\) # (!\Y[2]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000001000000110100000100000011111101111101001111110111110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_X[2]~input_o\,
	datab => \sub2|ALT_INV_Cout~0_combout\,
	datac => \ALT_INV_Y[3]~input_o\,
	datad => \ALT_INV_Y[2]~input_o\,
	dataf => \ALT_INV_X[3]~input_o\,
	combout => \sub4|Cout~0_combout\);

-- Location: LABCELL_X88_Y35_N33
\sub1|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sub1|Sum~0_combout\ = ( \Y[0]~input_o\ & ( !\X[0]~input_o\ ) ) # ( !\Y[0]~input_o\ & ( \X[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_X[0]~input_o\,
	dataf => \ALT_INV_Y[0]~input_o\,
	combout => \sub1|Sum~0_combout\);

-- Location: LABCELL_X88_Y36_N15
\sub2|Sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \sub2|Sum~combout\ = ( \X[0]~input_o\ & ( \Y[1]~input_o\ & ( \X[1]~input_o\ ) ) ) # ( !\X[0]~input_o\ & ( \Y[1]~input_o\ & ( !\X[1]~input_o\ $ (!\Y[0]~input_o\) ) ) ) # ( \X[0]~input_o\ & ( !\Y[1]~input_o\ & ( !\X[1]~input_o\ ) ) ) # ( !\X[0]~input_o\ & ( 
-- !\Y[1]~input_o\ & ( !\X[1]~input_o\ $ (\Y[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101001010101101010101010101001010101101010100101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_X[1]~input_o\,
	datad => \ALT_INV_Y[0]~input_o\,
	datae => \ALT_INV_X[0]~input_o\,
	dataf => \ALT_INV_Y[1]~input_o\,
	combout => \sub2|Sum~combout\);

-- Location: LABCELL_X88_Y36_N18
\sub3|Sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \sub3|Sum~combout\ = ( \X[0]~input_o\ & ( \X[1]~input_o\ & ( !\X[2]~input_o\ $ (\Y[2]~input_o\) ) ) ) # ( !\X[0]~input_o\ & ( \X[1]~input_o\ & ( !\X[2]~input_o\ $ (!\Y[2]~input_o\ $ (((!\Y[0]~input_o\) # (!\Y[1]~input_o\)))) ) ) ) # ( \X[0]~input_o\ & ( 
-- !\X[1]~input_o\ & ( !\Y[1]~input_o\ $ (!\X[2]~input_o\ $ (!\Y[2]~input_o\)) ) ) ) # ( !\X[0]~input_o\ & ( !\X[1]~input_o\ & ( !\X[2]~input_o\ $ (!\Y[2]~input_o\ $ (((!\Y[0]~input_o\ & !\Y[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000011101111000110000110011110011100001000111101111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Y[0]~input_o\,
	datab => \ALT_INV_Y[1]~input_o\,
	datac => \ALT_INV_X[2]~input_o\,
	datad => \ALT_INV_Y[2]~input_o\,
	datae => \ALT_INV_X[0]~input_o\,
	dataf => \ALT_INV_X[1]~input_o\,
	combout => \sub3|Sum~combout\);

-- Location: LABCELL_X88_Y36_N36
\sub4|Sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \sub4|Sum~combout\ = ( \X[3]~input_o\ & ( !\Y[3]~input_o\ $ (((!\X[2]~input_o\ & (!\sub2|Cout~0_combout\ & !\Y[2]~input_o\)) # (\X[2]~input_o\ & ((!\sub2|Cout~0_combout\) # (!\Y[2]~input_o\))))) ) ) # ( !\X[3]~input_o\ & ( !\Y[3]~input_o\ $ 
-- (((!\X[2]~input_o\ & ((\Y[2]~input_o\) # (\sub2|Cout~0_combout\))) # (\X[2]~input_o\ & (\sub2|Cout~0_combout\ & \Y[2]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101010000101011110101000010101100101011110101000010101111010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_X[2]~input_o\,
	datab => \sub2|ALT_INV_Cout~0_combout\,
	datac => \ALT_INV_Y[2]~input_o\,
	datad => \ALT_INV_Y[3]~input_o\,
	dataf => \ALT_INV_X[3]~input_o\,
	combout => \sub4|Sum~combout\);

-- Location: IOIBUF_X89_Y38_N4
\Cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cin,
	o => \Cin~input_o\);

-- Location: MLABCELL_X25_Y13_N3
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


