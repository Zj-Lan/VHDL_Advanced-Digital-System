library ieee;
use ieee.std_logic_1164.all;

entity or_2 is
	port ( o1, o2		: in	std_logic;
			 F_or_2		: out	std_logic );
end or_2;

architecture design_or_2 of or_2 is
begin
	F_or_2 <= o1 or o2;
end design_or_2;