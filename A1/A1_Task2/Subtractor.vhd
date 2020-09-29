library ieee;
use ieee.std_logic_1164.all;

entity adder is
	port (X, Y, Cin	:	in		std_logic;
			Cout, Sum	:	out	std_logic);
end adder;

architecture eq of adder is
begin 
	Sum	<= X xor Y xor Cin;
	Cout	<=	(X and Y) or (X and Cin) or (Y and Cin);
end eq;


library ieee;
use ieee.std_logic_1164.all;

entity Subtractor_1 is
	port (X, Y, Cin	:	in		std_logic;
			Cout, Sum	:	out	std_logic);
end Subtractor_1;

architecture sub of Subtractor_1 is
	component adder
		port (X, Y, Cin	:	in		std_logic;
				Cout, Sum	:	out	std_logic);
	end component;
begin 
	sub1 : adder port map (X, not Y, '1', Cout, Sum);
end sub;

library ieee;
use ieee.std_logic_1164.all;

entity Subtractor is
	port (X, Y	:	in 	std_logic_vector (3 downto 0); 
			Cin	:	in		std_logic;
			Cout	:	out	std_logic;
			Sum	:	out	std_logic_vector (3 downto 0));
end Subtractor;

architecture sub4 of Subtractor is
	component adder
		port (X, Y, Cin	:	in		std_logic;
				Cout, Sum	:	out	std_logic);
	end component;
	
	signal c	:	std_logic_vector	(3 downto 1);
begin 
	sub1 : adder port map (X(0), not Y(0), '1', 	c(1), Sum(0));
	sub2 : adder port map (X(1), not Y(1), c(1), c(2), Sum(1));
	sub3 : adder port map (X(2), not Y(2), c(2), c(3), Sum(2));
	sub4 : adder port map (X(3), not Y(3), c(3), Cout, Sum(3));
end sub4;