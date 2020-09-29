library ieee;
use ieee.std_logic_1164.all;

entity and_2 is
	port ( a1, a2	: in	std_logic;
			 F_and_2	: out	std_logic );
end and_2;

architecture design_and_2 of and_2 is
begin
	F_and_2 <= a1 and a2;
end design_and_2;

library ieee;
use ieee.std_logic_1164.all;

entity or_3 is
	port ( o1, o2, o3	: in	std_logic;
			 F_or_3		: out	std_logic );
end or_3;

architecture design_or_3 of or_3 is
begin
	F_or_3 <= o1 or o2 or o3;
end design_or_3;

library ieee;
use ieee.std_logic_1164.all;

entity A1_Task1 is
	port( A, B,	C	: in	std_logic;
		   F			: out	std_logic );
end A1_Task1;


architecture design of A1_Task1 is

component and_2
	port ( a1, a2	: in	std_logic;
			 F_and_2	: out	std_logic );
end component;

component or_3
	port ( o1, o2, o3	: in	std_logic;
			 F_or_3		: out	std_logic );
end component;	

signal out1, out2, out3	:	std_logic;
	
begin
	A1: and_2 port map (A, C, out1);
	A2: and_2 port map (A, B, out2);
	A3: and_2 port map (B, C, out3);
	O1: or_3	 port map (out1, out2, out3, F);
end design;

