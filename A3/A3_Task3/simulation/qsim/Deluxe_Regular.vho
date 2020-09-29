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

-- DATE "03/16/2020 03:31:58"

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

ENTITY 	Deluxe_Regular IS
    PORT (
	clk : IN std_logic;
	token_1 : IN std_logic;
	token_2 : IN std_logic;
	soap : OUT std_logic;
	water : OUT std_logic;
	brush : OUT std_logic
	);
END Deluxe_Regular;

-- Design Ports Information
-- soap	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- water	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- brush	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- token_1	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- token_2	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Deluxe_Regular IS
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
SIGNAL ww_token_1 : std_logic;
SIGNAL ww_token_2 : std_logic;
SIGNAL ww_soap : std_logic;
SIGNAL ww_water : std_logic;
SIGNAL ww_brush : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \current_state.s13~DUPLICATE_q\ : std_logic;
SIGNAL \current_state.s26~q\ : std_logic;
SIGNAL \current_state.s24~q\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \current_state.s23~DUPLICATE_q\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \current_state.s24~DUPLICATE_q\ : std_logic;
SIGNAL \current_state.s25~DUPLICATE_q\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \current_state.s25~q\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \current_state.s26~DUPLICATE_q\ : std_logic;
SIGNAL \token_2~input_o\ : std_logic;
SIGNAL \token_1~input_o\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \current_state.s11~q\ : std_logic;
SIGNAL \current_state.s12~q\ : std_logic;
SIGNAL \start_timer~3_combout\ : std_logic;
SIGNAL \start_timer~1_combout\ : std_logic;
SIGNAL \current_state.s23~q\ : std_logic;
SIGNAL \WideOr10~0_combout\ : std_logic;
SIGNAL \start_timer~2_combout\ : std_logic;
SIGNAL \WideOr10~1_combout\ : std_logic;
SIGNAL \t0|cnt~4_combout\ : std_logic;
SIGNAL \t0|Add0~2_combout\ : std_logic;
SIGNAL \t0|cnt~2_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \current_state.s12~DUPLICATE_q\ : std_logic;
SIGNAL \start_timer~0_combout\ : std_logic;
SIGNAL \t0|Add0~3_combout\ : std_logic;
SIGNAL \t0|cnt~3_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \current_state.s13~q\ : std_logic;
SIGNAL \time_10sec~0_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \current_state.Initial~q\ : std_logic;
SIGNAL \t0|Add0~0_combout\ : std_logic;
SIGNAL \t0|cnt~0_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \current_state.s21~q\ : std_logic;
SIGNAL \WideOr10~2_combout\ : std_logic;
SIGNAL \t0|Add0~1_combout\ : std_logic;
SIGNAL \t0|cnt~1_combout\ : std_logic;
SIGNAL \current_state.s22~q\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \current_state.s22~DUPLICATE_q\ : std_logic;
SIGNAL \soap~0_combout\ : std_logic;
SIGNAL \water~0_combout\ : std_logic;
SIGNAL \brush~0_combout\ : std_logic;
SIGNAL \t0|cnt\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_current_state.s26~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_current_state.s13~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_current_state.s24~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_current_state.s25~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_current_state.s12~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_current_state.s23~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_current_state.s22~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_token_2~input_o\ : std_logic;
SIGNAL \ALT_INV_token_1~input_o\ : std_logic;
SIGNAL \t0|ALT_INV_Add0~3_combout\ : std_logic;
SIGNAL \t0|ALT_INV_Add0~2_combout\ : std_logic;
SIGNAL \t0|ALT_INV_Add0~1_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr10~2_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr10~1_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr10~0_combout\ : std_logic;
SIGNAL \ALT_INV_start_timer~3_combout\ : std_logic;
SIGNAL \ALT_INV_start_timer~2_combout\ : std_logic;
SIGNAL \ALT_INV_start_timer~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector9~0_combout\ : std_logic;
SIGNAL \t0|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \t0|ALT_INV_cnt\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_start_timer~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \ALT_INV_current_state.s26~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s13~q\ : std_logic;
SIGNAL \ALT_INV_time_10sec~0_combout\ : std_logic;
SIGNAL \ALT_INV_current_state.s24~q\ : std_logic;
SIGNAL \ALT_INV_brush~0_combout\ : std_logic;
SIGNAL \ALT_INV_current_state.Initial~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s21~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s11~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s25~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s12~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s23~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s22~q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_token_1 <= token_1;
ww_token_2 <= token_2;
soap <= ww_soap;
water <= ww_water;
brush <= ww_brush;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_current_state.s26~DUPLICATE_q\ <= NOT \current_state.s26~DUPLICATE_q\;
\ALT_INV_current_state.s13~DUPLICATE_q\ <= NOT \current_state.s13~DUPLICATE_q\;
\ALT_INV_current_state.s24~DUPLICATE_q\ <= NOT \current_state.s24~DUPLICATE_q\;
\ALT_INV_current_state.s25~DUPLICATE_q\ <= NOT \current_state.s25~DUPLICATE_q\;
\ALT_INV_current_state.s12~DUPLICATE_q\ <= NOT \current_state.s12~DUPLICATE_q\;
\ALT_INV_current_state.s23~DUPLICATE_q\ <= NOT \current_state.s23~DUPLICATE_q\;
\ALT_INV_current_state.s22~DUPLICATE_q\ <= NOT \current_state.s22~DUPLICATE_q\;
\ALT_INV_token_2~input_o\ <= NOT \token_2~input_o\;
\ALT_INV_token_1~input_o\ <= NOT \token_1~input_o\;
\t0|ALT_INV_Add0~3_combout\ <= NOT \t0|Add0~3_combout\;
\t0|ALT_INV_Add0~2_combout\ <= NOT \t0|Add0~2_combout\;
\t0|ALT_INV_Add0~1_combout\ <= NOT \t0|Add0~1_combout\;
\ALT_INV_WideOr10~2_combout\ <= NOT \WideOr10~2_combout\;
\ALT_INV_WideOr10~1_combout\ <= NOT \WideOr10~1_combout\;
\ALT_INV_WideOr10~0_combout\ <= NOT \WideOr10~0_combout\;
\ALT_INV_start_timer~3_combout\ <= NOT \start_timer~3_combout\;
\ALT_INV_start_timer~2_combout\ <= NOT \start_timer~2_combout\;
\ALT_INV_start_timer~1_combout\ <= NOT \start_timer~1_combout\;
\ALT_INV_Selector9~0_combout\ <= NOT \Selector9~0_combout\;
\t0|ALT_INV_Add0~0_combout\ <= NOT \t0|Add0~0_combout\;
\t0|ALT_INV_cnt\(0) <= NOT \t0|cnt\(0);
\ALT_INV_start_timer~0_combout\ <= NOT \start_timer~0_combout\;
\ALT_INV_Selector0~0_combout\ <= NOT \Selector0~0_combout\;
\ALT_INV_current_state.s26~q\ <= NOT \current_state.s26~q\;
\ALT_INV_current_state.s13~q\ <= NOT \current_state.s13~q\;
\ALT_INV_time_10sec~0_combout\ <= NOT \time_10sec~0_combout\;
\ALT_INV_current_state.s24~q\ <= NOT \current_state.s24~q\;
\t0|ALT_INV_cnt\(4) <= NOT \t0|cnt\(4);
\t0|ALT_INV_cnt\(2) <= NOT \t0|cnt\(2);
\t0|ALT_INV_cnt\(3) <= NOT \t0|cnt\(3);
\t0|ALT_INV_cnt\(1) <= NOT \t0|cnt\(1);
\ALT_INV_brush~0_combout\ <= NOT \brush~0_combout\;
\ALT_INV_current_state.Initial~q\ <= NOT \current_state.Initial~q\;
\ALT_INV_current_state.s21~q\ <= NOT \current_state.s21~q\;
\ALT_INV_current_state.s11~q\ <= NOT \current_state.s11~q\;
\ALT_INV_current_state.s25~q\ <= NOT \current_state.s25~q\;
\ALT_INV_current_state.s12~q\ <= NOT \current_state.s12~q\;
\ALT_INV_current_state.s23~q\ <= NOT \current_state.s23~q\;
\ALT_INV_current_state.s22~q\ <= NOT \current_state.s22~q\;

