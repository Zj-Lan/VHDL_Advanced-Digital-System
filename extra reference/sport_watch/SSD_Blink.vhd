----------------------------------------------------------------------------------
-- Company: HSN	
-- Engineer: Qinghui Liu
-- 
-- Create Date:    16:07:11 02/11/2016  
-- Design Name: 
-- Module Name:    ssd blink function process for each module selected
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use work.ssd_pkg.all;
use work.FSM_process_pkg.all;

entity SSD_Blink is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  pr_modul  : in  MODULE_STATES;
           blink_flag : in  SSD_BLINK_STATE;
			  cac_bcd: in  STD_LOGIC_VECTOR (31 downto 0);
           sw_bcd : in  STD_LOGIC_VECTOR (31 downto 0);
           tm_bcd : in  STD_LOGIC_VECTOR (31 downto 0);
			  sseg 	: OUT std_logic_vector(7 downto 0);
				an 	: OUT std_logic_vector(3 downto 0));
end SSD_Blink;

architecture Behavioral of SSD_Blink is

	COMPONENT SSD_Mux
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		in0 : IN std_logic_vector(7 downto 0);
		in1 : IN std_logic_vector(7 downto 0);
		in2 : IN std_logic_vector(7 downto 0);
		in3 : IN std_logic_vector(7 downto 0);          
		sseg 	: OUT std_logic_vector(7 downto 0);
		an 	: OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	signal hunSecPulse	: std_logic ;	-- 0.01 seconds pulse signal
   signal ssd0, ssd1, ssd2, ssd3:  STD_LOGIC_VECTOR (7 downto 0):= x"FF";
	
begin
	-- init ssd_mux component 
	ssg_mux: SSD_Mux PORT MAP(clk ,rst, ssd0, ssd1, ssd2, ssd3, sseg, an);
	
	--generate a pulse signal per 0.01 seconds for calculating time.
	process (clk, rst)
		variable counter, counter_next : natural := 0;
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				counter_next := 0;
			else
				counter := counter_next;
				counter_next := counter + 1;
				if (counter = 999999) then
					counter_next := 0;
					hunSecPulse <= '1';
				else
					hunSecPulse <= '0';
				end if;
			end if;
		end if;
	end process;
	
	process (clk, hunSecPulse, blink_flag, pr_modul)
		constant BLINK_TM  : natural := 30; -- blink 0.3 second
		variable delay_cnt : natural range 0 to 30;
		
		variable bcd0	: std_logic_vector (7 downto 0);
		variable bcd1	: std_logic_vector (7 downto 0);
		variable bcd2	: std_logic_vector (7 downto 0);
		variable bcd3	: std_logic_vector (7 downto 0);	
		
	begin 
		if (hunSecPulse = '1') then
			delay_cnt := delay_cnt + 1;
		end if;
		
		if rising_edge(clk) then
			case pr_modul is
				when STOPWATCH_MD =>
					bcd0 := sw_bcd(7 downto 0); 
					bcd1 := sw_bcd(15 downto 8);  
					bcd2 := sw_bcd(23 downto 16);  
					bcd3 := sw_bcd(31 downto 24);			
				when TIMER_MD =>
					bcd0 := tm_bcd(7 downto 0); 
					bcd1 := tm_bcd(15 downto 8);  
					bcd2 := tm_bcd(23 downto 16);  
					bcd3 := tm_bcd(31 downto 24);				
				when others => 
					bcd0 := cac_bcd(7 downto 0); 
					bcd1 := cac_bcd(15 downto 8);  
					bcd2 := cac_bcd(23 downto 16);  
					bcd3 := cac_bcd(31 downto 24);						
			end case;
		
			ssd_Blink_Display( blink_flag, delay_cnt, BLINK_TM,
									 bcd0, bcd1, bcd2, bcd3,
								    ssd0, ssd1, ssd2, ssd3  
									);	
		end if; 
	end process;


end Behavioral;

