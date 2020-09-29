----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    10:56:08 03/20/2012 
-- Module Name:    clock_divider - Structural 
-- Project Name: Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock_divider is
    Port ( clk50MHz_in : in  STD_LOGIC;
           clk25MHz_out : out  STD_LOGIC;
			  TC_clk100Hz_out : out  STD_LOGIC;
           TC_clk4Hz_out : out  STD_LOGIC;
           TC_clk1Hz_out : out  STD_LOGIC);
end clock_divider;

architecture Structural of clock_divider is


	COMPONENT nnCounterV2
	Generic ( i : integer := 10);
   Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           clr : in  STD_LOGIC := '0';
           down : in  STD_LOGIC := '0';
           max : out  STD_LOGIC);
	END COMPONENT;

	COMPONENT clk25MHz
	PORT( 
		clk50MHz : in  STD_LOGIC;
		clk25MHz : out  STD_LOGIC);
	END COMPONENT;


signal clk25MHz_int : STD_LOGIC;

signal TC_100Hz : std_logic;
signal TC_4Hz : std_logic;
signal TC_1Hz : std_logic;

begin

--50MHz -> 25MHz
Inst_clk25MHz: clk25MHz
PORT MAP(
		clk50MHz => clk50MHz_in,
		clk25MHz => clk25MHz_int
);

--25MHz -> 100Hz
Inst_clk100Hz: nnCounterV2 
generic map(
	i => 250000
)
PORT MAP(
		clk => clk50MHz_in,
		en =>clk25MHz_int,
		clr => open,
		down => open,
		max => TC_100Hz
);

--100Hz -> 4Hz
Inst_clk4Hz: nnCounterV2 
generic map(
	i => 25
)
PORT MAP(
		clk => clk50MHz_in,
		en =>TC_100Hz,
		clr => open,
		down => open,
		max => TC_4Hz
);

--4Hz -> 1Hz
Inst_clk1Hz: nnCounterV2
generic map(
	i => 4
)
PORT MAP(
		clk => clk50MHz_in,
		en =>TC_4Hz,
		clr => open,
		down => open,
		max => TC_1Hz
);

clk25MHz_out <= clk25MHz_int;
TC_clk100Hz_out <= TC_100Hz;
TC_clk4Hz_out <= TC_4Hz;
TC_clk1Hz_out <= TC_1Hz;
end Structural;