LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

--Digital Clock project testbench

--201991139 WANG ZHONGTIAN
--201990309 LAN ZHIJIE


ENTITY DIgital_Clock_vhd_vec_tst IS
END DIgital_Clock_vhd_vec_tst;
ARCHITECTURE DIgital_Clock_arch OF DIgital_Clock_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL buzz : STD_LOGIC;
SIGNAL clk_in : STD_LOGIC;
SIGNAL display_hour1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL display_hour2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL display_min1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL display_min2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL display_sec1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL display_sec2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL increase : STD_LOGIC;
SIGNAL operate : STD_LOGIC;
SIGNAL switch_mode : STD_LOGIC;
COMPONENT DIgital_Clock
	PORT (
	buzz : BUFFER STD_LOGIC;
	clk_in : IN STD_LOGIC;
	display_hour1 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	display_hour2 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	display_min1 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	display_min2 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	display_sec1 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	display_sec2 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	increase : IN STD_LOGIC;
	operate : IN STD_LOGIC;
	switch_mode : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : DIgital_Clock
	PORT MAP (
-- list connections between master ports and signals
	buzz => buzz,
	clk_in => clk_in,
	display_hour1 => display_hour1,
	display_hour2 => display_hour2,
	display_min1 => display_min1,
	display_min2 => display_min2,
	display_sec1 => display_sec1,
	display_sec2 => display_sec2,	
	increase => increase,
	operate => operate,
	switch_mode => switch_mode
	);

-- clk_in
t_prcs_clk_in: PROCESS
BEGIN
LOOP
	clk_in <= '0';
	WAIT FOR 5000 ps;
	clk_in <= '1';
	WAIT FOR 5000 ps;
END LOOP;
END PROCESS t_prcs_clk_in;

-- increase
t_prcs_increase: PROCESS
BEGIN
	increase <= '1';
	WAIT FOR 3120000 ps;
	increase <= '0';
	WAIT FOR 940000 ps;
	increase <= '1';
	WAIT FOR 300000 ps;
	increase <= '0';
	WAIT FOR 920000 ps;
	increase <= '1';
	WAIT FOR 10840000 ps;
	increase <= '0';
	WAIT FOR 1280000 ps;
	increase <= '1';
	WAIT FOR 760000 ps;
	increase <= '0';
	WAIT FOR 20000 ps;
	increase <= '1';
	WAIT FOR 600000 ps;
	increase <= '0';
	WAIT FOR 1000000 ps;
	increase <= '1';
WAIT;
END PROCESS t_prcs_increase;

-- operate
t_prcs_operate: PROCESS
BEGIN
	operate <= '1';
	WAIT FOR 3040000 ps;
	operate <= '0';
	WAIT FOR 10000 ps;
	operate <= '1';
	WAIT FOR 1090000 ps;
	operate <= '0';
	WAIT FOR 20000 ps;
	operate <= '1';
	WAIT FOR 1240000 ps;
	operate <= '0';
	WAIT FOR 20000 ps;
	operate <= '1';
	WAIT FOR 2000000 ps;
	operate <= '0';
	WAIT FOR 20000 ps;
	operate <= '1';
	WAIT FOR 6520000 ps;
	operate <= '0';
	WAIT FOR 20000 ps;
	operate <= '1';
	WAIT FOR 400000 ps;
	operate <= '0';
	WAIT FOR 20000 ps;
	operate <= '1';
	WAIT FOR 1300000 ps;
	operate <= '0';
	WAIT FOR 20000 ps;
	operate <= '1';
	WAIT FOR 2680000 ps;
	operate <= '0';
	WAIT FOR 20000 ps;
	operate <= '1';
	WAIT FOR 1560000 ps;
	operate <= '0';
	WAIT FOR 20000 ps;
	operate <= '1';
WAIT;
END PROCESS t_prcs_operate;

-- switch_mode
t_prcs_switch_mode: PROCESS
BEGIN
	switch_mode <= '1';
	WAIT FOR 6660000 ps;
	switch_mode <= '0';
	WAIT FOR 20000 ps;
	switch_mode <= '1';
	WAIT FOR 8740000 ps;
	switch_mode <= '0';
	WAIT FOR 20000 ps;
	switch_mode <= '1';
	WAIT FOR 4920000 ps;
	switch_mode <= '0';
	WAIT FOR 20000 ps;
	switch_mode <= '1';
WAIT;
END PROCESS t_prcs_switch_mode;
END DIgital_Clock_arch;