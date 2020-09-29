----------------------------------------------------------------------------------
-- Company: HSN
-- Engineer: Group 4 (Qinghui Liu, Zhili Shao, Joseph)
-- 
-- Create Date:    14:44:36 01/30/2016 
-- Design Name:  	 Group 4, 1st Lab assignment 
-- Module Name:    dButton - Behavioral 
-- Project Name:   Digital Clock
-- Target Devices: NEXYS 3
-- Tool versions:  ISE P.20131013
-- Description: 
--	This unit is usded to debounce button and generate three button events which 
-- then can be used to toggle proper transition of state machine. 
-- 
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity dButton is
	 Generic (FROM_HZ : integer := 100000000;		-- from 100M Hz - clock main frequency
				 TO_HZ 	: integer := 5000				-- down to 5K Hz - scan buttong frequency
--				 TO_HZ 	: integer := 100000000		-- for simulate, set FROM_HZ = TO_HZ
				 ); 											
				 
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  btn	: in  STD_LOGIC;
			  btn_press		: out STD_LOGIC;	-- output btn Pressed signal
			  btn_hold 		: out STD_LOGIC;  -- output btn Holding signal
			  btn_release	: out STD_LOGIC	-- output btn Released signal
			  );
end dButton;

architecture Behavioral of dButton is
	signal inff 	: std_logic_vector (2 downto 0) := (others => '0'); -- store button states buffer
	signal sample  : std_logic := '0';	-- sample signal to scan button's state
	signal pr_dbtn	: std_logic := '0';	-- previous deButton state.
	signal nx_dbtn	: std_logic := '0';	-- next deButton state 
	
	--shared variable DIV_NUMBER : integer := FROM_HZ/TO_HZ - 1; -- frequence counter for sample button
begin
-- generate TO_HZ's sample singal ..
	gen_sample: process(clk)
		--variable counter : integer range 0 to DIV_NUMBER;
		variable counter, counter_next : natural := 0;
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				counter_next := 0;
				sample <= '0';
			else
				counter := counter_next;
				counter_next := counter + 1;
				if (counter = FROM_HZ/TO_HZ - 1) then
					sample <= '1';
					counter_next := 0;
				else 
					sample <= '0';			
				end if;		
			end if;		
		end if;
	end process gen_sample;	

-- debounce button signal and get stale button state	
	debouncing: process (clk, rst)
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				inff <= (others => '0');
			else		
				if sample = '1' then
					inff <= inff(1) & inff(0) & btn;
				end if;
				
				pr_dbtn <= nx_dbtn;
				nx_dbtn <= inff(2) and inff(1) and inff(0);
			end if;
		end if;			
	end process debouncing;
	
-- generat button's three events by conparing pre and next states. 	
	gen_btn_event: process (clk, btn)
	begin
		if rising_edge(clk) then
			if (rst = '1')  then
				btn_release <= '0';
				btn_hold <= '0'; 
				btn_press <= '0'; 	
			else 
				if (btn = '1') then
					if (sample = '1') then
						btn_press <= (pr_dbtn xor nx_dbtn); -- button pressed signal
						btn_release <= '0'; 						-- button released signal
						btn_hold <= (pr_dbtn and nx_dbtn);	-- button holding signal
					end if;
				else
					btn_release <= (pr_dbtn xor nx_dbtn); 	-- button released signal
					btn_hold <= (pr_dbtn and nx_dbtn); 	-- button holding signal
					btn_press <= '0'; -- button pressed signal		
				end if;
			end if;
		end if;
	end process gen_btn_event;

end Behavioral;

