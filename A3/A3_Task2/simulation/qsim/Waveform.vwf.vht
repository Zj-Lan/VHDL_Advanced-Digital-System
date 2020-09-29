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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "03/16/2020 02:23:17"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          regular
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY regular_vhd_vec_tst IS
END regular_vhd_vec_tst;
ARCHITECTURE regular_arch OF regular_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL brush : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL token_1 : STD_LOGIC;
SIGNAL water : STD_LOGIC;
COMPONENT regular
	PORT (
	brush : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	token_1 : IN STD_LOGIC;
	water : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : regular
	PORT MAP (
-- list connections between master ports and signals
	brush => brush,
	clk => clk,
	token_1 => token_1,
	water => water
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- token_1
t_prcs_token_1: PROCESS
BEGIN
	token_1 <= '0';
	WAIT FOR 10000 ps;
	token_1 <= '1';
	WAIT FOR 25000 ps;
	token_1 <= '0';
	WAIT FOR 445000 ps;
	token_1 <= '1';
	WAIT FOR 10000 ps;
	token_1 <= '0';
WAIT;
END PROCESS t_prcs_token_1;
END regular_arch;
