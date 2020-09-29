----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	Dagen - Structural
-- Project Name: 	date_func
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Dagen is
    Port ( klokDn : in  STD_LOGIC;
           klok25MHz : in  STD_LOGIC;
           Up_Down : in  STD_LOGIC;
			  SJaar: in STD_LOGIC;
			  FEB: in STD_LOGIC;
			  GMaand: in STD_LOGIC;
			  SEL : in STD_LOGIC_VECTOR (1 downto 0);
           eD : out  STD_LOGIC_VECTOR (3 downto 0);
           tD : out  STD_LOGIC_VECTOR (3 downto 0);
           oM : out  STD_LOGIC);
end Dagen;

architecture Structure of Dagen is

	COMPONENT X28_31Counter
	PORT(
		clk : in  STD_LOGIC;
	   en : in  STD_LOGIC;
	   down : in  STD_LOGIC;
	   SJ : in STD_LOGIC;
	   FEBR : in STD_LOGIC;
	   GM : in STD_LOGIC;
		sel : in STD_LOGIC_VECTOR (1 downto 0);
	   e_out : out  STD_LOGIC_VECTOR (3 downto 0);
	   t_out : out  STD_LOGIC_VECTOR (3 downto 0);
	   max : out  STD_LOGIC
		);
	END COMPONENT;

	
begin

Inst_X28_31Counter: X28_31Counter PORT MAP(
		clk => klok25MHz,
		en => klokDn,
		down => Up_Down,
		SJ => SJaar,
		FEBR => FEB,
		GM => GMaand,
		sel => SEL,
		e_out => eD,
		t_out => tD,
		max => oM
	);
	
end Structure;