-- Location: IOOBUF_X89_Y36_N39
\soap~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \soap~0_combout\,
	devoe => ww_devoe,
	o => ww_soap);

-- Location: IOOBUF_X89_Y35_N45
\water~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \water~0_combout\,
	devoe => ww_devoe,
	o => ww_water);

-- Location: IOOBUF_X89_Y36_N5
\brush~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_brush~0_combout\,
	devoe => ww_devoe,
	o => ww_brush);

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: FF_X70_Y32_N37
\current_state.s13~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector3~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s13~DUPLICATE_q\);

-- Location: FF_X70_Y32_N55
\current_state.s26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector9~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s26~q\);

-- Location: FF_X71_Y32_N55
\current_state.s24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s24~q\);

-- Location: LABCELL_X71_Y32_N15
\Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = ( \t0|cnt\(3) & ( (!\t0|cnt\(1) & ((\current_state.s23~DUPLICATE_q\))) # (\t0|cnt\(1) & (\current_state.s22~DUPLICATE_q\)) ) ) # ( !\t0|cnt\(3) & ( \current_state.s23~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111010101010000111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.s22~DUPLICATE_q\,
	datac => \ALT_INV_current_state.s23~DUPLICATE_q\,
	datad => \t0|ALT_INV_cnt\(1),
	dataf => \t0|ALT_INV_cnt\(3),
	combout => \Selector6~0_combout\);

-- Location: FF_X70_Y32_N16
\current_state.s23~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector6~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s23~DUPLICATE_q\);

