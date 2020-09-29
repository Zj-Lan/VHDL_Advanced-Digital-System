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
-- Generated on "04/20/2020 01:30:16"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Q1_b
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Q1_b_vhd_vec_tst IS
END Q1_b_vhd_vec_tst;
ARCHITECTURE Q1_b_arch OF Q1_b_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL test_Q_A : STD_LOGIC;
SIGNAL test_Q_B : STD_LOGIC;
COMPONENT Q1_b
	PORT (
	clk : IN STD_LOGIC;
	test_Q_A : BUFFER STD_LOGIC;
	test_Q_B : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Q1_b
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	test_Q_A => test_Q_A,
	test_Q_B => test_Q_B
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 25000 ps;
	clk <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
END Q1_b_arch;
