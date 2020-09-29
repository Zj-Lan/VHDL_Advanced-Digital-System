----------------------------------------------------------------------------------
-- Company: 	Artesis
-- Engineer: 	Kaj Van der Hallen
-- 
-- Create Date:    00:27:27 04/18/2012 
-- Module Name:    prom_DMH - Behavioral 
-- Project Name: Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_640x480 is
port ( 	clk, clr : in std_logic;
		hsync : out std_logic;
		vsync : out std_logic;
		hc 	:	out std_logic_vector(9 downto 0);
		vc 	:	out std_logic_vector(9 downto 0);
		vidon :	out std_logic
		);
end vga_640x480;

architecture vga_640x480 of vga_640x480 is
constant hpixels:	std_logic_vector(9 downto 0) := "1100100000";			--	aantal horizontale pixels (geinitialiseerd op 800 )
constant vlines:	std_logic_vector(9 downto 0) := "1000001001";			--	aantal lijnen (geinitialiseerd op 521)
constant hbp:		std_logic_vector(9 downto 0) := "0010010000";			--	achterstoep hsync geinitialiseerd op 128 + 16 = 144 pixelklokpulsen)
constant hfp:		std_logic_vector(9 downto 0) := "1100010000";			--	voorstoep hsync geinitialiseerd op 128 + 16 + 640 = 784 pixelklokpulsen)
constant vbp:		std_logic_vector(9 downto 0) := "0000011111";			--	achterstoep vsync geinitialiseerd op 2 + 29 = 31 lijnen)
constant vfp:		std_logic_vector(9 downto 0) := "0111111111";			--	voorstoep vsync geinitialiseerd op 2 + 29 + 480 = 511 lijnen)
signal hcs, vcs :	std_logic_vector(9 downto 0) := "0000000000";			-- signalen van tellers die horizontale en verticale positie op het scherm tellen
signal vsenable :	std_logic;															-- "enable" voor de verticale positie teller

begin
-- horizontale synchronisatie
	process(clk, clr)
	begin
		if clr = '1' then
			hcs <= "0000000000";											-- zet horizontale pixelteller op 0 als clr ingang geactiveerd wordt
		elsif (clk'event and clk = '1') then						-- ? stijgende klokflank
			if hcs = hpixels - 1 then									-- ? horizontale teller op maximum  (=spot op einde lijn)
				hcs <= "0000000000";										-- zet horizontale teller op 0 => spot terug naar begin lijn
				vsenable <= '1';											-- geef aan dat lijnteller met 1 verhoogd mag worden
			else
				hcs <= hcs +1;												-- verhoog horizontale pixelteller met 1
				vsenable <= '0' ;											-- hou de lijnteller op bestaande stand ( = belet dat hij verhoogd)
			end if;
		end if;
	end process;

	hsync <= '0' when hcs < 128 else '1';							-- stuur horizontale syncpuls (0) naar uitgang gedurende 128 pixelklokperioden
	
-- verticale synchronisatie
	process(clk, clr)
	begin
		if clr = '1' then
			vcs <= "0000000000";											-- zet lijnteller op 0 als clr ingang geactiveerd wordt
		elsif (clk'event and clk = '1' and vsenable='1') then	-- ? stijgende klokflank en lijnteller actief
			if vcs = vlines - 1 then									-- ? lijnteller teller op maximum  (=spot op laatste lijn)
				vcs <= "0000000000";										-- zet lijnteller op 0 => spot terug naar bovenzijde scherm
			else
				vcs <= vcs +1;												-- verhoog lijnteller met 1
			end if;
		end if;
	end process;

	vsync <= '0' when vcs < 2 else '1';								-- stuur verticale syncpuls (0) naar uitgang gedurende 2 lijntijden
	vidon <= '1' when (((hcs < hfp) and (hcs >= hbp))
				and ((vcs < vfp) and (vcs >= vbp))) else '0';	-- geeft aan (als 1) dat spot zich in het zichtbaar deel van het scherm bevindt
	hc <= hcs;																-- plaats waarde in de horizontale (pixel)teller op uitgang hc
	vc <= vcs;																-- plaats waarde in de verticale (lijn)teller op uitgang vc
end vga_640x480;