-- Location: LABCELL_X71_Y32_N54
\Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = ( \current_state.s24~q\ & ( \current_state.s23~DUPLICATE_q\ & ( (!\t0|cnt\(4)) # ((!\t0|cnt\(2)) # ((\t0|cnt\(3) & \t0|cnt\(1)))) ) ) ) # ( !\current_state.s24~q\ & ( \current_state.s23~DUPLICATE_q\ & ( (\t0|cnt\(3) & \t0|cnt\(1)) 
-- ) ) ) # ( \current_state.s24~q\ & ( !\current_state.s23~DUPLICATE_q\ & ( (!\t0|cnt\(4)) # (!\t0|cnt\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111001111110000000000010101011111110011111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(3),
	datab => \t0|ALT_INV_cnt\(4),
	datac => \t0|ALT_INV_cnt\(2),
	datad => \t0|ALT_INV_cnt\(1),
	datae => \ALT_INV_current_state.s24~q\,
	dataf => \ALT_INV_current_state.s23~DUPLICATE_q\,
	combout => \Selector7~0_combout\);

-- Location: FF_X71_Y32_N56
\current_state.s24~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s24~DUPLICATE_q\);

-- Location: FF_X70_Y32_N19
\current_state.s25~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector8~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s25~DUPLICATE_q\);

-- Location: LABCELL_X71_Y32_N0
\Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = ( \t0|cnt\(2) & ( \t0|cnt\(1) & ( (!\t0|cnt\(4) & (((\current_state.s25~DUPLICATE_q\)))) # (\t0|cnt\(4) & (((\current_state.s25~DUPLICATE_q\ & !\t0|cnt\(3))) # (\current_state.s24~DUPLICATE_q\))) ) ) ) # ( !\t0|cnt\(2) & ( 
-- \t0|cnt\(1) & ( \current_state.s25~DUPLICATE_q\ ) ) ) # ( \t0|cnt\(2) & ( !\t0|cnt\(1) & ( ((\current_state.s24~DUPLICATE_q\ & \t0|cnt\(4))) # (\current_state.s25~DUPLICATE_q\) ) ) ) # ( !\t0|cnt\(2) & ( !\t0|cnt\(1) & ( \current_state.s25~DUPLICATE_q\ ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001101110011011100110011001100110011011100110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.s24~DUPLICATE_q\,
	datab => \ALT_INV_current_state.s25~DUPLICATE_q\,
	datac => \t0|ALT_INV_cnt\(4),
	datad => \t0|ALT_INV_cnt\(3),
	datae => \t0|ALT_INV_cnt\(2),
	dataf => \t0|ALT_INV_cnt\(1),
	combout => \Selector8~0_combout\);

-- Location: FF_X70_Y32_N20
\current_state.s25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector8~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s25~q\);

-- Location: LABCELL_X70_Y32_N27
\Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = ( \t0|cnt\(1) & ( \current_state.s25~q\ & ( (!\t0|cnt\(3) & (((\current_state.s26~q\)))) # (\t0|cnt\(3) & (\t0|cnt\(2) & ((\t0|cnt\(4))))) ) ) ) # ( !\t0|cnt\(1) & ( \current_state.s25~q\ & ( \current_state.s26~q\ ) ) ) # ( 
-- \t0|cnt\(1) & ( !\current_state.s25~q\ & ( (!\t0|cnt\(3) & \current_state.s26~q\) ) ) ) # ( !\t0|cnt\(1) & ( !\current_state.s25~q\ & ( \current_state.s26~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011000000110000001111000011110000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(2),
	datab => \t0|ALT_INV_cnt\(3),
	datac => \ALT_INV_current_state.s26~q\,
	datad => \t0|ALT_INV_cnt\(4),
	datae => \t0|ALT_INV_cnt\(1),
	dataf => \ALT_INV_current_state.s25~q\,
	combout => \Selector9~0_combout\);

-- Location: FF_X70_Y32_N56
\current_state.s26~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector9~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s26~DUPLICATE_q\);

