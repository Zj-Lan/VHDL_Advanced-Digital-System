----------------------------------------------------------------------------------
-- Company: HSN	
-- Engineer: Qinghui Liu , Zhili Shao, Joseph Fotso
-- 
-- Create Date:    14:27:31 02/01/2016 
-- Design Name: 
-- Module Name:    smtWatch - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use work.ssd_pkg.all;
use work.FSM_process_pkg.all;

entity SportWatch is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           btn1 : in  STD_LOGIC;
			  btn2: in	STD_LOGIC;
			  btn3: in  STD_LOGIC;
           mode_led : out  std_ulogic_vector (4 downto 0);
			  ssd : out std_logic_vector(7 downto 0);
			  anode : out std_logic_vector(3 downto 0));
			  
end SportWatch;

architecture Behavioral of SportWatch is

	COMPONENT dButton
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		btn : IN std_logic;          
		btn_press 	: OUT std_logic;
		btn_hold 	: OUT std_logic;
		btn_release : OUT std_logic
		);
	END COMPONENT;

	COMPONENT LED_Blink
	PORT(
		clk : IN std_logic;
      rst : IN std_logic;
		pr_modul   : IN  MODULE_STATES;
		blink_flag : IN SSD_BLINK_STATE;         
		led_out : OUT std_ulogic_vector(4 downto 0)
		);
	END COMPONENT;

	COMPONENT CAC_Module
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		pr_modul : IN MODULE_STATES;
		event_btn2 : IN std_logic;
		event_btn3 : IN std_logic;
		hold_btn3 : IN std_logic;    
		alarm_flag : INOUT std_logic;      
		cac_blink : OUT SSD_BLINK_STATE;
		cac_bcd : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
	COMPONENT Swatch_Module
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		pr_modul : IN  MODULE_STATES;
		event_btn2 : IN std_logic;
		event_btn3 : IN std_logic;          
		sw_blink : OUT SSD_BLINK_STATE; 
		sw_bcd : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Timer_Module
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		pr_modul : IN  MODULE_STATES;
		event_btn2 : IN std_logic;
		event_btn3 : IN std_logic;
		hold_btn3 : IN std_logic;      
		tm_alarm : inout  STD_LOGIC;		
		tm_blink : OUT  SSD_BLINK_STATE; 
		tm_bcd : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MD_Switch
	PORT(
		clk : in  STD_LOGIC;
      rst : in  STD_LOGIC;
		envent_btn1 : IN std_logic;	
		cac_blink: IN SSD_BLINK_STATE;
		sw_blink : IN SSD_BLINK_STATE;
		tm_blink : IN SSD_BLINK_STATE;
		clock_alarm : in  STD_LOGIC;
		timer_alarm : in  STD_LOGIC;         
		cr_modul : OUT MODULE_STATES;	
		blink_flag : OUT SSD_BLINK_STATE
		);
	END COMPONENT;


	COMPONENT SSD_Blink
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		pr_modul  : IN  MODULE_STATES;
		blink_flag : IN SSD_BLINK_STATE;
		cac_bcd: IN  STD_LOGIC_VECTOR (31 downto 0);
		sw_bcd : IN std_logic_vector(31 downto 0);
		tm_bcd : IN std_logic_vector(31 downto 0);          
		sseg 	: OUT std_logic_vector(7 downto 0);
		an 	: OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	signal blink_flag : SSD_BLINK_STATE; -- blink on/off for led and ssd, refer to FSM_process_pkg
	signal pr_modul : MODULE_STATES; -- modules switch signal,refer to FSM_process_pkg
	
	-- button events signal 
	-- signal for button events, 
	signal release_btn : std_logic_vector (1 to 3) := (others => '0');
	signal hold_btn3 : std_logic := '0'; 

	--output data form each module
	signal cac_bcd, sw_bcd, tm_bcd : std_logic_vector (31 downto 0):= (others => '0');
	--output blink_flag from each module
	signal cac_blink, sw_blink, tm_blink: SSD_BLINK_STATE;	
	--output alarm flag from alarm and timer modules
	signal clock_alarm  : std_logic := '0';	
	signal timer_alarm  : std_logic := '0';	
	
begin
	--operation buttons initialization...
	--button 1 used to switch on/off modules, 
	--button 2 and button 3 used to inside operation of each module
	btn1_ev: dButton PORT MAP(clk,rst, btn1, open ,open ,release_btn(1) );
	btn2_ev: dButton PORT MAP(clk,rst, btn2, open ,open ,release_btn(2) );	
	btn3_ev: dButton PORT MAP(clk,rst, btn3, open ,hold_btn3 ,release_btn(3) );
	
	--modules switch unit by  
	--each press&release button 1 will change among five moduls
	--clock, alarm, calendar, stopwatch, and timer
	switch: MD_Switch PORT MAP(clk, rst, release_btn(1),  
										cac_blink, sw_blink, tm_blink, 
										clock_alarm, timer_alarm, 
										pr_modul,	blink_flag);
										
	--3 key functional modules initializations
	--cac module includes 3 sub-mode, clock, alarm and canlendar mode, 
	--by press btn1 to change among them 
	cac_md: CAC_Module PORT MAP (clk, rst, pr_modul, 
										  release_btn(2) ,release_btn(3),hold_btn3,
										  clock_alarm, cac_blink, cac_bcd);
										  
	--swatch module to implement stopwatch function										 
	swatch_md: Swatch_Module PORT MAP(clk, rst, pr_modul, release_btn(2), release_btn(3), 
												 sw_blink, sw_bcd );
												 
	--timer module to implement timer function
	timer_md: Timer_Module PORT MAP( clk, rst, pr_modul,  
												release_btn(2), release_btn(3), hold_btn3,
												timer_alarm, tm_blink, tm_bcd );

	-- process ssd blink and bcd data for each module selected 
	md_BLK_ssd: SSD_Blink PORT MAP(clk, rst, pr_modul, blink_flag, 
											cac_bcd, sw_bcd, tm_bcd,
											ssd, anode);
	-- process led blink for each module seleted											
	md_BLK_led: LED_Blink PORT MAP(clk, rst, pr_modul, blink_flag, mode_led);											


end Behavioral;

