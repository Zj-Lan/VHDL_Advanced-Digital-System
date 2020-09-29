----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    10:58:56 03/20/2012 
-- Module Name:    clk25MHz - Behavioral 
-- Project Name: Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk25MHz is
    Port ( clk50MHz : in  STD_LOGIC;
           clk25MHz : out  STD_LOGIC);
end clk25MHz;

architecture Behavioral of clk25MHz is
signal cnt_int : integer range 0 to 1 := 0;
signal EnOut_int : std_logic := '0';
begin

process(clk50MHz)
begin
	if rising_edge(clk50MHz) then
		--Teller 0->249999
		if cnt_int = 1 then
			cnt_int <= 0;
			EnOut_int <= '1';
		else
			cnt_int <= cnt_int + 1;
			EnOut_int <= '0';
		end if;
	end if;	
end process;

clk25MHz <= EnOut_int;

end Behavioral;