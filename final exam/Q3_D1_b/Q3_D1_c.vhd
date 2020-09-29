library ieee;
use ieee.std_logic_1164.all;

entity Q3_D1_encoder is
	port (code_in	:	in std_logic_vector(3 downto 0);
			parity	:	in	std_logic;
			code_ham	:	out	std_logic(6 downto 0));
end Q3_D1_encoder;

architecture design of Q3_D1_encoder is
signal p3, p2, p1 : std_logic;

begin
