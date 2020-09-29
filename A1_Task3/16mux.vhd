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

entity and_4 is
	port ( a1, a2, a3, a4	: in	std_logic;
			 F_and_4				: out	std_logic );
end and_4;

architecture design_and_4 of and_4 is
begin
	F_and_4 <= a1 and a2 and a3 and a4;
end design_and_4;

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

library ieee;
use ieee.std_logic_1164.all;

entity or_8 is
	port ( o1, o2, o3, o4, o5, o6, o7, o8	: in	std_logic;
			 F_or_8									: out	std_logic );
end or_8;

architecture design_or_8 of or_8 is
begin
	F_or_8 <= o1 or o2 or o3 or o4 or o5 or o6 or o7 or o8;
end design_or_8;

library ieee;
use ieee.std_logic_1164.all;

entity inv is
	port (i1		:	in		std_logic;
			F_inv	:	out	std_logic );
end inv;

architecture design_inv of inv is
begin
	F_inv <= not i1;
end design_inv;

library ieee;
use ieee.std_logic_1164.all;

entity mux8 is
	port (s0, s1, s2								:	in	 std_logic;
			d0, d1, d2, d3, d4, d5, d6, d7	: 	in	 std_logic;
			F_mux8									:	out std_logic );
end mux8;

architecture design_mux8 of mux8 is

component and_4 is
	port ( a1, a2, a3, a4	: in	std_logic;
			 F_and_4				: out	std_logic );
end component;

component or_8 is
	port ( o1, o2, o3, o4, o5, o6, o7, o8	: in	std_logic;
			 F_or_8									: out	std_logic );
end component;

component inv is
	port (i1		:	in		std_logic;
			F_inv	:	out	std_logic );
end component;

signal s0_bar, s1_bar, s2_bar, out1, out2, out3, out4, out5, out6, out7, out8	: std_logic; 

begin
inv0: inv port map (s0, s0_bar);
inv1: inv port map (s1, s1_bar);
inv2: inv port map (s2, s2_bar);

A1:	and_4 port map (d0, s0_bar, s1_bar, s2_bar, out1);
A2:	and_4 port map (d1, s0_bar, s1_bar, s2, out2);
A3:	and_4 port map (d2, s0_bar, s1, s2_bar, out3);
A4:	and_4 port map (d3, s0_bar, s1, s2, out4);
A5:	and_4 port map (d4, s0, s1_bar, s2_bar, out5);
A6:	and_4 port map (d5, s0, s1_bar, s2, out6);
A7:	and_4 port map (d6, s0, s1, s2_bar, out7);
A8:	and_4 port map (d7, s0, s1, s2, out8);

O1:	or_8 port map (out1, out2, out3, out4, out5, out6, out7, out8, F_mux8);

end design_mux8;

library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
	port(sel		:	in 	std_logic;
			a, b	:	in		std_logic;
			F_mux2:	out	std_logic );
end mux2;

architecture design_mux2 of mux2 is 

component and_2 is
	port ( a1, a2	: in	std_logic;
			 F_and_2	: out	std_logic );
end component;

component or_2 is
	port ( o1, o2		: in	std_logic;
			 F_or_2		: out	std_logic );
end component;

component inv is
	port (i1		:	in		std_logic;
			F_inv	:	out	std_logic );
end component;

signal sel_bar, out1, out2	: std_logic;

begin

inv0:	inv port map (sel, sel_bar);

A1:	and_2 port map (a, sel_bar, out1);
A2:	and_2 port map (b, sel, out2);

O1:	or_2 port map (out1, out2, F_mux2);

end design_mux2;

library ieee;
use ieee.std_logic_1164.all;

entity mux16 is
	port (s0, s1, s2, s3									:	in	 std_logic;
			d0, d1, d2, d3, d4, d5, d6, d7			: 	in	 std_logic;
			d8, d9, d10, d11, d12, d13, d14, d15	: 	in	 std_logic;
			F_mux16											:	out std_logic );
end mux16;

architecture design_mux16 of mux16 is

component mux8 is
	port (s0, s1, s2								:	in	 std_logic;
			d0, d1, d2, d3, d4, d5, d6, d7	: 	in	 std_logic;
			F_mux8									:	out std_logic );
end component;

component mux2 is
	port(sel		:	in 	std_logic;
			a, b	:	in		std_logic;
			F_mux2:	out	std_logic );
end component;

signal F1, F2	:	std_logic;

begin
mux8_1	:	mux8 port map (s1, s2, s3, d0, d1, d2, d3, d4, d5, d6, d7, F1);
mux8_2	:	mux8 port map (s1, s2, s3, d8, d9, d10, d11, d12, d13, d14, d15, F2);

mux2_1	:	mux2 port map (s0, F1, F2, F_mux16); 

end design_mux16;


			
			