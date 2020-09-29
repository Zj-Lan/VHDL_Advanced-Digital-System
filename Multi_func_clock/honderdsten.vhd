----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    11:21:23 04/11/2012 
-- Module Name:    HONDERDSTEN - Structural 
-- Project Name: Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HONDERDSTEN is
    Port ( clk25MHz : in  STD_LOGIC;
			  en : in STD_LOGIC;
			  clr : in STD_LOGIC;
           down : in  STD_LOGIC;
           eH : out  STD_LOGIC_VECTOR (3 downto 0);
           tH : out  STD_LOGIC_VECTOR (3 downto 0);
           sEn : out  STD_LOGIC);
end HONDERDSTEN;

architecture Structural of HONDERDSTEN is

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


Inst_eenheden: nnCounter 
generic map(
	e => 0,
	t => 10
)
PORT MAP(
		clk => clk25MHz,
		en =>en,
		clr => clr,
		down => down,
		e_out => eH,
		t_out => tH,
		max => sEn
);


end Structural;

