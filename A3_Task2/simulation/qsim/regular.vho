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

-- DATE "03/16/2020 02:23:19"

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

ENTITY 	regular IS
    PORT (
	clk : IN std_logic;
	token_1 : IN std_logic;
	water : OUT std_logic;
	brush : OUT std_logic
	);
END regular;

-- Design Ports Information
-- water	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- brush	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- token_1	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF regular IS
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
SIGNAL ww_water : std_logic;
SIGNAL ww_brush : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \token_1~input_o\ : std_logic;
SIGNAL \current_state.B10s~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \current_state.Initial~q\ : std_logic;
SIGNAL \WideOr0~0_combout\ : std_logic;
SIGNAL \t0|cnt~4_combout\ : std_logic;
SIGNAL \t0|Add0~0_combout\ : std_logic;
SIGNAL \t0|cnt~0_combout\ : std_logic;
SIGNAL \t0|Add0~2_combout\ : std_logic;
SIGNAL \t0|cnt~2_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \current_state.WB20s~q\ : std_logic;
SIGNAL \t0|Add0~3_combout\ : std_logic;
SIGNAL \t0|cnt~3_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \current_state.B10s~DUPLICATE_q\ : std_logic;
SIGNAL \t0|Add0~1_combout\ : std_logic;
SIGNAL \t0|cnt~1_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \current_state.W10s~q\ : std_logic;
SIGNAL \water~0_combout\ : std_logic;
SIGNAL \brush~0_combout\ : std_logic;
SIGNAL \t0|cnt\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_current_state.W10s~q\ : std_logic;
SIGNAL \ALT_INV_current_state.B10s~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_token_1~input_o\ : std_logic;
SIGNAL \t0|ALT_INV_Add0~3_combout\ : std_logic;
SIGNAL \t0|ALT_INV_Add0~2_combout\ : std_logic;
SIGNAL \t0|ALT_INV_Add0~1_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr0~0_combout\ : std_logic;
SIGNAL \t0|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \t0|ALT_INV_cnt\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_Selector3~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \ALT_INV_current_state.Initial~q\ : std_logic;
SIGNAL \ALT_INV_current_state.B10s~q\ : std_logic;
SIGNAL \ALT_INV_current_state.WB20s~q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_token_1 <= token_1;
water <= ww_water;
brush <= ww_brush;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_current_state.W10s~q\ <= NOT \current_state.W10s~q\;
\ALT_INV_current_state.B10s~DUPLICATE_q\ <= NOT \current_state.B10s~DUPLICATE_q\;
\ALT_INV_token_1~input_o\ <= NOT \token_1~input_o\;
\t0|ALT_INV_Add0~3_combout\ <= NOT \t0|Add0~3_combout\;
\t0|ALT_INV_Add0~2_combout\ <= NOT \t0|Add0~2_combout\;
\t0|ALT_INV_Add0~1_combout\ <= NOT \t0|Add0~1_combout\;
\ALT_INV_WideOr0~0_combout\ <= NOT \WideOr0~0_combout\;
\t0|ALT_INV_Add0~0_combout\ <= NOT \t0|Add0~0_combout\;
\t0|ALT_INV_cnt\(0) <= NOT \t0|cnt\(0);
\ALT_INV_Selector3~0_combout\ <= NOT \Selector3~0_combout\;
\ALT_INV_Selector2~0_combout\ <= NOT \Selector2~0_combout\;
\t0|ALT_INV_cnt\(4) <= NOT \t0|cnt\(4);
\t0|ALT_INV_cnt\(2) <= NOT \t0|cnt\(2);
\t0|ALT_INV_cnt\(3) <= NOT \t0|cnt\(3);
\t0|ALT_INV_cnt\(1) <= NOT \t0|cnt\(1);
\ALT_INV_current_state.Initial~q\ <= NOT \current_state.Initial~q\;
\ALT_INV_current_state.B10s~q\ <= NOT \current_state.B10s~q\;
\ALT_INV_current_state.WB20s~q\ <= NOT \current_state.WB20s~q\;

-- Location: IOOBUF_X2_Y0_N59
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

-- Location: IOOBUF_X2_Y0_N76
\brush~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \brush~0_combout\,
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

-- Location: IOIBUF_X2_Y0_N41
\token_1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_token_1,
	o => \token_1~input_o\);

-- Location: FF_X2_Y1_N53
\current_state.B10s\ : dffeas
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
	q => \current_state.B10s~q\);

