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
-- Generated on "04/20/2020 23:09:56"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Q3_D1_encoder
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Q3_D1_encoder_vhd_vec_tst IS
END Q3_D1_encoder_vhd_vec_tst;
ARCHITECTURE Q3_D1_encoder_arch OF Q3_D1_encoder_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL code_ham : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL code_in : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL parity : STD_LOGIC;
COMPONENT Q3_D1_encoder
	PORT (
	code_ham : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	code_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	parity : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Q3_D1_encoder
	PORT MAP (
-- list connections between master ports and signals
	code_ham => code_ham,
	code_in => code_in,
	parity => parity
	);
-- code_in[3]
t_prcs_code_in_3: PROCESS
BEGIN
	code_in(3) <= '1';
	WAIT FOR 300000 ps;
	code_in(3) <= '0';
WAIT;
END PROCESS t_prcs_code_in_3;
-- code_in[2]
t_prcs_code_in_2: PROCESS
BEGIN
	code_in(2) <= '0';
	WAIT FOR 600000 ps;
	code_in(2) <= '1';
WAIT;
END PROCESS t_prcs_code_in_2;
-- code_in[1]
t_prcs_code_in_1: PROCESS
BEGIN
	code_in(1) <= '0';
WAIT;
END PROCESS t_prcs_code_in_1;
-- code_in[0]
t_prcs_code_in_0: PROCESS
BEGIN
	code_in(0) <= '1';
	WAIT FOR 300000 ps;
	code_in(0) <= '0';
WAIT;
END PROCESS t_prcs_code_in_0;

-- parity
t_prcs_parity: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		parity <= '0';
		WAIT FOR 150000 ps;
		parity <= '1';
		WAIT FOR 150000 ps;
	END LOOP;
	parity <= '0';
WAIT;
END PROCESS t_prcs_parity;
END Q3_D1_encoder_arch;
