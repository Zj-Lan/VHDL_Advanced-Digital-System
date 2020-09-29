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

-- DATE "04/21/2020 01:39:43"

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

ENTITY 	Robot IS
    PORT (
	clk : IN std_logic;
	S1S2 : IN std_logic_vector(1 DOWNTO 0);
	Z1Z2 : OUT std_logic_vector(1 DOWNTO 0)
	);
END Robot;

ARCHITECTURE structure OF Robot IS
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
SIGNAL ww_S1S2 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_Z1Z2 : std_logic_vector(1 DOWNTO 0);
SIGNAL \Z1Z2[0]~output_o\ : std_logic;
SIGNAL \Z1Z2[1]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \S1S2[0]~input_o\ : std_logic;
SIGNAL \S1S2[1]~input_o\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \state.C~q\ : std_logic;
SIGNAL \Selector0~4_combout\ : std_logic;
SIGNAL \state.A~q\ : std_logic;
SIGNAL \state.D~0_combout\ : std_logic;
SIGNAL \state.D~q\ : std_logic;
SIGNAL \state.B~0_combout\ : std_logic;
SIGNAL \state.B~q\ : std_logic;
SIGNAL \Z1Z2~0_combout\ : std_logic;
SIGNAL \Z1Z2~1_combout\ : std_logic;
SIGNAL \ALT_INV_state.D~q\ : std_logic;
SIGNAL \ALT_INV_state.B~q\ : std_logic;
SIGNAL \ALT_INV_state.C~q\ : std_logic;
SIGNAL \ALT_INV_state.A~q\ : std_logic;
SIGNAL \ALT_INV_S1S2[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_S1S2[1]~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_S1S2 <= S1S2;
Z1Z2 <= ww_Z1Z2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_state.D~q\ <= NOT \state.D~q\;
\ALT_INV_state.B~q\ <= NOT \state.B~q\;
\ALT_INV_state.C~q\ <= NOT \state.C~q\;
\ALT_INV_state.A~q\ <= NOT \state.A~q\;
\ALT_INV_S1S2[0]~input_o\ <= NOT \S1S2[0]~input_o\;
\ALT_INV_S1S2[1]~input_o\ <= NOT \S1S2[1]~input_o\;

\Z1Z2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Z1Z2~0_combout\,
	devoe => ww_devoe,
	o => \Z1Z2[0]~output_o\);

\Z1Z2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Z1Z2~1_combout\,
	devoe => ww_devoe,
	o => \Z1Z2[1]~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\S1S2[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S1S2(0),
	o => \S1S2[0]~input_o\);

\S1S2[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S1S2(1),
	o => \S1S2[1]~input_o\);

\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (!\state.C~q\ & (\state.B~q\ & (!\S1S2[0]~input_o\ & !\S1S2[1]~input_o\))) # (\state.C~q\ & ((!\S1S2[0]~input_o\ $ (\S1S2[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000000000011011100000000001101110000000000110111000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.B~q\,
	datab => \ALT_INV_state.C~q\,
	datac => \ALT_INV_S1S2[0]~input_o\,
	datad => \ALT_INV_S1S2[1]~input_o\,
	combout => \Selector2~0_combout\);

\state.C\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.C~q\);

\Selector0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~4_combout\ = ( \S1S2[1]~input_o\ & ( (!\S1S2[0]~input_o\) # (\state.A~q\) ) ) # ( !\S1S2[1]~input_o\ & ( ((\S1S2[0]~input_o\) # (\state.C~q\)) # (\state.B~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111111111111111111110011001101011111111111111111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.B~q\,
	datab => \ALT_INV_state.A~q\,
	datac => \ALT_INV_state.C~q\,
	datad => \ALT_INV_S1S2[0]~input_o\,
	datae => \ALT_INV_S1S2[1]~input_o\,
	combout => \Selector0~4_combout\);

\state.A\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.A~q\);

\state.D~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \state.D~0_combout\ = ( !\S1S2[0]~input_o\ & ( \S1S2[1]~input_o\ & ( (((!\state.A~q\) # (\state.C~q\)) # (\state.D~q\)) # (\state.B~q\) ) ) ) # ( \S1S2[0]~input_o\ & ( !\S1S2[1]~input_o\ & ( (!\state.B~q\ & (\state.D~q\ & (\state.A~q\ & !\state.C~q\))) ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000011110111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.B~q\,
	datab => \ALT_INV_state.D~q\,
	datac => \ALT_INV_state.A~q\,
	datad => \ALT_INV_state.C~q\,
	datae => \ALT_INV_S1S2[0]~input_o\,
	dataf => \ALT_INV_S1S2[1]~input_o\,
	combout => \state.D~0_combout\);

\state.D\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \state.D~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.D~q\);

\state.B~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \state.B~0_combout\ = ( \S1S2[0]~input_o\ & ( \S1S2[1]~input_o\ & ( (\state.D~q\) # (\state.B~q\) ) ) ) # ( \S1S2[0]~input_o\ & ( !\S1S2[1]~input_o\ & ( ((!\state.A~q\) # (\state.C~q\)) # (\state.B~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011111111100000000000000000111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.B~q\,
	datab => \ALT_INV_state.D~q\,
	datac => \ALT_INV_state.A~q\,
	datad => \ALT_INV_state.C~q\,
	datae => \ALT_INV_S1S2[0]~input_o\,
	dataf => \ALT_INV_S1S2[1]~input_o\,
	combout => \state.B~0_combout\);

\state.B\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \state.B~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.B~q\);

\Z1Z2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Z1Z2~0_combout\ = ((!\state.D~q\ & ((!\state.A~q\) # (\state.C~q\)))) # (\state.B~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101010111011101110101011101110111010101110111011101010111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.B~q\,
	datab => \ALT_INV_state.D~q\,
	datac => \ALT_INV_state.A~q\,
	datad => \ALT_INV_state.C~q\,
	combout => \Z1Z2~0_combout\);

\Z1Z2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Z1Z2~1_combout\ = (!\state.B~q\ & (((!\state.A~q\) # (\state.C~q\)) # (\state.D~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001010101010101000101010101010100010101010101010001010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.B~q\,
	datab => \ALT_INV_state.D~q\,
	datac => \ALT_INV_state.A~q\,
	datad => \ALT_INV_state.C~q\,
	combout => \Z1Z2~1_combout\);

ww_Z1Z2(0) <= \Z1Z2[0]~output_o\;

ww_Z1Z2(1) <= \Z1Z2[1]~output_o\;
END structure;


