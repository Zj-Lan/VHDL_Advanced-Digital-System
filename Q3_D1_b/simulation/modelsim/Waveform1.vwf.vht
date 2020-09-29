LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Q3_D1_decoder_tst IS
END Q3_D1_decoder_tst;
ARCHITECTURE Q3_D1_decoder_arch OF Q3_D1_decoder_tst IS
                                                
SIGNAL code_ham : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL code_ori : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL parity : STD_LOGIC;
SIGNAL syndrome : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT Q3_D1_decoder
	PORT (
	code_ham : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	code_ori : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	parity : IN STD_LOGIC;
	syndrome : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Q3_D1_decoder
	PORT MAP (
	code_ham => code_ham,
	code_ori => code_ori,
	parity => parity,
	syndrome => syndrome
	);

t_code_ham: PROCESS
BEGIN
	code_ham <= "0101010";
	WAIT FOR 250000 ps;
	code_ham <= "1000111";
	WAIT FOR 250000 ps;
	code_ham <= "0000000";
	WAIT FOR 250000 ps;
	code_ham <= "1011000";
WAIT;
END PROCESS t_code_ham;

t_parity: PROCESS
BEGIN
LOOP
	parity <= '0';
	WAIT FOR 125000 ps;
	parity <= '1';
	WAIT FOR 125000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_parity;
END Q3_D1_decoder_arch;
