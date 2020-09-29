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
-- Generated on "04/21/2020 01:39:41"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Robot
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Robot_vhd_vec_tst IS
END Robot_vhd_vec_tst;
ARCHITECTURE Robot_arch OF Robot_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL S1S2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Z1Z2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT Robot
	PORT (
	clk : IN STD_LOGIC;
	S1S2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Z1Z2 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Robot
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	S1S2 => S1S2,
	Z1Z2 => Z1Z2
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
-- S1S2[1]
t_prcs_S1S2_1: PROCESS
BEGIN
	S1S2(1) <= '0';
	WAIT FOR 250000 ps;
	S1S2(1) <= '1';
	WAIT FOR 50000 ps;
	S1S2(1) <= '0';
	WAIT FOR 50000 ps;
	S1S2(1) <= '1';
	WAIT FOR 200000 ps;
	S1S2(1) <= '0';
	WAIT FOR 50000 ps;
	S1S2(1) <= '1';
	WAIT FOR 50000 ps;
	S1S2(1) <= '0';
	WAIT FOR 50000 ps;
	S1S2(1) <= '1';
	WAIT FOR 50000 ps;
	S1S2(1) <= '0';
	WAIT FOR 50000 ps;
	S1S2(1) <= '1';
	WAIT FOR 100000 ps;
	S1S2(1) <= '0';
	WAIT FOR 50000 ps;
	S1S2(1) <= '1';
WAIT;
END PROCESS t_prcs_S1S2_1;
-- S1S2[0]
t_prcs_S1S2_0: PROCESS
BEGIN
	S1S2(0) <= '1';
	WAIT FOR 50000 ps;
	S1S2(0) <= '0';
	WAIT FOR 150000 ps;
	S1S2(0) <= '1';
	WAIT FOR 50000 ps;
	S1S2(0) <= '0';
	WAIT FOR 150000 ps;
	S1S2(0) <= '1';
	WAIT FOR 100000 ps;
	S1S2(0) <= '0';
	WAIT FOR 50000 ps;
	S1S2(0) <= '1';
	WAIT FOR 50000 ps;
	S1S2(0) <= '0';
	WAIT FOR 150000 ps;
	S1S2(0) <= '1';
	WAIT FOR 150000 ps;
	S1S2(0) <= '0';
WAIT;
END PROCESS t_prcs_S1S2_0;
END Robot_arch;
