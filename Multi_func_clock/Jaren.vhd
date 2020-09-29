----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	Jaren - Structural
-- Project Name: 	date_func
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Jaren is
    Port ( enJn : in  STD_LOGIC;
           klok25MHz : in  STD_LOGIC;
           Up_Down : in  STD_LOGIC;
           eJ : out  STD_LOGIC_VECTOR (3 downto 0);
           tJ : out  STD_LOGIC_VECTOR (3 downto 0);
			  SJ : out STD_LOGIC);
end Jaren;

architecture Structure of Jaren is

	COMPONENT X99Counter
	PORT(
		clk : IN std_logic;
		en : IN std_logic;
		down : IN std_logic;          
		e_out : OUT std_logic_vector(3 downto 0);
		t_out : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT X4Counter
	PORT(
		clk : IN std_logic;
		en : IN std_logic;
		down : IN std_logic;          
		SJaar : OUT std_logic
		);
	END COMPONENT;

begin

	Inst_X99Counter: X99Counter PORT MAP(
		clk => klok25Mhz,
		en => enJn,
		down => Up_Down,
		e_out => eJ,
		t_out => tJ
	);
	
	Inst_X4Counter: X4Counter PORT MAP(
		clk => klok25Mhz,
		en => enJn,
		down => Up_Down,
		SJaar => SJ
	);
end Structure;