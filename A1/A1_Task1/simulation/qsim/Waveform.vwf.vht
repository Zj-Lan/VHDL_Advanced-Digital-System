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
-- Generated on "02/08/2020 20:33:32"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          A1_Task1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY A1_Task1_vhd_vec_tst IS
END A1_Task1_vhd_vec_tst;
ARCHITECTURE A1_Task1_arch OF A1_Task1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC;
SIGNAL B : STD_LOGIC;
SIGNAL C : STD_LOGIC;
SIGNAL F : STD_LOGIC;
COMPONENT A1_Task1
	PORT (
	A : IN STD_LOGIC;
	B : IN STD_LOGIC;
	C : IN STD_LOGIC;
	F : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : A1_Task1
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	C => C,
	F => F
	);

-- A
t_prcs_A: PROCESS
BEGIN
LOOP
	A <= '0';
	WAIT FOR 50000 ps;
	A <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_A;

-- B
t_prcs_B: PROCESS
BEGIN
LOOP
	B <= '0';
	WAIT FOR 100000 ps;
	B <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_B;

-- C
t_prcs_C: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		C <= '0';
		WAIT FOR 75000 ps;
		C <= '1';
		WAIT FOR 75000 ps;
	END LOOP;
	C <= '0';
	WAIT FOR 75000 ps;
	C <= '1';
WAIT;
END PROCESS t_prcs_C;
END A1_Task1_arch;