-- Location: IOIBUF_X89_Y35_N95
\token_2~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_token_2,
	o => \token_2~input_o\);

-- Location: IOIBUF_X89_Y35_N78
\token_1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_token_1,
	o => \token_1~input_o\);

-- Location: LABCELL_X71_Y32_N6
\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ( \current_state.Initial~q\ & ( \current_state.s11~q\ & ( (!\t0|cnt\(3)) # (!\t0|cnt\(1)) ) ) ) # ( !\current_state.Initial~q\ & ( \current_state.s11~q\ & ( (!\t0|cnt\(3)) # ((!\t0|cnt\(1)) # ((!\token_2~input_o\ & 
-- \token_1~input_o\))) ) ) ) # ( !\current_state.Initial~q\ & ( !\current_state.s11~q\ & ( (!\token_2~input_o\ & \token_1~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010000000000000000011111111111100101111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_token_2~input_o\,
	datab => \ALT_INV_token_1~input_o\,
	datac => \t0|ALT_INV_cnt\(3),
	datad => \t0|ALT_INV_cnt\(1),
	datae => \ALT_INV_current_state.Initial~q\,
	dataf => \ALT_INV_current_state.s11~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X70_Y32_N5
\current_state.s11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector1~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s11~q\);

-- Location: FF_X71_Y32_N58
\current_state.s12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s12~q\);

