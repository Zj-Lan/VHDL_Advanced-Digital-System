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
-- Generated on "03/16/2020 03:31:56"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Deluxe_Regular
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Deluxe_Regular_vhd_vec_tst IS
END Deluxe_Regular_vhd_vec_tst;
ARCHITECTURE Deluxe_Regular_arch OF Deluxe_Regular_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL brush : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL soap : STD_LOGIC;
SIGNAL token_1 : STD_LOGIC;
SIGNAL token_2 : STD_LOGIC;
SIGNAL water : STD_LOGIC;
COMPONENT Deluxe_Regular
	PORT (
	brush : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	soap : OUT STD_LOGIC;
	token_1 : IN STD_LOGIC;
	token_2 : IN STD_LOGIC;
	water : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Deluxe_Regular
	PORT MAP (
-- list connections between master ports and signals
	brush => brush,
	clk => clk,
	soap => soap,
	token_1 => token_1,
	token_2 => token_2,
	water => water
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 142
	LOOP
		clk <= '0';
		WAIT FOR 3500 ps;
		clk <= '1';
		WAIT FOR 3500 ps;
	END LOOP;
	clk <= '0';
	WAIT FOR 3500 ps;
	clk <= '1';
WAIT;
END PROCESS t_prcs_clk;

-- token_1
t_prcs_token_1: PROCESS
BEGIN
	token_1 <= '0';
	WAIT FOR 10000 ps;
	token_1 <= '1';
	WAIT FOR 10000 ps;
	token_1 <= '0';
WAIT;
END PROCESS t_prcs_token_1;

-- token_2
t_prcs_token_2: PROCESS
BEGIN
	token_2 <= '0';
	WAIT FOR 340000 ps;
	token_2 <= '1';
	WAIT FOR 20000 ps;
	token_2 <= '0';
WAIT;
END PROCESS t_prcs_token_2;
END Deluxe_Regular_arch;
