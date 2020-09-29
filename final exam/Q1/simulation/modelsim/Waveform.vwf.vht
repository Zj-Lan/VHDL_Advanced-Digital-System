
LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Q1_tst IS
END Q1_tst;
ARCHITECTURE Q1_arch OF Q1_tst IS
                                                
SIGNAL A : STD_LOGIC;
SIGNAL B : STD_LOGIC;
SIGNAL C : STD_LOGIC;
SIGNAL D : STD_LOGIC;
SIGNAL F_Q1 : STD_LOGIC;
COMPONENT Q1
	PORT (
	A : IN STD_LOGIC;
	B : IN STD_LOGIC;
	C : IN STD_LOGIC;
	D : IN STD_LOGIC;
	F_Q1 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Q1
	PORT MAP (
	
	A => A,
	B => B,
	C => C,
	D => D,
	F_Q1 => F_Q1
	);


t_A: PROCESS
BEGIN
	A <= '0';
	WAIT FOR 440000 ps;
	A <= '1';
WAIT;
END PROCESS t_A;


t_B: PROCESS
BEGIN
	B <= '0';
	WAIT FOR 210000 ps;
	B <= '1';
	WAIT FOR 230000 ps;
	B <= '0';
	WAIT FOR 290000 ps;
	B <= '1';
WAIT;
END PROCESS t_B;


t_C: PROCESS
BEGIN
LOOP
	C <= '0';
	WAIT FOR 25000 ps;
	C <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_C;


t_D: PROCESS
BEGIN
LOOP
	D <= '0';
	WAIT FOR 50000 ps;
	D <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_D;
END Q1_arch;
