library ieee;
use ieee.std_logic_1164.all;

entity Q3_D1_encoder is
	port (code_in	:	in std_logic_vector(3 downto 0);
			parity	:	in	std_logic;
			code_ham	:	out	std_logic_vector(6 downto 0));
end Q3_D1_encoder;

architecture design of Q3_D1_encoder is
signal P3, P2, P1 : std_logic;
signal D4, D3, D2, D1 : std_logic;

begin

D4 <= code_in(3);
D3 <= code_in(2);
D2 <= code_in(1);
D1 <= code_in(0);


P3 <= D2 xor D3 xor D4 when parity = '0' else
	not (D2 xor D3 xor D4);
	
P2 <= D1 xor D3 xor D4 when parity = '0' else
	not (D1 xor D3 xor D4);
	
P1 <= D1 xor D2 xor D4 when parity = '0' else
	not (D1 xor D2 xor D4);

code_ham(6) <= D4;
code_ham(5) <= D3;
code_ham(4) <= D2;
code_ham(3) <= P3;
code_ham(2) <= D1;
code_ham(1) <= P2;
code_ham(0) <= P1;
	
end design;

