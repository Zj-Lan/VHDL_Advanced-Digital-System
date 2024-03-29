LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Robot_vhd_vec_tst IS
END Robot_vhd_vec_tst;
ARCHITECTURE Robot_arch OF Robot_vhd_vec_tst IS
                                                  
SIGNAL clk : STD_LOGIC;
SIGNAL S1S2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Z1Z2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT Robot
	PORT (
	clk : IN STD_LOGIC;
	S1S2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Z1Z2 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Robot
	PORT MAP (
	clk => clk,
	S1S2 => S1S2,
	Z1Z2 => Z1Z2
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

t_S1S2: PROCESS
BEGIN
	S1S2 <= "01";
	WAIT FOR 50000 ps;
	S1S2 <= "00";
	WAIT FOR 100000 ps;
	S1S2 <= "01";
	WAIT FOR 50000 ps;
	S1S2 <= "10";
	WAIT FOR 100000 ps;
	S1S2 <= "00";
	WAIT FOR 50000 ps;
	S1S2 <= "10";
	WAIT FOR 50000 ps;
	S1S2 <= "11";
	WAIT FOR 100000 ps;
	S1S2 <= "00";
	WAIT FOR 100000 ps;
	S1S2 <= "10";
	WAIT FOR 50000 ps;
	S1S2 <= "00";
WAIT;
END PROCESS t_S1S2;

END Robot_arch;
