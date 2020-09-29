----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    15:26:40 02/22/2012 
-- Module Name:    Debouncer - Behavioral 
-- Project Name: Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debouncer is
    Port ( clk : in STD_LOGIC;
			  clk100Hz : in  STD_LOGIC;
           b1,b2,b3,b4 : in  STD_LOGIC;
			  b1_d,b2_d,b3_d,b4_d : out STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is

signal cnt1,cnt2,cnt3,cnt4 : integer range 0 to 2 := 0;
signal b1_d_int,b2_d_int,b3_d_int,b4_d_int : std_logic := '0';

signal prev_b1,prev_b2,prev_b3,prev_b4 : std_logic := '0';
signal act_b1,act_b2,act_b3,act_b4 : std_logic := '0';


begin

process (clk)
begin

if rising_edge(clk) and clk100Hz = '1' then
	if b1 = '0' then
		cnt1 <= 0;
		b1_d_int <= '0';
	elsif cnt1 /= 2 then
		cnt1 <= cnt1 + 1;
	else
		b1_d_int <= '1';
	end if;
	
	if b2 = '0' then
		cnt2 <= 0;
		b2_d_int <= '0';
	elsif cnt2 /= 2 then
		cnt2 <= cnt2 + 1;
	else
		b2_d_int <= '1';
	end if;
	
	if b3 = '0' then
		cnt3 <= 0;
		b3_d_int <= '0';
	elsif cnt3 /= 2 then
		cnt3 <= cnt3 + 1;
	else
		b3_d_int <= '1';
	end if;
	
	if b4 = '0' then
		cnt4 <= 0;
		b4_d_int <= '0';
	elsif cnt4 /= 2 then
		cnt4 <= cnt4 + 1;
	else
		b4_d_int <= '1';
	end if;
end if;
end process;

process (clk)
begin
	if rising_edge(clk) then
		
		--b1
		if prev_b1 = '0' and b1_d_int = '1' then
			act_b1 <= '1';
			prev_b1 <= '1';
		elsif prev_b1 = '1' and b1_d_int = '1' then
			act_b1 <= '0';
		elsif b1_d_int = '0' then
			prev_b1 <= '0';
			act_b1 <= '0';
		end if;
		
		--b2
		if prev_b2 = '0' and b2_d_int = '1' then
			act_b2 <= '1';
			prev_b2 <= '1';
		elsif prev_b2 = '1' and b2_d_int = '1' then
			act_b2 <= '0';
		elsif b2_d_int = '0' then
			prev_b2 <= '0';
			act_b2 <= '0';
		end if;
		
		--b3
		if prev_b3 = '0' and b3_d_int = '1' then
			act_b3 <= '1';
			prev_b3 <= '1';
		elsif prev_b3 = '1' and b3_d_int = '1' then
			act_b3 <= '0';
		elsif b3_d_int = '0' then
			prev_b3 <= '0';
			act_b3 <= '0';
		end if;
		
		--b4
		if prev_b4 = '0' and b4_d_int = '1' then
			act_b4 <= '1';
			prev_b4 <= '1';
		elsif prev_b4 = '1' and b4_d_int = '1' then
			act_b4 <= '0';
		elsif b4_d_int = '0' then
			prev_b4 <= '0';
			act_b4 <= '0';
		end if;
		
	end if;
end process;


b1_d <= act_b1;
b2_d <= act_b2;
b3_d <= act_b3;
b4_d <= act_b4;

end Behavioral;