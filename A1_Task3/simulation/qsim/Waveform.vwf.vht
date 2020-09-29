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
-- Generated on "02/09/2020 16:46:06"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          mux16
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY mux16_vhd_vec_tst IS
END mux16_vhd_vec_tst;
ARCHITECTURE mux16_arch OF mux16_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL d0 : STD_LOGIC;
SIGNAL d1 : STD_LOGIC;
SIGNAL d2 : STD_LOGIC;
SIGNAL d3 : STD_LOGIC;
SIGNAL d4 : STD_LOGIC;
SIGNAL d5 : STD_LOGIC;
SIGNAL d6 : STD_LOGIC;
SIGNAL d7 : STD_LOGIC;
SIGNAL d8 : STD_LOGIC;
SIGNAL d9 : STD_LOGIC;
SIGNAL d10 : STD_LOGIC;
SIGNAL d11 : STD_LOGIC;
SIGNAL d12 : STD_LOGIC;
SIGNAL d13 : STD_LOGIC;
SIGNAL d14 : STD_LOGIC;
SIGNAL d15 : STD_LOGIC;
SIGNAL F_mux16 : STD_LOGIC;
SIGNAL s0 : STD_LOGIC;
SIGNAL s1 : STD_LOGIC;
SIGNAL s2 : STD_LOGIC;
SIGNAL s3 : STD_LOGIC;
COMPONENT mux16
	PORT (
	d0 : IN STD_LOGIC;
	d1 : IN STD_LOGIC;
	d2 : IN STD_LOGIC;
	d3 : IN STD_LOGIC;
	d4 : IN STD_LOGIC;
	d5 : IN STD_LOGIC;
	d6 : IN STD_LOGIC;
	d7 : IN STD_LOGIC;
	d8 : IN STD_LOGIC;
	d9 : IN STD_LOGIC;
	d10 : IN STD_LOGIC;
	d11 : IN STD_LOGIC;
	d12 : IN STD_LOGIC;
	d13 : IN STD_LOGIC;
	d14 : IN STD_LOGIC;
	d15 : IN STD_LOGIC;
	F_mux16 : OUT STD_LOGIC;
	s0 : IN STD_LOGIC;
	s1 : IN STD_LOGIC;
	s2 : IN STD_LOGIC;
	s3 : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : mux16
	PORT MAP (
-- list connections between master ports and signals
	d0 => d0,
	d1 => d1,
	d2 => d2,
	d3 => d3,
	d4 => d4,
	d5 => d5,
	d6 => d6,
	d7 => d7,
	d8 => d8,
	d9 => d9,
	d10 => d10,
	d11 => d11,
	d12 => d12,
	d13 => d13,
	d14 => d14,
	d15 => d15,
	F_mux16 => F_mux16,
	s0 => s0,
	s1 => s1,
	s2 => s2,
	s3 => s3
	);

-- d0
t_prcs_d0: PROCESS
BEGIN
	d0 <= '0';
	WAIT FOR 50000 ps;
	d0 <= '1';
	WAIT FOR 100000 ps;
	d0 <= '0';
	WAIT FOR 50000 ps;
	d0 <= '1';
	WAIT FOR 100000 ps;
	d0 <= '0';
	WAIT FOR 100000 ps;
	d0 <= '1';
	WAIT FOR 50000 ps;
	d0 <= '0';
	WAIT FOR 50000 ps;
	d0 <= '1';
	WAIT FOR 50000 ps;
	d0 <= '0';
	WAIT FOR 100000 ps;
	d0 <= '1';
	WAIT FOR 100000 ps;
	d0 <= '0';
	WAIT FOR 50000 ps;
	d0 <= '1';
	WAIT FOR 150000 ps;
	d0 <= '0';
WAIT;
END PROCESS t_prcs_d0;

-- d1
t_prcs_d1: PROCESS
BEGIN
	d1 <= '1';
	WAIT FOR 50000 ps;
	d1 <= '0';
	WAIT FOR 100000 ps;
	d1 <= '1';
	WAIT FOR 50000 ps;
	d1 <= '0';
	WAIT FOR 50000 ps;
	d1 <= '1';
	WAIT FOR 50000 ps;
	d1 <= '0';
	WAIT FOR 150000 ps;
	d1 <= '1';
	WAIT FOR 50000 ps;
	d1 <= '0';
	WAIT FOR 250000 ps;
	d1 <= '1';
	WAIT FOR 100000 ps;
	d1 <= '0';
	WAIT FOR 50000 ps;
	d1 <= '1';
	WAIT FOR 50000 ps;
	d1 <= '0';
WAIT;
END PROCESS t_prcs_d1;

-- d2
t_prcs_d2: PROCESS
BEGIN
	d2 <= '0';
	WAIT FOR 50000 ps;
	d2 <= '1';
	WAIT FOR 150000 ps;
	d2 <= '0';
	WAIT FOR 100000 ps;
	d2 <= '1';
	WAIT FOR 50000 ps;
	d2 <= '0';
	WAIT FOR 50000 ps;
	d2 <= '1';
	WAIT FOR 100000 ps;
	d2 <= '0';
	WAIT FOR 150000 ps;
	d2 <= '1';
	WAIT FOR 50000 ps;
	d2 <= '0';
	WAIT FOR 50000 ps;
	d2 <= '1';
WAIT;
END PROCESS t_prcs_d2;

-- d3
t_prcs_d3: PROCESS
BEGIN
	d3 <= '0';
	WAIT FOR 400000 ps;
	d3 <= '1';
	WAIT FOR 50000 ps;
	d3 <= '0';
	WAIT FOR 50000 ps;
	d3 <= '1';
	WAIT FOR 50000 ps;
	d3 <= '0';
	WAIT FOR 50000 ps;
	d3 <= '1';
	WAIT FOR 50000 ps;
	d3 <= '0';
	WAIT FOR 100000 ps;
	d3 <= '1';
	WAIT FOR 50000 ps;
	d3 <= '0';
	WAIT FOR 100000 ps;
	d3 <= '1';
	WAIT FOR 50000 ps;
	d3 <= '0';
WAIT;
END PROCESS t_prcs_d3;

-- d4
t_prcs_d4: PROCESS
BEGIN
	d4 <= '0';
	WAIT FOR 200000 ps;
	d4 <= '1';
	WAIT FOR 150000 ps;
	d4 <= '0';
	WAIT FOR 50000 ps;
	d4 <= '1';
	WAIT FOR 100000 ps;
	d4 <= '0';
	WAIT FOR 200000 ps;
	d4 <= '1';
	WAIT FOR 50000 ps;
	d4 <= '0';
	WAIT FOR 50000 ps;
	d4 <= '1';
	WAIT FOR 50000 ps;
	d4 <= '0';
WAIT;
END PROCESS t_prcs_d4;

-- d5
t_prcs_d5: PROCESS
BEGIN
	d5 <= '0';
	WAIT FOR 50000 ps;
	d5 <= '1';
	WAIT FOR 50000 ps;
	d5 <= '0';
	WAIT FOR 50000 ps;
	d5 <= '1';
	WAIT FOR 200000 ps;
	d5 <= '0';
	WAIT FOR 200000 ps;
	d5 <= '1';
	WAIT FOR 50000 ps;
	d5 <= '0';
	WAIT FOR 50000 ps;
	d5 <= '1';
	WAIT FOR 50000 ps;
	d5 <= '0';
	WAIT FOR 50000 ps;
	d5 <= '1';
	WAIT FOR 50000 ps;
	d5 <= '0';
	WAIT FOR 100000 ps;
	d5 <= '1';
WAIT;
END PROCESS t_prcs_d5;

-- d6
t_prcs_d6: PROCESS
BEGIN
	d6 <= '0';
	WAIT FOR 50000 ps;
	d6 <= '1';
	WAIT FOR 100000 ps;
	d6 <= '0';
	WAIT FOR 50000 ps;
	d6 <= '1';
	WAIT FOR 50000 ps;
	d6 <= '0';
	WAIT FOR 50000 ps;
	d6 <= '1';
	WAIT FOR 50000 ps;
	d6 <= '0';
	WAIT FOR 50000 ps;
	d6 <= '1';
	WAIT FOR 200000 ps;
	d6 <= '0';
	WAIT FOR 50000 ps;
	d6 <= '1';
	WAIT FOR 50000 ps;
	d6 <= '0';
	WAIT FOR 50000 ps;
	d6 <= '1';
	WAIT FOR 100000 ps;
	d6 <= '0';
WAIT;
END PROCESS t_prcs_d6;

-- d7
t_prcs_d7: PROCESS
BEGIN
	d7 <= '1';
	WAIT FOR 100000 ps;
	d7 <= '0';
	WAIT FOR 100000 ps;
	d7 <= '1';
	WAIT FOR 150000 ps;
	d7 <= '0';
	WAIT FOR 50000 ps;
	d7 <= '1';
	WAIT FOR 100000 ps;
	d7 <= '0';
	WAIT FOR 100000 ps;
	d7 <= '1';
	WAIT FOR 100000 ps;
	d7 <= '0';
	WAIT FOR 50000 ps;
	d7 <= '1';
	WAIT FOR 50000 ps;
	d7 <= '0';
	WAIT FOR 50000 ps;
	d7 <= '1';
WAIT;
END PROCESS t_prcs_d7;

-- d8
t_prcs_d8: PROCESS
BEGIN
	d8 <= '1';
	WAIT FOR 100000 ps;
	d8 <= '0';
	WAIT FOR 200000 ps;
	d8 <= '1';
	WAIT FOR 100000 ps;
	d8 <= '0';
	WAIT FOR 50000 ps;
	d8 <= '1';
	WAIT FOR 50000 ps;
	d8 <= '0';
	WAIT FOR 100000 ps;
	d8 <= '1';
	WAIT FOR 100000 ps;
	d8 <= '0';
	WAIT FOR 50000 ps;
	d8 <= '1';
	WAIT FOR 100000 ps;
	d8 <= '0';
	WAIT FOR 50000 ps;
	d8 <= '1';
WAIT;
END PROCESS t_prcs_d8;

-- d9
t_prcs_d9: PROCESS
BEGIN
	d9 <= '1';
	WAIT FOR 100000 ps;
	d9 <= '0';
	WAIT FOR 450000 ps;
	d9 <= '1';
	WAIT FOR 100000 ps;
	d9 <= '0';
	WAIT FOR 100000 ps;
	d9 <= '1';
	WAIT FOR 50000 ps;
	d9 <= '0';
	WAIT FOR 50000 ps;
	d9 <= '1';
	WAIT FOR 100000 ps;
	d9 <= '0';
WAIT;
END PROCESS t_prcs_d9;

-- d10
t_prcs_d10: PROCESS
BEGIN
	d10 <= '1';
	WAIT FOR 50000 ps;
	d10 <= '0';
	WAIT FOR 50000 ps;
	d10 <= '1';
	WAIT FOR 100000 ps;
	d10 <= '0';
	WAIT FOR 50000 ps;
	d10 <= '1';
	WAIT FOR 50000 ps;
	d10 <= '0';
	WAIT FOR 50000 ps;
	d10 <= '1';
	WAIT FOR 150000 ps;
	d10 <= '0';
	WAIT FOR 50000 ps;
	d10 <= '1';
	WAIT FOR 150000 ps;
	d10 <= '0';
	WAIT FOR 50000 ps;
	d10 <= '1';
	WAIT FOR 100000 ps;
	d10 <= '0';
WAIT;
END PROCESS t_prcs_d10;

-- d11
t_prcs_d11: PROCESS
BEGIN
	d11 <= '0';
	WAIT FOR 100000 ps;
	d11 <= '1';
	WAIT FOR 100000 ps;
	d11 <= '0';
	WAIT FOR 50000 ps;
	d11 <= '1';
	WAIT FOR 100000 ps;
	d11 <= '0';
	WAIT FOR 50000 ps;
	d11 <= '1';
	WAIT FOR 350000 ps;
	d11 <= '0';
	WAIT FOR 150000 ps;
	d11 <= '1';
WAIT;
END PROCESS t_prcs_d11;

-- d12
t_prcs_d12: PROCESS
BEGIN
	d12 <= '0';
	WAIT FOR 150000 ps;
	d12 <= '1';
	WAIT FOR 150000 ps;
	d12 <= '0';
	WAIT FOR 50000 ps;
	d12 <= '1';
	WAIT FOR 200000 ps;
	d12 <= '0';
	WAIT FOR 150000 ps;
	d12 <= '1';
	WAIT FOR 150000 ps;
	d12 <= '0';
	WAIT FOR 50000 ps;
	d12 <= '1';
WAIT;
END PROCESS t_prcs_d12;

-- d13
t_prcs_d13: PROCESS
BEGIN
	d13 <= '1';
	WAIT FOR 100000 ps;
	d13 <= '0';
	WAIT FOR 50000 ps;
	d13 <= '1';
	WAIT FOR 50000 ps;
	d13 <= '0';
	WAIT FOR 50000 ps;
	d13 <= '1';
	WAIT FOR 50000 ps;
	d13 <= '0';
	WAIT FOR 150000 ps;
	d13 <= '1';
	WAIT FOR 50000 ps;
	d13 <= '0';
	WAIT FOR 100000 ps;
	d13 <= '1';
	WAIT FOR 50000 ps;
	d13 <= '0';
	WAIT FOR 100000 ps;
	d13 <= '1';
	WAIT FOR 50000 ps;
	d13 <= '0';
	WAIT FOR 50000 ps;
	d13 <= '1';
	WAIT FOR 50000 ps;
	d13 <= '0';
WAIT;
END PROCESS t_prcs_d13;

-- d14
t_prcs_d14: PROCESS
BEGIN
	d14 <= '0';
	WAIT FOR 100000 ps;
	d14 <= '1';
	WAIT FOR 150000 ps;
	d14 <= '0';
	WAIT FOR 100000 ps;
	d14 <= '1';
	WAIT FOR 150000 ps;
	d14 <= '0';
	WAIT FOR 150000 ps;
	d14 <= '1';
	WAIT FOR 50000 ps;
	d14 <= '0';
	WAIT FOR 50000 ps;
	d14 <= '1';
	WAIT FOR 100000 ps;
	d14 <= '0';
WAIT;
END PROCESS t_prcs_d14;

-- d15
t_prcs_d15: PROCESS
BEGIN
	d15 <= '1';
	WAIT FOR 200000 ps;
	d15 <= '0';
	WAIT FOR 100000 ps;
	d15 <= '1';
	WAIT FOR 350000 ps;
	d15 <= '0';
	WAIT FOR 50000 ps;
	d15 <= '1';
	WAIT FOR 100000 ps;
	d15 <= '0';
	WAIT FOR 50000 ps;
	d15 <= '1';
	WAIT FOR 50000 ps;
	d15 <= '0';
WAIT;
END PROCESS t_prcs_d15;

-- s0
t_prcs_s0: PROCESS
BEGIN
	s0 <= '1';
	WAIT FOR 20000 ps;
	s0 <= '0';
	WAIT FOR 20000 ps;
	s0 <= '1';
	WAIT FOR 20000 ps;
	s0 <= '0';
	WAIT FOR 20000 ps;
	s0 <= '1';
	WAIT FOR 80000 ps;
	s0 <= '0';
	WAIT FOR 60000 ps;
	s0 <= '1';
	WAIT FOR 20000 ps;
	s0 <= '0';
	WAIT FOR 60000 ps;
	s0 <= '1';
	WAIT FOR 100000 ps;
	s0 <= '0';
	WAIT FOR 40000 ps;
	s0 <= '1';
	WAIT FOR 40000 ps;
	s0 <= '0';
	WAIT FOR 80000 ps;
	s0 <= '1';
	WAIT FOR 40000 ps;
	s0 <= '0';
	WAIT FOR 120000 ps;
	s0 <= '1';
	WAIT FOR 40000 ps;
	s0 <= '0';
	WAIT FOR 20000 ps;
	s0 <= '1';
	WAIT FOR 20000 ps;
	s0 <= '0';
	WAIT FOR 60000 ps;
	s0 <= '1';
	WAIT FOR 40000 ps;
	s0 <= '0';
	WAIT FOR 40000 ps;
	s0 <= '1';
	WAIT FOR 40000 ps;
	s0 <= '0';
WAIT;
END PROCESS t_prcs_s0;

-- s1
t_prcs_s1: PROCESS
BEGIN
	s1 <= '0';
	WAIT FOR 20000 ps;
	s1 <= '1';
	WAIT FOR 20000 ps;
	s1 <= '0';
	WAIT FOR 20000 ps;
	s1 <= '1';
	WAIT FOR 40000 ps;
	s1 <= '0';
	WAIT FOR 20000 ps;
	s1 <= '1';
	WAIT FOR 20000 ps;
	s1 <= '0';
	WAIT FOR 60000 ps;
	s1 <= '1';
	WAIT FOR 60000 ps;
	s1 <= '0';
	WAIT FOR 40000 ps;
	s1 <= '1';
	WAIT FOR 20000 ps;
	s1 <= '0';
	WAIT FOR 20000 ps;
	s1 <= '1';
	WAIT FOR 20000 ps;
	s1 <= '0';
	WAIT FOR 60000 ps;
	s1 <= '1';
	WAIT FOR 20000 ps;
	s1 <= '0';
	WAIT FOR 20000 ps;
	s1 <= '1';
	WAIT FOR 20000 ps;
	s1 <= '0';
	WAIT FOR 20000 ps;
	s1 <= '1';
	WAIT FOR 40000 ps;
	s1 <= '0';
	WAIT FOR 20000 ps;
	s1 <= '1';
	WAIT FOR 20000 ps;
	s1 <= '0';
	WAIT FOR 20000 ps;
	s1 <= '1';
	WAIT FOR 20000 ps;
	s1 <= '0';
	WAIT FOR 40000 ps;
	s1 <= '1';
	WAIT FOR 20000 ps;
	s1 <= '0';
	WAIT FOR 40000 ps;
	s1 <= '1';
	WAIT FOR 20000 ps;
	s1 <= '0';
	WAIT FOR 60000 ps;
	s1 <= '1';
	WAIT FOR 20000 ps;
	s1 <= '0';
	WAIT FOR 40000 ps;
	s1 <= '1';
	WAIT FOR 20000 ps;
	s1 <= '0';
	WAIT FOR 100000 ps;
	s1 <= '1';
WAIT;
END PROCESS t_prcs_s1;

-- s2
t_prcs_s2: PROCESS
BEGIN
	s2 <= '1';
	WAIT FOR 20000 ps;
	s2 <= '0';
	WAIT FOR 20000 ps;
	s2 <= '1';
	WAIT FOR 40000 ps;
	s2 <= '0';
	WAIT FOR 100000 ps;
	s2 <= '1';
	WAIT FOR 20000 ps;
	s2 <= '0';
	WAIT FOR 40000 ps;
	s2 <= '1';
	WAIT FOR 40000 ps;
	s2 <= '0';
	WAIT FOR 60000 ps;
	s2 <= '1';
	WAIT FOR 20000 ps;
	s2 <= '0';
	WAIT FOR 20000 ps;
	s2 <= '1';
	WAIT FOR 20000 ps;
	s2 <= '0';
	WAIT FOR 40000 ps;
	s2 <= '1';
	WAIT FOR 20000 ps;
	s2 <= '0';
	WAIT FOR 20000 ps;
	s2 <= '1';
	WAIT FOR 20000 ps;
	s2 <= '0';
	WAIT FOR 20000 ps;
	s2 <= '1';
	WAIT FOR 40000 ps;
	s2 <= '0';
	WAIT FOR 20000 ps;
	s2 <= '1';
	WAIT FOR 20000 ps;
	s2 <= '0';
	WAIT FOR 20000 ps;
	s2 <= '1';
	WAIT FOR 20000 ps;
	s2 <= '0';
	WAIT FOR 20000 ps;
	s2 <= '1';
	WAIT FOR 60000 ps;
	s2 <= '0';
	WAIT FOR 20000 ps;
	s2 <= '1';
	WAIT FOR 40000 ps;
	s2 <= '0';
	WAIT FOR 20000 ps;
	s2 <= '1';
	WAIT FOR 40000 ps;
	s2 <= '0';
	WAIT FOR 40000 ps;
	s2 <= '1';
	WAIT FOR 60000 ps;
	s2 <= '0';
	WAIT FOR 40000 ps;
	s2 <= '1';
WAIT;
END PROCESS t_prcs_s2;

-- s3
t_prcs_s3: PROCESS
BEGIN
	s3 <= '0';
	WAIT FOR 40000 ps;
	s3 <= '1';
	WAIT FOR 40000 ps;
	s3 <= '0';
	WAIT FOR 20000 ps;
	s3 <= '1';
	WAIT FOR 100000 ps;
	s3 <= '0';
	WAIT FOR 40000 ps;
	s3 <= '1';
	WAIT FOR 20000 ps;
	s3 <= '0';
	WAIT FOR 40000 ps;
	s3 <= '1';
	WAIT FOR 20000 ps;
	s3 <= '0';
	WAIT FOR 40000 ps;
	s3 <= '1';
	WAIT FOR 20000 ps;
	s3 <= '0';
	WAIT FOR 20000 ps;
	s3 <= '1';
	WAIT FOR 20000 ps;
	s3 <= '0';
	WAIT FOR 60000 ps;
	s3 <= '1';
	WAIT FOR 20000 ps;
	s3 <= '0';
	WAIT FOR 160000 ps;
	s3 <= '1';
	WAIT FOR 20000 ps;
	s3 <= '0';
	WAIT FOR 60000 ps;
	s3 <= '1';
	WAIT FOR 40000 ps;
	s3 <= '0';
	WAIT FOR 20000 ps;
	s3 <= '1';
	WAIT FOR 140000 ps;
	s3 <= '0';
	WAIT FOR 20000 ps;
	s3 <= '1';
	WAIT FOR 20000 ps;
	s3 <= '0';
WAIT;
END PROCESS t_prcs_s3;
END mux16_arch;
