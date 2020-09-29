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
-- Generated on "02/16/2020 23:39:52"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ward_switch_7
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ward_switch_7_vhd_vec_tst IS
END ward_switch_7_vhd_vec_tst;
ARCHITECTURE ward_switch_7_arch OF ward_switch_7_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL input : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL output : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL signal_3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT ward_switch_7
	PORT (
	input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	output : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	signal_3 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ward_switch_7
	PORT MAP (
-- list connections between master ports and signals
	input => input,
	output => output,
	signal_3 => signal_3
	);
-- input[7]
t_prcs_input_7: PROCESS
BEGIN
	input(7) <= '0';
	WAIT FOR 950000 ps;
	input(7) <= '1';
WAIT;
END PROCESS t_prcs_input_7;
-- input[6]
t_prcs_input_6: PROCESS
BEGIN
	input(6) <= '0';
	WAIT FOR 500000 ps;
	input(6) <= '1';
	WAIT FOR 450000 ps;
	input(6) <= '0';
WAIT;
END PROCESS t_prcs_input_6;
-- input[5]
t_prcs_input_5: PROCESS
BEGIN
	input(5) <= '0';
	WAIT FOR 250000 ps;
	input(5) <= '1';
	WAIT FOR 250000 ps;
	input(5) <= '0';
	WAIT FOR 200000 ps;
	input(5) <= '1';
	WAIT FOR 250000 ps;
	input(5) <= '0';
WAIT;
END PROCESS t_prcs_input_5;
-- input[4]
t_prcs_input_4: PROCESS
BEGIN
	input(4) <= '0';
	WAIT FOR 150000 ps;
	input(4) <= '1';
	WAIT FOR 100000 ps;
	input(4) <= '0';
	WAIT FOR 100000 ps;
	input(4) <= '1';
	WAIT FOR 150000 ps;
	input(4) <= '0';
	WAIT FOR 100000 ps;
	input(4) <= '1';
	WAIT FOR 100000 ps;
	input(4) <= '0';
	WAIT FOR 100000 ps;
	input(4) <= '1';
	WAIT FOR 150000 ps;
	input(4) <= '0';
WAIT;
END PROCESS t_prcs_input_4;
-- input[3]
t_prcs_input_3: PROCESS
BEGIN
	input(3) <= '0';
	WAIT FOR 100000 ps;
	FOR i IN 1 TO 3
	LOOP
		input(3) <= '1';
		WAIT FOR 50000 ps;
		input(3) <= '0';
		WAIT FOR 50000 ps;
	END LOOP;
	input(3) <= '1';
	WAIT FOR 100000 ps;
	FOR i IN 1 TO 3
	LOOP
		input(3) <= '0';
		WAIT FOR 50000 ps;
		input(3) <= '1';
		WAIT FOR 50000 ps;
	END LOOP;
	input(3) <= '0';
	WAIT FOR 100000 ps;
	input(3) <= '1';
	WAIT FOR 50000 ps;
	input(3) <= '0';
WAIT;
END PROCESS t_prcs_input_3;
-- input[2]
t_prcs_input_2: PROCESS
BEGIN
	input(2) <= '0';
	WAIT FOR 50000 ps;
	FOR i IN 1 TO 2
	LOOP
		input(2) <= '1';
		WAIT FOR 200000 ps;
		input(2) <= '0';
		WAIT FOR 200000 ps;
	END LOOP;
	input(2) <= '1';
WAIT;
END PROCESS t_prcs_input_2;
-- input[1]
t_prcs_input_1: PROCESS
BEGIN
	input(1) <= '0';
	WAIT FOR 50000 ps;
	FOR i IN 1 TO 4
	LOOP
		input(1) <= '1';
		WAIT FOR 100000 ps;
		input(1) <= '0';
		WAIT FOR 100000 ps;
	END LOOP;
	input(1) <= '1';
	WAIT FOR 100000 ps;
	input(1) <= '0';
WAIT;
END PROCESS t_prcs_input_1;
-- input[0]
t_prcs_input_0: PROCESS
BEGIN
LOOP
	input(0) <= '0';
	WAIT FOR 50000 ps;
	input(0) <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_input_0;
END ward_switch_7_arch;
