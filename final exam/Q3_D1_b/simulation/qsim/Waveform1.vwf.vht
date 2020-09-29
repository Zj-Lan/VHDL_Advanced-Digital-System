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
-- Generated on "04/21/2020 00:00:24"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Q3_D1_decoder
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Q3_D1_decoder_vhd_vec_tst IS
END Q3_D1_decoder_vhd_vec_tst;
ARCHITECTURE Q3_D1_decoder_arch OF Q3_D1_decoder_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL code_ham : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL code_ori : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL parity : STD_LOGIC;
SIGNAL syndrome : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT Q3_D1_decoder
	PORT (
	code_ham : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	code_ori : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	parity : IN STD_LOGIC;
	syndrome : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Q3_D1_decoder
	PORT MAP (
-- list connections between master ports and signals
	code_ham => code_ham,
	code_ori => code_ori,
	parity => parity,
	syndrome => syndrome
	);
-- code_ham[6]
t_prcs_code_ham_6: PROCESS
BEGIN
	code_ham(6) <= '1';
	WAIT FOR 250000 ps;
	code_ham(6) <= '0';
	WAIT FOR 250000 ps;
	code_ham(6) <= '1';
WAIT;
END PROCESS t_prcs_code_ham_6;
-- code_ham[5]
t_prcs_code_ham_5: PROCESS
BEGIN
	code_ham(5) <= '0';
	WAIT FOR 500000 ps;
	code_ham(5) <= '1';
	WAIT FOR 250000 ps;
	code_ham(5) <= '0';
WAIT;
END PROCESS t_prcs_code_ham_5;
-- code_ham[4]
t_prcs_code_ham_4: PROCESS
BEGIN
	code_ham(4) <= '0';
	WAIT FOR 750000 ps;
	code_ham(4) <= '1';
WAIT;
END PROCESS t_prcs_code_ham_4;
-- code_ham[3]
t_prcs_code_ham_3: PROCESS
BEGIN
	code_ham(3) <= '0';
	WAIT FOR 750000 ps;
	code_ham(3) <= '1';
WAIT;
END PROCESS t_prcs_code_ham_3;
-- code_ham[2]
t_prcs_code_ham_2: PROCESS
BEGIN
	code_ham(2) <= '1';
	WAIT FOR 250000 ps;
	code_ham(2) <= '0';
WAIT;
END PROCESS t_prcs_code_ham_2;
-- code_ham[1]
t_prcs_code_ham_1: PROCESS
BEGIN
	code_ham(1) <= '1';
	WAIT FOR 250000 ps;
	code_ham(1) <= '0';
WAIT;
END PROCESS t_prcs_code_ham_1;
-- code_ham[0]
t_prcs_code_ham_0: PROCESS
BEGIN
	code_ham(0) <= '1';
	WAIT FOR 250000 ps;
	code_ham(0) <= '0';
	WAIT FOR 250000 ps;
	code_ham(0) <= '1';
	WAIT FOR 250000 ps;
	code_ham(0) <= '0';
WAIT;
END PROCESS t_prcs_code_ham_0;

-- parity
t_prcs_parity: PROCESS
BEGIN
LOOP
	parity <= '0';
	WAIT FOR 125000 ps;
	parity <= '1';
	WAIT FOR 125000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_parity;
END Q3_D1_decoder_arch;
