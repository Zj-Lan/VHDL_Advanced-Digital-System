----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    09:54:48 02/23/2012 
-- Module Name:    UREN - Structural 
-- Project Name: Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UREN is
    Port ( clk25MHz : in  STD_LOGIC;
			  uEn : in STD_LOGIC;
           clr : in  STD_LOGIC;
           DOWN : in  STD_LOGIC;
           eU : out  STD_LOGIC_VECTOR (3 downto 0);
           tU : out  STD_LOGIC_VECTOR (3 downto 0);
           oD : out  STD_LOGIC);
end UREN;

architecture Behavioral of UREN is

	COMPONENT nnCounter
	Generic ( e : integer := 9;
				t : integer := 9);
   Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           down : in  STD_LOGIC;
           e_out : out  STD_LOGIC_VECTOR (3 downto 0);
           t_out : out  STD_LOGIC_VECTOR (3 downto 0);
           max : out  STD_LOGIC);
	END COMPONENT;


begin



Inst_nnCounter: nnCounter 
generic map(
	e => 4,
	t => 2
)
PORT MAP(
		clk => clk25MHz,
		en => uEn,
		clr => clr,
		down => DOWN,
		e_out => eU,
		t_out => tU,
		max => oD
);



end Behavioral;
