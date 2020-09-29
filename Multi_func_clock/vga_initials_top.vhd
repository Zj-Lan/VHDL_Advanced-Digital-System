----------------------------------------------------------------------------------
-- Company: 		Artesis
-- Engineer: 		Kaj Van der Hallen
-- 
-- Create Date:   00:13:32 04/18/2012 
-- Module Name:   VGA_initials_top - Structural 
-- Project Name: 	Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity VGA is
port (clk : in std_logic;								-- systeemklok
		hsync : out std_logic;								-- horizontaal synchronisatiesignaal
		vsync : out std_logic;								-- verticaal synchronisatiesignaal
		red : out std_logic_vector(2 downto 0);				-- uitgang naar 3 bit da-converter (rood)voor VGA scherm
		green : out std_logic_vector(2 downto 0);			-- uitgang naar 3 bit da-converter (groen)voor VGA scherm
		blue : out std_logic_vector(1 downto 0);				-- uitgang naar 2 bit da-converter (blauw)voor VGA scherm
		d1,d2,d4,d5,d7,d8 : in std_logic_vector(3 downto 0);
		VSel : in std_logic_vector (2 downto 0); -- Selectie Functie
		VSegSel : in std_logic_vector (1 downto 0); -- Selectie blok instellen
		Wac : in std_logic; -- alarm_clock active?
		Alac : in std_logic; -- Alarm active?
		clk4Hz : in std_logic;
		feS,ftS,feM,ftM,feH,ftH : in std_logic_vector(3 downto 0)
		);
end VGA;

architecture structural of VGA is
	
signal clr,vidon : std_logic;
signal hc, vc : std_logic_vector(9 downto 0);
signal M : std_logic_vector(0 to 10);
signal rom_addr4 : std_logic_vector(8 downto 0);

	COMPONENT vga_640x480
	PORT(
		clk: in std_logic;
		clr: in std_logic;
		hsync : out std_logic;
		vsync : out std_logic;
		hc 	:	out std_logic_vector(9 downto 0);
		vc 	:	out std_logic_vector(9 downto 0);
		vidon :	out std_logic
		);
	END COMPONENT;

	COMPONENT prom_DMH
	PORT(
		clk : in std_logic;
		addr : in std_logic_vector(8 downto 0);
		M : out  STD_LOGIC_VECTOR (0 to 10)
		);
	END COMPONENT;
	
	COMPONENT vga_initials
	PORT(
			clk : in std_logic;
			vidon: in std_logic;
			hc : in std_logic_vector(9 downto 0);
			vc : in std_logic_vector(9 downto 0);
			M  : in std_logic_vector(0 to 10);
			rom_addr4 : out std_logic_vector(8 downto 0);
			red : out std_logic_vector(2 downto 0);
			green : out std_logic_vector(2 downto 0);
			blue : out std_logic_vector(1 downto 0);
			d1,d2,d4,d5,d7,d8 : in std_logic_vector(3 downto 0);
			VSel : in std_logic_vector (2 downto 0); -- Selectie Functie
			VSegSel : in std_logic_vector (1 downto 0); -- Selectie blok instellen
			Wac : in std_logic; -- alarm_clock active?
			Alac : in std_logic; -- Alarm active?
			clk4Hz : in std_logic;
			feS,ftS,feM,ftM,feH,ftH : in std_logic_vector(3 downto 0)
		);
	END COMPONENT;

begin
		clr <= '0';
		
		Inst_vga_640x480: vga_640x480
		PORT MAP(
		clk => clk,
		clr => clr,
		hsync => hsync,
		vsync => vsync,
		hc => hc,
		vc => vc,
		vidon => vidon
		);
		
		
		Inst_vga_initials : vga_initials
		PORT MAP(
			clk => clk,
			vidon => vidon,
			hc => hc,
			vc => vc,
			M => M,
			rom_addr4 => rom_addr4,
			red => red,
			green => green,
			blue => blue,
			d1 => d1,
			d2 => d2,
			d4 => d4,
			d5 => d5,
			d7 => d7,
			d8 => d8,
			VSel => VSel,
			VSegSel => VSegSel,
			Wac => Wac,
			Alac => Alac,
			clk4Hz => clk4Hz,
			feS => feS,
			ftS => ftS,
			feM => feM,
			ftM => ftM,
			feH => feH,
			ftH => ftH
			
		);
		
		Inst_prom_DMH : prom_DMH
		PORT MAP(
			clk => clk,
			addr => rom_addr4,
			M => M
		);

		
end structural;

