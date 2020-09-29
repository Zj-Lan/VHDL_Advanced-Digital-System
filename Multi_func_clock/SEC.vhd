----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    09:31:47 02/23/2012
-- Module Name:    SEC - Structural 
-- Project Name: Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SEC is
    Port ( clk25MHz : in  STD_LOGIC;
			  sEn : in STD_LOGIC;
			  clr : in STD_LOGIC;
           DOWN : in  STD_LOGIC;
           eS : out  STD_LOGIC_VECTOR (3 downto 0);
           tS : out  STD_LOGIC_VECTOR (3 downto 0);
           mEn : out  STD_LOGIC);
end SEC;

architecture Structural of SEC is

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
	e => 0,
	t => 6
)
PORT MAP(
		clk => clk25MHz,
		en =>sEn,
		clr => clr,
		down => DOWN,
		e_out => eS,
		t_out => tS,
		max => mEn
);

end Structural;

