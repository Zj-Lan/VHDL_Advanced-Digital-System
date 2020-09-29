----------------------------------------------------------------------------------
-- Company: HSN
-- Engineer: Group 4 (Qinghui Liu, Zhili Shao, Joseph)
-- 
-- Create Date:    14:44:36 01/30/2016 
-- Design Name:  	 Group 4, 1st Lab assignment 
-- Module Name:    7-segment display - Behavioral 
-- Project Name:   Digital Clock
-- Target Devices: NEXYS 3
-- Tool versions:  ISE P.20131013
-- Description: 
--	This unit is usded to decode seven segment display modul which 
-- then can be used to display 4-digits in 7-sgm modul. 
-- 
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SSD_Mux is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           in0 : in  STD_LOGIC_VECTOR (7 downto 0);
           in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           in3 : in  STD_LOGIC_VECTOR (7 downto 0);
           sseg : out  STD_LOGIC_VECTOR (7 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0));
end SSD_Mux;

architecture Behavioral of SSD_Mux is
	constant N: integer := 18;	-- down clk freg to low refreshing rate
	constant L: std_logic_vector := "11111111"; -- off all segs
	signal sel: std_logic_vector(1 downto 0);
	signal q_reg, q_next: unsigned(N-1 downto 0);
--	signal q_reg, q_next: unsigned(1 downto 0) := "00"; -- this line just used for simulation
begin
	q_next <= q_reg + 1; -- counter for down freq
	sel <= q_reg(N-1) & q_reg(N-2); --2 MSBs of counter 
--	sel <= q_reg(1) & q_reg(0);	-- this line just used for simulation
	
	process(clk)
	begin
		if rising_edge(clk) then
			q_reg <= q_next;		
		end if;
	end process;
	
	process(rst, sel, in0,in1,in2,in3)
	begin 
		case sel is 
			when "00" =>
				an<="1110";
				if rst = '1' then
					sseg <= L;
				else 
					sseg <= in0;
				end if;
			when "01" =>
				an<="1101";
				if rst = '1' then
					sseg <= L;
				else 
					sseg <= in1;
				end if;				
			when "10" =>
				an<="1011";
				if rst = '1' then
					sseg <= L;
				else 
					sseg <= in2;
				end if;				
			when others =>
				an<="0111";
				if rst = '1' then
					sseg <= L;
				else 
					sseg <= in3;
				end if;				
		end case;		
	end process;

end Behavioral;