-- Location: LABCELL_X70_Y32_N9
\start_timer~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \start_timer~3_combout\ = ( \current_state.s11~q\ & ( \current_state.s12~q\ & ( (\t0|cnt\(2) & (\t0|cnt\(4) & ((!\t0|cnt\(3)) # (!\t0|cnt\(1))))) ) ) ) # ( !\current_state.s11~q\ & ( \current_state.s12~q\ & ( (\t0|cnt\(2) & \t0|cnt\(4)) ) ) ) # ( 
-- \current_state.s11~q\ & ( !\current_state.s12~q\ & ( (\t0|cnt\(3) & \t0|cnt\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000110000001100000000010101010000000001010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(2),
	datab => \t0|ALT_INV_cnt\(3),
	datac => \t0|ALT_INV_cnt\(1),
	datad => \t0|ALT_INV_cnt\(4),
	datae => \ALT_INV_current_state.s11~q\,
	dataf => \ALT_INV_current_state.s12~q\,
	combout => \start_timer~3_combout\);

-- Location: LABCELL_X70_Y32_N57
\start_timer~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \start_timer~1_combout\ = ( \t0|cnt\(1) & ( \current_state.s25~q\ & ( (\t0|cnt\(4) & (\t0|cnt\(3) & (!\current_state.s24~DUPLICATE_q\ & \t0|cnt\(2)))) ) ) ) # ( \t0|cnt\(1) & ( !\current_state.s25~q\ & ( (\t0|cnt\(4) & (\current_state.s24~DUPLICATE_q\ & 
-- \t0|cnt\(2))) ) ) ) # ( !\t0|cnt\(1) & ( !\current_state.s25~q\ & ( (\t0|cnt\(4) & (\current_state.s24~DUPLICATE_q\ & \t0|cnt\(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000010100000000000000000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(4),
	datab => \t0|ALT_INV_cnt\(3),
	datac => \ALT_INV_current_state.s24~DUPLICATE_q\,
	datad => \t0|ALT_INV_cnt\(2),
	datae => \t0|ALT_INV_cnt\(1),
	dataf => \ALT_INV_current_state.s25~q\,
	combout => \start_timer~1_combout\);

-- Location: FF_X70_Y32_N17
\current_state.s23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector6~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s23~q\);

-- Location: LABCELL_X70_Y32_N33
\WideOr10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr10~0_combout\ = ( \current_state.s22~DUPLICATE_q\ & ( (\t0|cnt\(3) & (\t0|cnt\(1) & ((!\current_state.s21~q\) # (!\current_state.s23~q\)))) ) ) # ( !\current_state.s22~DUPLICATE_q\ & ( (\t0|cnt\(3) & (\t0|cnt\(1) & ((\current_state.s23~q\) # 
-- (\current_state.s21~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010011000000000001001100000000001100100000000000110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.s21~q\,
	datab => \t0|ALT_INV_cnt\(3),
	datac => \ALT_INV_current_state.s23~q\,
	datad => \t0|ALT_INV_cnt\(1),
	dataf => \ALT_INV_current_state.s22~DUPLICATE_q\,
	combout => \WideOr10~0_combout\);

-- Location: LABCELL_X70_Y32_N6
\start_timer~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \start_timer~2_combout\ = ( \current_state.s23~DUPLICATE_q\ & ( \current_state.s24~q\ & ( (\t0|cnt\(2) & (\t0|cnt\(4) & ((!\t0|cnt\(3)) # (!\t0|cnt\(1))))) ) ) ) # ( !\current_state.s23~DUPLICATE_q\ & ( \current_state.s24~q\ & ( (\t0|cnt\(2) & 
-- \t0|cnt\(4)) ) ) ) # ( \current_state.s23~DUPLICATE_q\ & ( !\current_state.s24~q\ & ( (\t0|cnt\(3) & \t0|cnt\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000011001100000101000001010000010100000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(2),
	datab => \t0|ALT_INV_cnt\(3),
	datac => \t0|ALT_INV_cnt\(4),
	datad => \t0|ALT_INV_cnt\(1),
	datae => \ALT_INV_current_state.s23~DUPLICATE_q\,
	dataf => \ALT_INV_current_state.s24~q\,
	combout => \start_timer~2_combout\);

-- Location: LABCELL_X70_Y32_N39
\WideOr10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr10~1_combout\ = ( \Selector9~0_combout\ & ( !\start_timer~2_combout\ & ( (\current_state.s26~DUPLICATE_q\ & (!\start_timer~3_combout\ & (!\start_timer~1_combout\ & !\WideOr10~0_combout\))) ) ) ) # ( !\Selector9~0_combout\ & ( 
-- !\start_timer~2_combout\ & ( (!\current_state.s26~DUPLICATE_q\ & (!\start_timer~3_combout\ & (!\start_timer~1_combout\ & !\WideOr10~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000010000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.s26~DUPLICATE_q\,
	datab => \ALT_INV_start_timer~3_combout\,
	datac => \ALT_INV_start_timer~1_combout\,
	datad => \ALT_INV_WideOr10~0_combout\,
	datae => \ALT_INV_Selector9~0_combout\,
	dataf => \ALT_INV_start_timer~2_combout\,
	combout => \WideOr10~1_combout\);

-- Location: LABCELL_X70_Y32_N12
\t0|cnt~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|cnt~4_combout\ = ( !\t0|cnt\(0) & ( \WideOr10~1_combout\ & ( (!\WideOr10~2_combout\ & (!\start_timer~0_combout\ & (!\current_state.Initial~q\ $ (\Selector0~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010010000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.Initial~q\,
	datab => \ALT_INV_Selector0~0_combout\,
	datac => \ALT_INV_WideOr10~2_combout\,
	datad => \ALT_INV_start_timer~0_combout\,
	datae => \t0|ALT_INV_cnt\(0),
	dataf => \ALT_INV_WideOr10~1_combout\,
	combout => \t0|cnt~4_combout\);

-- Location: FF_X70_Y32_N14
\t0|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \t0|cnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \t0|cnt\(0));

-- Location: LABCELL_X71_Y32_N30
\t0|Add0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|Add0~2_combout\ = ( \t0|cnt\(2) & ( (!\t0|cnt\(1)) # (\t0|cnt\(0)) ) ) # ( !\t0|cnt\(2) & ( (\t0|cnt\(1) & !\t0|cnt\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000011110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \t0|ALT_INV_cnt\(1),
	datad => \t0|ALT_INV_cnt\(0),
	dataf => \t0|ALT_INV_cnt\(2),
	combout => \t0|Add0~2_combout\);

-- Location: LABCELL_X70_Y32_N51
\t0|cnt~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|cnt~2_combout\ = ( \t0|Add0~2_combout\ & ( \WideOr10~1_combout\ & ( (!\WideOr10~2_combout\ & (!\start_timer~0_combout\ & (!\current_state.Initial~q\ $ (\Selector0~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_WideOr10~2_combout\,
	datab => \ALT_INV_current_state.Initial~q\,
	datac => \ALT_INV_start_timer~0_combout\,
	datad => \ALT_INV_Selector0~0_combout\,
	datae => \t0|ALT_INV_Add0~2_combout\,
	dataf => \ALT_INV_WideOr10~1_combout\,
	combout => \t0|cnt~2_combout\);

-- Location: FF_X70_Y32_N53
\t0|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \t0|cnt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \t0|cnt\(2));

-- Location: LABCELL_X71_Y32_N57
\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = ( \current_state.s12~q\ & ( \current_state.s11~q\ & ( (!\t0|cnt\(4)) # ((!\t0|cnt\(2)) # ((\t0|cnt\(3) & \t0|cnt\(1)))) ) ) ) # ( !\current_state.s12~q\ & ( \current_state.s11~q\ & ( (\t0|cnt\(3) & \t0|cnt\(1)) ) ) ) # ( 
-- \current_state.s12~q\ & ( !\current_state.s11~q\ & ( (!\t0|cnt\(4)) # (!\t0|cnt\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111100110000000101000001011111111111001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(3),
	datab => \t0|ALT_INV_cnt\(4),
	datac => \t0|ALT_INV_cnt\(1),
	datad => \t0|ALT_INV_cnt\(2),
	datae => \ALT_INV_current_state.s12~q\,
	dataf => \ALT_INV_current_state.s11~q\,
	combout => \Selector2~0_combout\);

-- Location: FF_X71_Y32_N59
\current_state.s12~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s12~DUPLICATE_q\);

-- Location: LABCELL_X71_Y32_N24
\start_timer~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \start_timer~0_combout\ = ( \t0|cnt\(3) & ( \t0|cnt\(4) & ( (!\current_state.s13~DUPLICATE_q\ & (\current_state.s12~DUPLICATE_q\ & ((\t0|cnt\(2))))) # (\current_state.s13~DUPLICATE_q\ & (\t0|cnt\(1) & ((!\current_state.s12~DUPLICATE_q\) # 
-- (!\t0|cnt\(2))))) ) ) ) # ( !\t0|cnt\(3) & ( \t0|cnt\(4) & ( (!\current_state.s13~DUPLICATE_q\ & (\current_state.s12~DUPLICATE_q\ & \t0|cnt\(2))) ) ) ) # ( \t0|cnt\(3) & ( !\t0|cnt\(4) & ( (\current_state.s13~DUPLICATE_q\ & \t0|cnt\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000001000100000010100100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.s13~DUPLICATE_q\,
	datab => \ALT_INV_current_state.s12~DUPLICATE_q\,
	datac => \t0|ALT_INV_cnt\(1),
	datad => \t0|ALT_INV_cnt\(2),
	datae => \t0|ALT_INV_cnt\(3),
	dataf => \t0|ALT_INV_cnt\(4),
	combout => \start_timer~0_combout\);

-- Location: LABCELL_X71_Y32_N21
\t0|Add0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|Add0~3_combout\ = ( \t0|cnt\(3) & ( !\t0|cnt\(4) $ (((!\t0|cnt\(2)) # ((!\t0|cnt\(1)) # (\t0|cnt\(0))))) ) ) # ( !\t0|cnt\(3) & ( \t0|cnt\(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010110010101010101011001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(4),
	datab => \t0|ALT_INV_cnt\(2),
	datac => \t0|ALT_INV_cnt\(1),
	datad => \t0|ALT_INV_cnt\(0),
	dataf => \t0|ALT_INV_cnt\(3),
	combout => \t0|Add0~3_combout\);

-- Location: LABCELL_X70_Y32_N48
\t0|cnt~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|cnt~3_combout\ = ( \t0|Add0~3_combout\ & ( \WideOr10~1_combout\ & ( (!\WideOr10~2_combout\ & (!\start_timer~0_combout\ & (!\current_state.Initial~q\ $ (\Selector0~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_WideOr10~2_combout\,
	datab => \ALT_INV_current_state.Initial~q\,
	datac => \ALT_INV_Selector0~0_combout\,
	datad => \ALT_INV_start_timer~0_combout\,
	datae => \t0|ALT_INV_Add0~3_combout\,
	dataf => \ALT_INV_WideOr10~1_combout\,
	combout => \t0|cnt~3_combout\);

-- Location: FF_X70_Y32_N50
\t0|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \t0|cnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \t0|cnt\(4));

-- Location: LABCELL_X71_Y32_N36
\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( \t0|cnt\(2) & ( \t0|cnt\(1) & ( (!\t0|cnt\(4) & (((\current_state.s13~DUPLICATE_q\ & !\t0|cnt\(3))))) # (\t0|cnt\(4) & (((\current_state.s13~DUPLICATE_q\ & !\t0|cnt\(3))) # (\current_state.s12~DUPLICATE_q\))) ) ) ) # ( 
-- !\t0|cnt\(2) & ( \t0|cnt\(1) & ( (\current_state.s13~DUPLICATE_q\ & !\t0|cnt\(3)) ) ) ) # ( \t0|cnt\(2) & ( !\t0|cnt\(1) & ( ((\t0|cnt\(4) & \current_state.s12~DUPLICATE_q\)) # (\current_state.s13~DUPLICATE_q\) ) ) ) # ( !\t0|cnt\(2) & ( !\t0|cnt\(1) & ( 
-- \current_state.s13~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000111110001111100001111000000000001111100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(4),
	datab => \ALT_INV_current_state.s12~DUPLICATE_q\,
	datac => \ALT_INV_current_state.s13~DUPLICATE_q\,
	datad => \t0|ALT_INV_cnt\(3),
	datae => \t0|ALT_INV_cnt\(2),
	dataf => \t0|ALT_INV_cnt\(1),
	combout => \Selector3~0_combout\);

-- Location: FF_X70_Y32_N38
\current_state.s13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector3~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s13~q\);

-- Location: LABCELL_X70_Y32_N30
\time_10sec~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \time_10sec~0_combout\ = ( \t0|cnt\(3) & ( \t0|cnt\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \t0|ALT_INV_cnt\(1),
	dataf => \t0|ALT_INV_cnt\(3),
	combout => \time_10sec~0_combout\);

-- Location: LABCELL_X70_Y32_N21
\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ( \current_state.Initial~q\ & ( \time_10sec~0_combout\ & ( (!\current_state.s13~q\ & !\current_state.s26~DUPLICATE_q\) ) ) ) # ( !\current_state.Initial~q\ & ( \time_10sec~0_combout\ & ( (!\current_state.s13~q\ & 
-- (!\current_state.s26~DUPLICATE_q\ & ((\token_1~input_o\) # (\token_2~input_o\)))) ) ) ) # ( \current_state.Initial~q\ & ( !\time_10sec~0_combout\ ) ) # ( !\current_state.Initial~q\ & ( !\time_10sec~0_combout\ & ( (\token_1~input_o\) # (\token_2~input_o\) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111111111111111111100101010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.s13~q\,
	datab => \ALT_INV_token_2~input_o\,
	datac => \ALT_INV_token_1~input_o\,
	datad => \ALT_INV_current_state.s26~DUPLICATE_q\,
	datae => \ALT_INV_current_state.Initial~q\,
	dataf => \ALT_INV_time_10sec~0_combout\,
	combout => \Selector0~0_combout\);

-- Location: FF_X70_Y32_N23
\current_state.Initial\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Initial~q\);

-- Location: LABCELL_X71_Y32_N45
\t0|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|Add0~0_combout\ = ( \t0|cnt\(0) & ( \t0|cnt\(1) ) ) # ( !\t0|cnt\(0) & ( !\t0|cnt\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \t0|ALT_INV_cnt\(1),
	dataf => \t0|ALT_INV_cnt\(0),
	combout => \t0|Add0~0_combout\);

-- Location: LABCELL_X70_Y32_N45
\t0|cnt~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|cnt~0_combout\ = ( \t0|Add0~0_combout\ & ( \WideOr10~1_combout\ & ( (!\WideOr10~2_combout\ & (!\start_timer~0_combout\ & (!\current_state.Initial~q\ $ (\Selector0~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_WideOr10~2_combout\,
	datab => \ALT_INV_current_state.Initial~q\,
	datac => \ALT_INV_start_timer~0_combout\,
	datad => \ALT_INV_Selector0~0_combout\,
	datae => \t0|ALT_INV_Add0~0_combout\,
	dataf => \ALT_INV_WideOr10~1_combout\,
	combout => \t0|cnt~0_combout\);

-- Location: FF_X70_Y32_N47
\t0|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \t0|cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \t0|cnt\(1));

-- Location: LABCELL_X71_Y32_N42
\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = ( \current_state.s21~q\ & ( (!\t0|cnt\(1)) # ((!\t0|cnt\(3)) # ((\token_2~input_o\ & !\current_state.Initial~q\))) ) ) # ( !\current_state.s21~q\ & ( (\token_2~input_o\ & !\current_state.Initial~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000011111011111110101111101111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(1),
	datab => \ALT_INV_token_2~input_o\,
	datac => \t0|ALT_INV_cnt\(3),
	datad => \ALT_INV_current_state.Initial~q\,
	dataf => \ALT_INV_current_state.s21~q\,
	combout => \Selector4~0_combout\);

-- Location: FF_X70_Y32_N26
\current_state.s21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector4~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s21~q\);

-- Location: LABCELL_X70_Y32_N0
\WideOr10~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr10~2_combout\ = ( \current_state.Initial~q\ & ( \time_10sec~0_combout\ & ( (\current_state.s11~q\) # (\current_state.s21~q\) ) ) ) # ( !\current_state.Initial~q\ & ( \time_10sec~0_combout\ & ( (!\current_state.s21~q\ & ((!\current_state.s11~q\ $ 
-- (!\token_1~input_o\)) # (\token_2~input_o\))) # (\current_state.s21~q\ & ((!\token_2~input_o\) # ((\current_state.s11~q\)))) ) ) ) # ( !\current_state.Initial~q\ & ( !\time_10sec~0_combout\ & ( (!\token_2~input_o\ & (((!\current_state.s11~q\ & 
-- \token_1~input_o\)))) # (\token_2~input_o\ & (!\current_state.s21~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001011100010000000000000000001101111111001110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.s21~q\,
	datab => \ALT_INV_token_2~input_o\,
	datac => \ALT_INV_current_state.s11~q\,
	datad => \ALT_INV_token_1~input_o\,
	datae => \ALT_INV_current_state.Initial~q\,
	dataf => \ALT_INV_time_10sec~0_combout\,
	combout => \WideOr10~2_combout\);

-- Location: LABCELL_X71_Y32_N48
\t0|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|Add0~1_combout\ = ( \t0|cnt\(1) & ( !\t0|cnt\(3) $ (((!\t0|cnt\(2)) # (\t0|cnt\(0)))) ) ) # ( !\t0|cnt\(1) & ( \t0|cnt\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100111100000011110011110000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \t0|ALT_INV_cnt\(2),
	datac => \t0|ALT_INV_cnt\(3),
	datad => \t0|ALT_INV_cnt\(0),
	dataf => \t0|ALT_INV_cnt\(1),
	combout => \t0|Add0~1_combout\);

-- Location: LABCELL_X70_Y32_N42
\t0|cnt~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|cnt~1_combout\ = ( \t0|Add0~1_combout\ & ( \WideOr10~1_combout\ & ( (!\WideOr10~2_combout\ & (!\start_timer~0_combout\ & (!\current_state.Initial~q\ $ (\Selector0~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_WideOr10~2_combout\,
	datab => \ALT_INV_current_state.Initial~q\,
	datac => \ALT_INV_Selector0~0_combout\,
	datad => \ALT_INV_start_timer~0_combout\,
	datae => \t0|ALT_INV_Add0~1_combout\,
	dataf => \ALT_INV_WideOr10~1_combout\,
	combout => \t0|cnt~1_combout\);

-- Location: FF_X70_Y32_N44
\t0|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \t0|cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \t0|cnt\(3));

-- Location: FF_X71_Y32_N34
\current_state.s22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s22~q\);

-- Location: LABCELL_X71_Y32_N33
\Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = ( \current_state.s21~q\ & ( ((\t0|cnt\(3) & \t0|cnt\(1))) # (\current_state.s22~q\) ) ) # ( !\current_state.s21~q\ & ( (\current_state.s22~q\ & ((!\t0|cnt\(3)) # (!\t0|cnt\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011101110000000001110111000010001111111110001000111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(3),
	datab => \t0|ALT_INV_cnt\(1),
	datad => \ALT_INV_current_state.s22~q\,
	dataf => \ALT_INV_current_state.s21~q\,
	combout => \Selector5~0_combout\);

-- Location: FF_X71_Y32_N35
\current_state.s22~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s22~DUPLICATE_q\);

-- Location: LABCELL_X71_Y32_N18
\soap~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \soap~0_combout\ = ( \current_state.s23~DUPLICATE_q\ ) # ( !\current_state.s23~DUPLICATE_q\ & ( \current_state.s22~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_current_state.s22~DUPLICATE_q\,
	dataf => \ALT_INV_current_state.s23~DUPLICATE_q\,
	combout => \soap~0_combout\);

-- Location: LABCELL_X71_Y32_N12
\water~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \water~0_combout\ = ( \current_state.s25~DUPLICATE_q\ ) # ( !\current_state.s25~DUPLICATE_q\ & ( ((\current_state.s12~DUPLICATE_q\) # (\current_state.s21~q\)) # (\current_state.s11~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111111111111001111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_current_state.s11~q\,
	datac => \ALT_INV_current_state.s21~q\,
	datad => \ALT_INV_current_state.s12~DUPLICATE_q\,
	dataf => \ALT_INV_current_state.s25~DUPLICATE_q\,
	combout => \water~0_combout\);

-- Location: LABCELL_X71_Y32_N51
\brush~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \brush~0_combout\ = ( \current_state.s11~q\ ) # ( !\current_state.s11~q\ & ( ((!\current_state.Initial~q\) # (\current_state.s22~q\)) # (\current_state.s21~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111101011111111111110101111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.s21~q\,
	datac => \ALT_INV_current_state.s22~q\,
	datad => \ALT_INV_current_state.Initial~q\,
	dataf => \ALT_INV_current_state.s11~q\,
	combout => \brush~0_combout\);

-- Location: MLABCELL_X72_Y15_N0
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


