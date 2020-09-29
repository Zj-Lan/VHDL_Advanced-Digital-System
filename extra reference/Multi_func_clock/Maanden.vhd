----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	Maanden - Structural
-- Project Name: 	date_func
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Maanden is

    Port ( enMn : in  STD_LOGIC;
           klok25MHz : in  STD_LOGIC;
           Up_Down : in  STD_LOGIC;
           eM : out  STD_LOGIC_VECTOR (3 downto 0);
           tM : out  STD_LOGIC_VECTOR (3 downto 0);
           oJ : out  STD_LOGIC;
			  GMaand : out  STD_LOGIC;
			  FEB : out  STD_LOGIC);
end Maanden;

architecture Behavioral of Maanden is

	COMPONENT X12Counter
	PORT(
		clk : IN std_logic;
		en : IN std_logic;
		down : IN std_logic;          
		e_out : OUT std_logic_vector(3 downto 0);
		t_out : OUT std_logic_vector(3 downto 0);
		max : OUT std_logic;
		GM : OUT std_logic;
		FEBR : OUT std_logic
		);
	END COMPONENT;
	
begin

	Inst_X12Counter: X12Counter PORT MAP(
		clk => klok25MHz,
		en => enMn,
		down => Up_Down,
		e_out => eM,
		t_out => tM,
		max => oJ,
		GM => GMaand,
		FEBR => FEB
	);


end Behavioral;

