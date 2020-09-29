LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Q2_tst IS
END Q2_tst;
ARCHITECTURE Q2_arch OF Q2_tst IS
                                                  
SIGNAL clk : STD_LOGIC;
SIGNAL M : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL Mul : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL Q : STD_LOGIC_VECTOR(4 DOWNTO 0);
COMPONENT Q2
	PORT (
	clk : IN STD_LOGIC;
	M : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	Mul : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	Q : IN STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Q2
	PORT MAP (
	clk => clk,
	M => M,
	Mul => Mul,
	Q => Q
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

t_M: PROCESS
BEGIN
	M <= "11001";
WAIT;
END PROCESS t_M;

t_Q: PROCESS
BEGIN
	Q <= "10111";
WAIT;
END PROCESS t_Q;

END Q2_arch;
