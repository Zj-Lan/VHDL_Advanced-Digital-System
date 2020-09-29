----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	Comporator - Behavioral
-- Project Name: 	alarm_clock_func
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Comporator is
    Port ( clk25MHz : in  STD_LOGIC;
           eMW : in  STD_LOGIC_VECTOR (3 downto 0);
           tMW : in  STD_LOGIC_VECTOR (3 downto 0);
           eUW : in  STD_LOGIC_VECTOR (3 downto 0);
           tUW : in  STD_LOGIC_VECTOR (3 downto 0);
           eM : in  STD_LOGIC_VECTOR (3 downto 0);
           tM : in  STD_LOGIC_VECTOR (3 downto 0);
           eU : in  STD_LOGIC_VECTOR (3 downto 0);
           tU : in  STD_LOGIC_VECTOR (3 downto 0);
			  w_on: in STD_LOGIC;
           gelijk : out  STD_LOGIC;
           OFFA : out  STD_LOGIC);
end Comporator;

architecture Behavioral of Comporator is

signal tM_int, eU_int, tU_int : std_logic_vector (3 downto 0);
signal gelijk_int, OFFA_int : std_logic := '0';

begin

process(clk25MHz, w_on)
	begin
		if rising_edge(clk25MHz) then
		
			if w_on = '1' then
				if eMW = eM and tMW = tM and eUW = eU and tUW = tU then
					gelijk_int <= '1';
					OFFA_int <= '0';
					if tMW = 5 and (tUW = 2 and eUW = 3) then
						tM_int <= "0000";
						eU_int <= "0000";
						tU_int <= "0000";
					elsif tMW = 5 and (tUW /= 2 and eUW = 9) then
						tM_int <= "0000";
						eU_int <= "0000";
						tU_int <= tUW + 1;
					elsif tMW = 5 and (tUW /= 2 and eUW /= 3) then
						tM_int <= "0000";
						eU_int <= eUW + 1;
						tU_int <= tUW;
					else
						tM_int <= tMW + 1;
						eU_int <= eUW;
						tU_int <= tUW;
					end if;
				else
					gelijk_int <= '0';
					OFFA_int <= '0';
				end if;
			else
				gelijk_int <= '0';
				OFFA_int <= '0';
			end if;
			
			if tM_int = tM and eU_int = eU and tU_int = tU then
				gelijk_int <= '0';
				OFFA_int <= '1';
			end if;
		end if;

end process;

gelijk <= gelijk_int;
OFFA <= OFFA_int;

end Behavioral;
