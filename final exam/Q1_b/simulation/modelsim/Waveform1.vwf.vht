LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Q1_b_tst IS
END Q1_b_tst;
ARCHITECTURE Q1_b_arch OF Q1_b_tst IS
                                                 
SIGNAL clk : STD_LOGIC;
COMPONENT Q1_b
	PORT (
	clk : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Q1_b
	PORT MAP (
	clk => clk
	);

t_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 25000 ps;
	clk <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_clk;
END Q1_b_arch;
