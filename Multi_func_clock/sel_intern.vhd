----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	sel_intern - Behavioral
-- Project Name: 	Weergave_Module
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sel_intern is
    Port (  klok25MHz : in  STD_LOGIC;
				sel: in std_logic_vector (2 downto 0);
				t_Sel : in std_logic_vector (1 downto 0);
				d_Sel : in std_logic_vector (1 downto 0);
				w_Sel : in std_logic_vector (1 downto 0);
				Ti_Sel : in std_logic_vector (1 downto 0);	
				VGA_sel : out std_logic_vector (1 downto 0)
			);
end sel_intern;

architecture Behavioral of sel_intern is

signal selectie : std_logic_vector (1 downto 0) := "00";

begin

process(klok25MHZ, sel)
	begin
		if rising_edge(klok25MHz) then
			case sel is
				when "000" =>
					selectie <= t_Sel;
				when "001" =>
					selectie <= d_Sel;
				when "010" =>
					selectie <= w_sel;
				when "011" =>
					selectie <= Ti_sel;
				when others =>
					selectie <= "00";
			end case;
		end if; -- End rising edge.
	end process;
	
	VGA_sel <= selectie;

end Behavioral;

