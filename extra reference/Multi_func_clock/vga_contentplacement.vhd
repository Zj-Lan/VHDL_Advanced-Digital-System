----------------------------------------------------------------------------------
-- Company: 	Artesis
-- Engineer:	Kaj Van der Hallen 
-- 
-- Create Date:    00:22:41 04/18/2012 
-- Design Name: 
-- Module Name:    vga_initials - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_initials is
port (clk : in STD_LOGIC;
		vidon: in std_logic;
		hc : in std_logic_vector(9 downto 0);				-- horizontale pixelcoordinaat vanuit sync_generator
		vc : in std_logic_vector(9 downto 0);				-- verticale pixelcoordinaat vanuit sync_generator
		M  : in std_logic_vector(0 to 10);					-- informatielijn uit karakterrom
		rom_addr4 : out std_logic_vector(8 downto 0);		-- uitgaand adres naar rom-module voor selectie rij in de rom
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
end vga_initials;


architecture vga_initials of vga_initials is

constant hbp: integer := 144;		-- hor voorstoep geinitialiseerd op 144
constant vbp: integer := 31;		-- vert voorstoep geinitialiseerd op 31
constant w: integer := 12;			-- breedte van de "inzet" 11
constant h: integer := 16;			-- hoogte van de "inzet"16
signal C1,C2,C3,C4,C5,C6,C7,C8,R3,R2,R1,R0: integer;	-- coördinaten linkerbovenhoek "inzet"
signal rom_addr: integer := 0;	-- rij in rom 	         	(vc - vbp - R1)
signal rom_pix: integer := 0;		-- bit in rij in rom		(hc - hbp - C1)	
signal spriteon: std_logic;		-- huidige locatie (vc,hc) in gebied voor "inzet"
signal R,G,B: std_logic;			-- kleursignalen

signal visible : std_logic := '0';
signal hc_int,vc_int : integer := 0;
signal char : integer;
signal seg : std_logic_vector(1 downto 0) := "00";

signal des1,des2,des3,des4,des5,des6,des7,des8 : integer;
signal splittoken : integer;

constant letter_a : integer := 11;
constant letter_c : integer := 12;
constant letter_d : integer := 13;
constant letter_e : integer := 14;
constant letter_h : integer := 15;
constant letter_i : integer := 16;
constant letter_j : integer := 17;
constant letter_k : integer := 18;
constant letter_m : integer := 19;
constant letter_n : integer := 20;
constant letter_o : integer := 21;
constant letter_r : integer := 22;
constant letter_t : integer := 23;
constant letter_u : integer := 24;
constant letter_w : integer := 25;
constant dubbele_punt: integer := 26;
constant zero: integer := 27;
constant schuine_streep: integer := 28;
constant alarm : integer := 29;
Begin

	R3 <= 340;
	R2 <= 280;
	R1 <= 257;
	R0 <= 200;
		
		
	--Digits R1 : Uren/date/Chrono/...	
	C1 <= 128; --Uren tientallen
	C2 <= C1+16; --Uren eenheden
	C3 <= C2+16; --Dubbelepunt
	C4 <= C3+16; --Minuten tientallen
	C5 <= C4+16; --Minuten eenheden
	C6 <= C5+16; --Dubbelepunt
	C7 <= C6+16; --Seconden tientallen
	C8 <= C7+16; --Seconden eenheden
	
	process(clk)
	begin
		if rising_edge(clk) then
			hc_int <= conv_integer(hc);
			vc_int <= conv_integer(vc);
		end if;
	end process;
	
	
	process(clk)
	begin
	if rising_edge(clk) then
	--Geeft elke digit-plaats de bijbehorende letters (TIJD|DATUM|WEKKER|TIMER|CHRONO) met juiste 'splittoken' : of /
		case VSel is
			when "000" => --time_func
				des1 <= letter_t;
				des2 <= letter_i;
				des3 <= letter_j;
				des4 <= letter_d;
				des5 <= zero;
				des6 <= zero;
				des7 <= zero;
				des8 <= zero;
				splittoken <= dubbele_punt;
			when "001" => --date_func
				des1 <= letter_d;
				des2 <= letter_a;
				des3 <= letter_t;
				des4 <= letter_u;
				des5 <= letter_m;
				des6 <= zero;
				des7 <= zero;
				des8 <= zero;
				splittoken <= schuine_streep;
			when "010" => --alarm_clock_func
				des1 <= letter_w;
				des2 <= letter_e;
				des3 <= letter_k;
				des4 <= letter_k;
				des5 <= letter_e;
				des6 <= letter_r;
				des7 <= zero;
				des8 <= zero;
				splittoken <= dubbele_punt;
			when "011" => --timer_func
				des1 <= letter_t;
				des2 <= letter_i;
				des3 <= letter_m;
				des4 <= letter_e;
				des5 <= letter_r;
				des6 <= zero;
				des7 <= zero;
				des8 <= zero;
				splittoken <= dubbele_punt;
			when "100" => --Chrono
				des1 <= letter_c;
				des2 <= letter_h;
				des3 <= letter_r;
				des4 <= letter_o;
				des5 <= letter_n;
				des6 <= letter_o;
				des7 <= zero;
				des8 <= zero;
				splittoken <= dubbele_punt;
			when others =>
				des1 <= zero;
				des2 <= zero;
				des3 <= zero;
				des4 <= zero;
				des5 <= zero;
				des6 <= zero;
				des7 <= zero;
				des8 <= zero;
				splittoken <= dubbele_punt;
		end case;
		
	end if;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			if ((vc_int >= R0 + vbp) and (vc_int < R0 + vbp + h)) then		
				--TITEL
				--Haalt de juiste letters uit de ROM om de titel te vormen
				rom_addr <= vc_int - vbp - R0;
				if ((hc_int >= C1 + hbp -1) and (hc_int < C1 + hbp + w)) then
					char <= des1;
					rom_pix <= hc_int - hbp - C1;
				elsif ((hc_int >= C2 + hbp -1) and (hc_int < C2 + hbp + w)) then
					char <= des2;
					rom_pix <= hc_int - hbp - C2;
				elsif ((hc_int >= C3 + hbp -1) and (hc_int < C3 + hbp + w)) then
					char <= des3;
					rom_pix <= hc_int - hbp - C3;
				elsif ((hc_int >= C4 + hbp -1) and (hc_int < C4 + hbp + w)) then
					char <= des4;
					rom_pix <= hc_int - hbp - C4;
				elsif ((hc_int >= C5 + hbp -1) and (hc_int < C5 + hbp + w)) then
					char <= des5;
					rom_pix <= hc_int - hbp - C5;
				elsif ((hc_int >= C6 + hbp -1) and (hc_int < C6 + hbp + w)) then
					char <= des6;
					rom_pix <= hc_int - hbp - C6;
				elsif ((hc_int >= C7 + hbp -1) and (hc_int < C7 + hbp + w)) then
					char <= des7;
					rom_pix <= hc_int - hbp - C7;
				elsif ((hc_int >= C8 + hbp -1) and (hc_int < C8 + hbp + w)) then
					char <= des8;
					rom_pix <= hc_int - hbp - C8;
				else
					char <= zero;
				end if;
				
			
			elsif ((vc_int >= R1 + vbp) and (vc_int < R1 + vbp + h)) then
				--Rij 1: Tijd/datum/timer/Chrono/wekker - tijd
				--Haalt de tijd, meegegeven via d1->d8 uit de ROM om naar scherm te schrijven
				rom_addr <= vc_int - vbp - R1;
				if ((hc_int >= C1 + hbp -1) and (hc_int < C1 + hbp + w)) then
					char <= conv_integer(d1);
					rom_pix <= hc_int - hbp - C1;
					seg <= "01";
				elsif ((hc_int >= C2 + hbp -1) and (hc_int < C2 + hbp + w)) then
					char <= conv_integer(d2);
					rom_pix <= hc_int - hbp - C2;
					seg <= "01";
				elsif ((hc_int >= C3 + hbp -1) and (hc_int < C3 + hbp + w)) then
					char <= splittoken;
					rom_pix <= hc_int - hbp - C3;
					seg <= "00";
				elsif ((hc_int >= C4 + hbp -1) and (hc_int < C4 + hbp + w)) then
					char <= conv_integer(d4);
					rom_pix <= hc_int - hbp - C4;
					seg <= "10";
				elsif ((hc_int >= C5 + hbp -1) and (hc_int < C5 + hbp + w)) then
					char <= conv_integer(d5);
					rom_pix <= hc_int - hbp - C5;
					seg <= "10";
				elsif ((hc_int >= C6 + hbp -1) and (hc_int < C6 + hbp + w)) then
					if (VSel = "010") then
						char <= zero;
					else
						char <= splittoken;
					end if;
					rom_pix <= hc_int - hbp - C6;
					seg <= "00";
				elsif ((hc_int >= C7 + hbp -1) and (hc_int < C7 + hbp + w)) then
					if (VSel = "010") then
						char <= zero;
					else
						char <= conv_integer(d7);
					end if;
					rom_pix <= hc_int - hbp - C7;
					seg <= "11";
				elsif ((hc_int >= C8 + hbp -1) and (hc_int < C8 + hbp + w)) then
					if (VSel = "010") then
						char <= zero;
					else
						char <= conv_integer(d8);
					end if;
					rom_pix <= hc_int - hbp - C8;
					seg <= "11";
				else
					char <= zero;
				end if;
			
			elsif ((vc_int >= R2 + vbp) and (vc_int < R2 + vbp + h)) then
				--Rij 1
				--alarm_clock:Aan/uit
				--Haalt ofwel 'aan' ofwel 'uit' uit de ROM om te laten zien of de wekker aan staat
				--Chrono:Freeze
				--Haalt de freeze-tijd uit de ROM
				rom_addr <= vc_int - vbp - R2;
				if ((hc_int >= C1 + hbp -1) and (hc_int < C1 + hbp + w)) then
					if (VSel = "100") then
						char <= conv_integer(ftM);
					elsif (VSEL = "010") then
						if Wac = '1' then
							char <= letter_a;
						else
							char <= letter_u;
						end if;
					else
						char <= zero;
					end if;
					rom_pix <= hc_int - hbp - C1;
				elsif ((hc_int >= C2 + hbp -1) and (hc_int < C2 + hbp + w)) then
					if (VSel = "100") then
						char <= conv_integer(feM);
					elsif (VSEL = "010") then
						if Wac = '1' then
							char <= letter_a;
						else
							char <= letter_i;
						end if;
					else
						char <= zero;
					end if;
					rom_pix <= hc_int - hbp - C2;
				elsif ((hc_int >= C3 + hbp -1) and (hc_int < C3 + hbp + w)) then
					if (VSel = "100") then
						char <= splittoken;
					elsif (VSEL = "010") then
						if Wac = '1' then
							char <= letter_n;
						else
							char <= letter_t;
						end if;
					else
						char <= zero;
					end if;
					rom_pix <= hc_int - hbp - C3;
				elsif ((hc_int >= C4 + hbp -1) and (hc_int < C4 + hbp + w)) then
					if (VSel = "100") then
						char <= conv_integer(ftS);
					else
						char <= zero;
					end if;
					rom_pix <= hc_int - hbp - C4;
				elsif ((hc_int >= C5 + hbp -1) and (hc_int < C5 + hbp + w)) then
					If (VSel = "100") then
						char <= conv_integer(feS);
					else
						char <= zero;
					end if;
					rom_pix <= hc_int - hbp - C5;
				elsif ((hc_int >= C6 + hbp -1) and (hc_int < C6 + hbp + w)) then
					if (Vsel = "100") then
						char <= splittoken;
					else
						char <= zero;
					end if;
					rom_pix <= hc_int - hbp - C6;
				elsif ((hc_int >= C7 + hbp -1) and (hc_int < C7 + hbp + w)) then
					if (VSel = "100") then
						char <= conv_integer(ftH);
					else
						char <= zero;
					end if;
					rom_pix <= hc_int - hbp - C7;
				elsif ((hc_int >= C8 + hbp -1) and (hc_int < C8 + hbp + w)) then
					if (VSel = "100") then
						char <= conv_integer(feH);
					else
						char <= zero;
					end if;
					rom_pix <= hc_int - hbp - C8;
				else
					char <= zero;
				end if;
				
				
			
			elsif ((vc_int >= R3 + vbp) and (vc_int < R3 + vbp + h)) then
				--Rij 1
				--alarm_clock-alarm
				--Haalt het alarm icoontje uit de ROM indien wekker alarm afgaat.
				rom_addr <= vc_int - vbp - R3;
				if ((hc_int >= C1 + hbp -1) and (hc_int < C1 + hbp + w)) then
					char <= alarm;
					rom_pix <= hc_int - hbp - C1;
				else
					char <= zero;
				end if;
			end if;
		end if;
	end process;
	
	process(clk)
	begin
	if rising_edge(clk) then
	--Zet de gegeven 'char' van bovenstaand process om naar juiste addr waarde ROM
		case char is
		
		when 0 =>
			rom_addr4 <= conv_std_logic_vector(x"00",5) & conv_std_logic_vector(rom_addr,4);
		when 1 =>
			rom_addr4 <= conv_std_logic_vector(x"01",5) & conv_std_logic_vector(rom_addr,4);
		when 2 => 
			rom_addr4 <= conv_std_logic_vector(x"02",5) & conv_std_logic_vector(rom_addr,4);
		when 3 =>
			rom_addr4 <= conv_std_logic_vector(x"03",5) & conv_std_logic_vector(rom_addr,4);
		when 4 =>
			rom_addr4 <= conv_std_logic_vector(x"04",5) & conv_std_logic_vector(rom_addr,4);
		when 5 =>
			rom_addr4 <= conv_std_logic_vector(x"05",5) & conv_std_logic_vector(rom_addr,4);
		when 6 =>
			rom_addr4 <= conv_std_logic_vector(x"06",5) & conv_std_logic_vector(rom_addr,4);
		when 7 =>
			rom_addr4 <= conv_std_logic_vector(x"07",5) & conv_std_logic_vector(rom_addr,4);
		when 8 =>
			rom_addr4 <= conv_std_logic_vector(x"08",5) & conv_std_logic_vector(rom_addr,4);
		when 9 =>
			rom_addr4 <= conv_std_logic_vector(x"09",5) & conv_std_logic_vector(rom_addr,4);
		when zero =>
			rom_addr4 <= conv_std_logic_vector(x"0a",5) & conv_std_logic_vector(rom_addr,4);
		when letter_a =>
			rom_addr4 <= conv_std_logic_vector(x"0b",5) & conv_std_logic_vector(rom_addr,4);
		when letter_c =>
			rom_addr4 <= conv_std_logic_vector(x"0c",5) & conv_std_logic_vector(rom_addr,4);
		when letter_d =>
			rom_addr4 <= conv_std_logic_vector(x"0d",5) & conv_std_logic_vector(rom_addr,4);
		when letter_e => 
			rom_addr4 <= conv_std_logic_vector(x"0e",5) & conv_std_logic_vector(rom_addr,4);
		when letter_h =>
			rom_addr4 <= conv_std_logic_vector(x"0f",5) & conv_std_logic_vector(rom_addr,4);
		when letter_i =>
			rom_addr4 <= conv_std_logic_vector(x"10",5) & conv_std_logic_vector(rom_addr,4);
		when letter_j =>
			rom_addr4 <= conv_std_logic_vector(x"11",5) & conv_std_logic_vector(rom_addr,4);
		when letter_k =>
			rom_addr4 <= conv_std_logic_vector(x"12",5) & conv_std_logic_vector(rom_addr,4);
		when letter_m =>
			rom_addr4 <= conv_std_logic_vector(x"13",5) & conv_std_logic_vector(rom_addr,4);
		when letter_n =>
			rom_addr4 <= conv_std_logic_vector(x"14",5) & conv_std_logic_vector(rom_addr,4);
		when letter_o =>
			rom_addr4 <= conv_std_logic_vector(x"15",5) & conv_std_logic_vector(rom_addr,4);
		when letter_r =>
			rom_addr4 <= conv_std_logic_vector(x"16",5) & conv_std_logic_vector(rom_addr,4);
		when letter_t =>
			rom_addr4 <= conv_std_logic_vector(x"17",5) & conv_std_logic_vector(rom_addr,4);
		when letter_u =>
			rom_addr4 <= conv_std_logic_vector(x"18",5) & conv_std_logic_vector(rom_addr,4);
		when letter_w =>
			rom_addr4 <= conv_std_logic_vector(x"19",5) & conv_std_logic_vector(rom_addr,4);
		when dubbele_punt =>
			rom_addr4 <= conv_std_logic_vector(x"1a",5) & conv_std_logic_vector(rom_addr,4);
		when schuine_streep =>
			rom_addr4 <= conv_std_logic_vector(x"1b",5) & conv_std_logic_vector(rom_addr,4);
		when alarm =>
			rom_addr4 <= conv_std_logic_vector(x"12",5) & conv_std_logic_vector(rom_addr,4);
		when others =>
			rom_addr4 <= conv_std_logic_vector(x"0a",5) & conv_std_logic_vector(rom_addr,4);
		end case;
	end if;
	end process;
	
	--rom_addr4 <= conv_std_logic_vector(x"30"+rom_addr,9);
	process (clk) 
	begin
	--Laat het std_logic signaal 'knipperen' op een frequentie van 4Hz
		if rising_edge(clk) then
			if clk4Hz = '1' then
				visible <= not visible;
			end if;
		end if;
	end process;
	
	process (clk)
	begin
		if rising_edge(clk) then
			if ((vc_int >= R3 + vbp) and (vc_int < R3 + vbp + h)) then
				--R3
				if Alac='1' then
					spriteon <= '1';
				else
					spriteon <= '0';
				end if;
			elsif ((vc_int >= R2 + vbp) and (vc_int < R2 + vbp + h)) then
				--R2
				if VSegSel = "11" and VSel = "010" then
					spriteon <= visible;
				else
					spriteon <= '1';
				end if;
				
			elsif ((vc_int >= R1 + vbp) and (vc_int < R1 + vbp + h)) then
				--R1
				if (VSegSel = seg and seg /= "00") then
					spriteon <= visible;
				else
					spriteon <= '1';
				end if;
			elsif ((vc_int >= R0 + vbp) and (vc_int < R0 + vbp + h)) then
				--R0
				spriteon <= '1';
			else
				spriteon <= '0';
			end if;
		end if;
	end process;
	
	
	process (clk)							
	variable j : integer;
	begin
		
		if rising_edge(clk) then
		
			if spriteon = '1' and vidon = '1' then
			--Indien er iets op het scherm getoond moet worden op 'huidige locatie'
				j := conv_integer(rom_pix);
				R <= M(j);
				G <= M(j);
				B <= M(j);
			else
				R <= '0';
				G <= '0';
				B <= '0';
			end if;
			
			red <= R & R & R;
			green <= G & G & G;
			blue <= B & B;
			
		end if;
	end process;
end vga_initials;