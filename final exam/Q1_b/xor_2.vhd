library ieee;
use ieee.std_logic_1164.all;

entity xor_2 is
	port ( xo1, xo2		: in	std_logic;
			 F_xor_2		: out	std_logic );
end xor_2;

architecture design_xor_2 of xor_2 is
begin
	F_xor_2 <= xo1 or xo2;
end design_xor_2;