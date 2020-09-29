library ieee;
use ieee.std_logic_1164.all;

entity Q1_b is
	port(clk: in std_logic);
end Q1_b;

architecture design_Q1_b of Q1_b is

component or_2 is
	port ( o1, o2		: in	std_logic;
		F_or_2		: out	std_logic );
end component;

component T_FF is
	port ( clk, T		: in	std_logic;
		Q, Q_bar	: out	std_logic );
end component;

signal T_A, T_B, Q_A, Q_B, Q_A_bar, Q_B_bar : std_logic;

begin

T1: T_FF port map (clk, T_A, Q_A, Q_A_bar);
T2: T_FF port map (clk, T_B, Q_B, Q_B_bar);

or_A: or_2 port map (Q_A, Q_B, T_A);
or_B: or_2 port map (Q_A_bar, Q_B, T_B);
	
end design_Q1_b;