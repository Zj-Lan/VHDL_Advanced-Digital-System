library ieee;
use ieee.std_logic_1164.all;

entity Q3_D1_decoder is
	port (code_ham	:	in std_logic_vector(6 downto 0);
			parity	:	in	std_logic;
			code_ori	:	out	std_logic_vector(3 downto 0);
			syndrome	: out	std_logic_vector(2 downto 0));
end Q3_D1_decoder;

architecture design of Q3_D1_decoder is
signal P3, P2, P1 : std_logic;
signal D4, D3, D2, D1 : std_logic;
signal S3, S2, S1 : std_logic;

begin 

D4 <= code_ham(6);
D3 <= code_ham(5);
D2 <= code_ham(4);
P3 <= code_ham(3);
D1 <= code_ham(2);
P2 <= code_ham(1);
P1 <= code_ham(0);

S3 <= P3 xor D2 xor D3 xor D4 when parity = '0' else
	not (P3 xor D2 xor D3 xor D4);
	
S2 <= P2 xor D1 xor D3 xor D4 when parity = '0' else
	not (P2 xor D1 xor D3 xor D4);
	
S1 <= P1 xor D1 xor D2 xor D4 when parity = '0' else
	not (P1 xor D1 xor D2 xor D4);
	
code_ori <= D4 & D3 & D2 & D1;
syndrome <= S3 & S2 & S1;

end design;