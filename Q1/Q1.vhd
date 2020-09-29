library ieee;
use ieee.std_logic_1164.all;

entity Q1 is
	port (A, B, C, D	: 	in	 std_logic;
			F_Q1			:	out std_logic );
end Q1;

architecture design_Q1 of Q1 is

component mux4 is
	port (s0, s1			:	in	 std_logic;
			d0, d1, d2, d3	: 	in	 std_logic;
			F_mux4			:	out std_logic );
end component;

signal cbar_d : std_logic;

begin

cbar_d <= (not C) or D;

m1: mux4 port map (A, B, '1', '0', D, cbar_d, F_Q1);

end design_Q1;