-- Location: LABCELL_X2_Y1_N0
\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ( \current_state.B10s~q\ & ( (!\t0|cnt\(3) & (((\current_state.Initial~q\)) # (\token_1~input_o\))) # (\t0|cnt\(3) & (!\t0|cnt\(1) & ((\current_state.Initial~q\) # (\token_1~input_o\)))) ) ) # ( !\current_state.B10s~q\ & ( 
-- (\current_state.Initial~q\) # (\token_1~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100110010111110100011001011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(3),
	datab => \ALT_INV_token_1~input_o\,
	datac => \t0|ALT_INV_cnt\(1),
	datad => \ALT_INV_current_state.Initial~q\,
	dataf => \ALT_INV_current_state.B10s~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X2_Y1_N2
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

-- Location: LABCELL_X2_Y1_N42
\WideOr0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr0~0_combout\ = ( \t0|cnt\(3) & ( \t0|cnt\(1) & ( (!\current_state.W10s~q\ & ((!\current_state.Initial~q\ & (\token_1~input_o\)) # (\current_state.Initial~q\ & ((\current_state.B10s~DUPLICATE_q\))))) # (\current_state.W10s~q\ & ((!\token_1~input_o\) 
-- # ((!\current_state.B10s~DUPLICATE_q\) # (\current_state.Initial~q\)))) ) ) ) # ( !\t0|cnt\(3) & ( \t0|cnt\(1) & ( (\token_1~input_o\ & !\current_state.Initial~q\) ) ) ) # ( \t0|cnt\(3) & ( !\t0|cnt\(1) & ( (\token_1~input_o\ & !\current_state.Initial~q\) 
-- ) ) ) # ( !\t0|cnt\(3) & ( !\t0|cnt\(1) & ( (\token_1~input_o\ & !\current_state.Initial~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000110000001100000111010101101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.W10s~q\,
	datab => \ALT_INV_token_1~input_o\,
	datac => \ALT_INV_current_state.Initial~q\,
	datad => \ALT_INV_current_state.B10s~DUPLICATE_q\,
	datae => \t0|ALT_INV_cnt\(3),
	dataf => \t0|ALT_INV_cnt\(1),
	combout => \WideOr0~0_combout\);

-- Location: LABCELL_X2_Y1_N48
\t0|cnt~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|cnt~4_combout\ = ( !\t0|cnt\(0) & ( \Selector3~0_combout\ & ( (\current_state.B10s~q\ & (!\WideOr0~0_combout\ & (!\current_state.WB20s~q\ $ (\Selector2~0_combout\)))) ) ) ) # ( !\t0|cnt\(0) & ( !\Selector3~0_combout\ & ( (!\current_state.B10s~q\ & 
-- (!\WideOr0~0_combout\ & (!\current_state.WB20s~q\ $ (\Selector2~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001000000000000000000000000000000001001000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.WB20s~q\,
	datab => \ALT_INV_Selector2~0_combout\,
	datac => \ALT_INV_current_state.B10s~q\,
	datad => \ALT_INV_WideOr0~0_combout\,
	datae => \t0|ALT_INV_cnt\(0),
	dataf => \ALT_INV_Selector3~0_combout\,
	combout => \t0|cnt~4_combout\);

-- Location: FF_X2_Y1_N50
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

-- Location: LABCELL_X2_Y1_N33
\t0|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|Add0~0_combout\ = ( \t0|cnt\(0) & ( \t0|cnt\(1) ) ) # ( !\t0|cnt\(0) & ( !\t0|cnt\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \t0|ALT_INV_cnt\(1),
	dataf => \t0|ALT_INV_cnt\(0),
	combout => \t0|Add0~0_combout\);

-- Location: LABCELL_X2_Y1_N12
\t0|cnt~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|cnt~0_combout\ = ( !\WideOr0~0_combout\ & ( \t0|Add0~0_combout\ & ( (!\current_state.B10s~DUPLICATE_q\ & (!\Selector3~0_combout\ & (!\current_state.WB20s~q\ $ (\Selector2~0_combout\)))) # (\current_state.B10s~DUPLICATE_q\ & (\Selector3~0_combout\ & 
-- (!\current_state.WB20s~q\ $ (\Selector2~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010010000000010010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.B10s~DUPLICATE_q\,
	datab => \ALT_INV_Selector3~0_combout\,
	datac => \ALT_INV_current_state.WB20s~q\,
	datad => \ALT_INV_Selector2~0_combout\,
	datae => \ALT_INV_WideOr0~0_combout\,
	dataf => \t0|ALT_INV_Add0~0_combout\,
	combout => \t0|cnt~0_combout\);

-- Location: FF_X2_Y1_N14
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

-- Location: LABCELL_X2_Y1_N18
\t0|Add0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|Add0~2_combout\ = ( \t0|cnt\(2) & ( (!\t0|cnt\(1)) # (\t0|cnt\(0)) ) ) # ( !\t0|cnt\(2) & ( (\t0|cnt\(1) & !\t0|cnt\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000011001111110011111100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \t0|ALT_INV_cnt\(1),
	datac => \t0|ALT_INV_cnt\(0),
	dataf => \t0|ALT_INV_cnt\(2),
	combout => \t0|Add0~2_combout\);

-- Location: LABCELL_X2_Y1_N15
\t0|cnt~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|cnt~2_combout\ = ( !\WideOr0~0_combout\ & ( \t0|Add0~2_combout\ & ( (!\current_state.B10s~DUPLICATE_q\ & (!\Selector3~0_combout\ & (!\Selector2~0_combout\ $ (\current_state.WB20s~q\)))) # (\current_state.B10s~DUPLICATE_q\ & (\Selector3~0_combout\ & 
-- (!\Selector2~0_combout\ $ (\current_state.WB20s~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010010000000010010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.B10s~DUPLICATE_q\,
	datab => \ALT_INV_Selector3~0_combout\,
	datac => \ALT_INV_Selector2~0_combout\,
	datad => \ALT_INV_current_state.WB20s~q\,
	datae => \ALT_INV_WideOr0~0_combout\,
	dataf => \t0|ALT_INV_Add0~2_combout\,
	combout => \t0|cnt~2_combout\);

-- Location: FF_X2_Y1_N17
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

-- Location: LABCELL_X2_Y1_N57
\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = ( \current_state.W10s~q\ & ( \t0|cnt\(2) & ( (!\t0|cnt\(3) & (((\current_state.WB20s~q\ & !\t0|cnt\(4))))) # (\t0|cnt\(3) & (((\current_state.WB20s~q\ & !\t0|cnt\(4))) # (\t0|cnt\(1)))) ) ) ) # ( !\current_state.W10s~q\ & ( 
-- \t0|cnt\(2) & ( (\current_state.WB20s~q\ & !\t0|cnt\(4)) ) ) ) # ( \current_state.W10s~q\ & ( !\t0|cnt\(2) & ( ((\t0|cnt\(3) & \t0|cnt\(1))) # (\current_state.WB20s~q\) ) ) ) # ( !\current_state.W10s~q\ & ( !\t0|cnt\(2) & ( \current_state.WB20s~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000111110001111100001111000000000001111100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(3),
	datab => \t0|ALT_INV_cnt\(1),
	datac => \ALT_INV_current_state.WB20s~q\,
	datad => \t0|ALT_INV_cnt\(4),
	datae => \ALT_INV_current_state.W10s~q\,
	dataf => \t0|ALT_INV_cnt\(2),
	combout => \Selector2~0_combout\);

-- Location: FF_X2_Y1_N32
\current_state.WB20s\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector2~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.WB20s~q\);

-- Location: LABCELL_X2_Y1_N9
\t0|Add0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|Add0~3_combout\ = ( \t0|cnt\(0) & ( \t0|cnt\(4) ) ) # ( !\t0|cnt\(0) & ( !\t0|cnt\(4) $ (((!\t0|cnt\(1)) # ((!\t0|cnt\(2)) # (!\t0|cnt\(3))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010110010101010101011001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(4),
	datab => \t0|ALT_INV_cnt\(1),
	datac => \t0|ALT_INV_cnt\(2),
	datad => \t0|ALT_INV_cnt\(3),
	dataf => \t0|ALT_INV_cnt\(0),
	combout => \t0|Add0~3_combout\);

-- Location: LABCELL_X2_Y1_N24
\t0|cnt~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|cnt~3_combout\ = ( !\WideOr0~0_combout\ & ( \t0|Add0~3_combout\ & ( (!\current_state.B10s~DUPLICATE_q\ & (!\Selector3~0_combout\ & (!\current_state.WB20s~q\ $ (\Selector2~0_combout\)))) # (\current_state.B10s~DUPLICATE_q\ & (\Selector3~0_combout\ & 
-- (!\current_state.WB20s~q\ $ (\Selector2~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010010000000010010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.B10s~DUPLICATE_q\,
	datab => \ALT_INV_Selector3~0_combout\,
	datac => \ALT_INV_current_state.WB20s~q\,
	datad => \ALT_INV_Selector2~0_combout\,
	datae => \ALT_INV_WideOr0~0_combout\,
	dataf => \t0|ALT_INV_Add0~3_combout\,
	combout => \t0|cnt~3_combout\);

-- Location: FF_X2_Y1_N26
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

-- Location: LABCELL_X2_Y1_N39
\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( \t0|cnt\(3) & ( \t0|cnt\(1) & ( (\t0|cnt\(4) & (\current_state.WB20s~q\ & \t0|cnt\(2))) ) ) ) # ( !\t0|cnt\(3) & ( \t0|cnt\(1) & ( ((\t0|cnt\(4) & (\current_state.WB20s~q\ & \t0|cnt\(2)))) # (\current_state.B10s~q\) ) ) ) # ( 
-- \t0|cnt\(3) & ( !\t0|cnt\(1) & ( ((\t0|cnt\(4) & (\current_state.WB20s~q\ & \t0|cnt\(2)))) # (\current_state.B10s~q\) ) ) ) # ( !\t0|cnt\(3) & ( !\t0|cnt\(1) & ( ((\t0|cnt\(4) & (\current_state.WB20s~q\ & \t0|cnt\(2)))) # (\current_state.B10s~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111111000000011111111100000001111111110000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(4),
	datab => \ALT_INV_current_state.WB20s~q\,
	datac => \t0|ALT_INV_cnt\(2),
	datad => \ALT_INV_current_state.B10s~q\,
	datae => \t0|ALT_INV_cnt\(3),
	dataf => \t0|ALT_INV_cnt\(1),
	combout => \Selector3~0_combout\);

-- Location: FF_X2_Y1_N52
\current_state.B10s~DUPLICATE\ : dffeas
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
	q => \current_state.B10s~DUPLICATE_q\);

-- Location: LABCELL_X2_Y1_N21
\t0|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|Add0~1_combout\ = ( \t0|cnt\(1) & ( !\t0|cnt\(3) $ (((!\t0|cnt\(2)) # (\t0|cnt\(0)))) ) ) # ( !\t0|cnt\(1) & ( \t0|cnt\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001010111101010000101011110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(0),
	datac => \t0|ALT_INV_cnt\(2),
	datad => \t0|ALT_INV_cnt\(3),
	dataf => \t0|ALT_INV_cnt\(1),
	combout => \t0|Add0~1_combout\);

-- Location: LABCELL_X2_Y1_N27
\t0|cnt~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \t0|cnt~1_combout\ = ( !\WideOr0~0_combout\ & ( \t0|Add0~1_combout\ & ( (!\current_state.B10s~DUPLICATE_q\ & (!\Selector3~0_combout\ & (!\Selector2~0_combout\ $ (\current_state.WB20s~q\)))) # (\current_state.B10s~DUPLICATE_q\ & (\Selector3~0_combout\ & 
-- (!\Selector2~0_combout\ $ (\current_state.WB20s~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010010000000010010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.B10s~DUPLICATE_q\,
	datab => \ALT_INV_Selector3~0_combout\,
	datac => \ALT_INV_Selector2~0_combout\,
	datad => \ALT_INV_current_state.WB20s~q\,
	datae => \ALT_INV_WideOr0~0_combout\,
	dataf => \t0|ALT_INV_Add0~1_combout\,
	combout => \t0|cnt~1_combout\);

-- Location: FF_X2_Y1_N29
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

-- Location: LABCELL_X2_Y1_N3
\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ( \current_state.Initial~q\ & ( (\current_state.W10s~q\ & ((!\t0|cnt\(3)) # (!\t0|cnt\(1)))) ) ) # ( !\current_state.Initial~q\ & ( ((\current_state.W10s~q\ & ((!\t0|cnt\(3)) # (!\t0|cnt\(1))))) # (\token_1~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111011001100111111101100000000111110100000000011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \t0|ALT_INV_cnt\(3),
	datab => \ALT_INV_token_1~input_o\,
	datac => \t0|ALT_INV_cnt\(1),
	datad => \ALT_INV_current_state.W10s~q\,
	dataf => \ALT_INV_current_state.Initial~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X2_Y1_N5
\current_state.W10s\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.W10s~q\);

-- Location: LABCELL_X2_Y1_N6
\water~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \water~0_combout\ = ( \current_state.WB20s~q\ ) # ( !\current_state.WB20s~q\ & ( \current_state.W10s~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_current_state.W10s~q\,
	dataf => \ALT_INV_current_state.WB20s~q\,
	combout => \water~0_combout\);

-- Location: LABCELL_X2_Y1_N30
\brush~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \brush~0_combout\ = ( \current_state.B10s~q\ ) # ( !\current_state.B10s~q\ & ( \current_state.WB20s~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_current_state.WB20s~q\,
	dataf => \ALT_INV_current_state.B10s~q\,
	combout => \brush~0_combout\);

-- Location: LABCELL_X83_Y70_N3
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


