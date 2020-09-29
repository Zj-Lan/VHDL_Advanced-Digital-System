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
-- Generated on "04/12/2020 00:20:25"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          clockwork
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY clockwork_vhd_vec_tst IS
END clockwork_vhd_vec_tst;
ARCHITECTURE clockwork_arch OF clockwork_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ampm : STD_LOGIC;
SIGNAL clk1 : STD_LOGIC;
SIGNAL display1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL display2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL display3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL display4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL display5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL display6 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL h1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL h2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL increase : STD_LOGIC;
SIGNAL m1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL m2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL mode : STD_LOGIC;
SIGNAL ring : STD_LOGIC;
SIGNAL s1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL s2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL switch : STD_LOGIC;
COMPONENT clockwork
	PORT (
	ampm : OUT STD_LOGIC;
	clk1 : IN STD_LOGIC;
	display1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	display2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	display3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	display4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	display5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	display6 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	h1 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	h2 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	increase : IN STD_LOGIC;
	m1 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	m2 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	mode : IN STD_LOGIC;
	ring : OUT STD_LOGIC;
	s1 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	s2 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	switch : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : clockwork
	PORT MAP (
-- list connections between master ports and signals
	ampm => ampm,
	clk1 => clk1,
	display1 => display1,
	display2 => display2,
	display3 => display3,
	display4 => display4,
	display5 => display5,
	display6 => display6,
	h1 => h1,
	h2 => h2,
	increase => increase,
	m1 => m1,
	m2 => m2,
	mode => mode,
	ring => ring,
	s1 => s1,
	s2 => s2,
	switch => switch
	);

-- clk1
t_prcs_clk1: PROCESS
BEGIN
LOOP
	clk1 <= '0';
	WAIT FOR 10000 ps;
	clk1 <= '1';
	WAIT FOR 10000 ps;
END LOOP;
END PROCESS t_prcs_clk1;

-- mode
t_prcs_mode: PROCESS
BEGIN
	mode <= '1';
WAIT;
END PROCESS t_prcs_mode;

-- increase
t_prcs_increase: PROCESS
BEGIN
	increase <= '1';
WAIT;
END PROCESS t_prcs_increase;

-- switch
t_prcs_switch: PROCESS
BEGIN
	switch <= '1';
WAIT;
END PROCESS t_prcs_switch;
END clockwork_arch;
