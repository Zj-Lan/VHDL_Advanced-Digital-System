----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    10:08:59 02/23/2012 
-- Module Name:    besturing - Behavioral 
-- Project Name: Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity besturing is
    Port ( sel : in  std_logic;
			  moden : in std_logic;
			  clk25MHz : in STD_LOGIC;
			  secEn : in STD_LOGIC;			  
			  minEn : in STD_LOGIC;
			  hrEn : in STD_LOGIC;
			  inc : in STD_LOGIC;
			  dec : in STD_LOGIC;
			  t_sEn : out STD_LOGIC;
			  t_mEn : out STD_LOGIC;
			  t_uEn : out STD_LOGIC;
			  t_down : out STD_LOGIC;
			  t_clr : out STD_LOGIC;
			  S : out std_logic_vector(1 downto 0)
			  );
end besturing;

architecture Behavioral of besturing is


type state is (state0,state1,state2,state3);
signal next_state: state;
signal present_state : state := state0;

signal selectie : integer range 0 to 3 := 0;


signal t_sEn_int : std_logic := '0';
signal t_mEn_int : std_logic := '0';
signal t_uEn_int : std_logic := '0';

signal t_down_int : std_logic := '0';
signal t_clr_int : std_logic := '0';


begin


process (clk25MHz)
	begin
	if rising_edge(clk25MHz) then
		if moden = '1' then
			if sel = '1' then
				present_state <= next_state;
			end if;
		else
			present_state <= state0;
		end if;
	end if;
end process;


process (clk25MHz) --Next-States
begin
	if rising_edge(clk25MHz) then
		case present_state is
			when state0 =>
				next_state <= state1;
			when state1 =>
				next_state <= state2;
			when state2 =>
				next_state <= state3;
			when others =>
				next_state <= state0;
		end case;
	end if;
end process;



process (clk25MHz) --Outputs
begin
	if rising_edge(clk25MHz) then
		case present_state is
			when state1 => --Uren aan het instellen
				t_sEn_int <= '0';
				t_mEn_int <= '0';
				t_uEn_int <= (inc or dec);
				t_down_int <= dec;
				t_clr_int <= '0';		
				selectie <= 1;
			when state2 => --Minuten aan het instellen
				t_sEn_int <= '0';
				t_mEn_int <= (inc or dec);
				t_uEn_int <= '0';
				t_down_int <= dec;
				t_clr_int <= '0';
				selectie <= 2;
			when state3 => --Seconden aan het instellen
				t_sEn_int <= '0';
				t_mEn_int <= '0';
				t_uEn_int <= '0';
				t_down_int <= dec;
				t_clr_int <= inc or dec;
				selectie <= 3;
			when others => --Niet aan het instellen
				t_sEn_int <= secEn;
				t_mEn_int <= minEn;
				t_uEn_int <= hrEn;
				t_down_int <= '0';
				t_clr_int <= '0';
				selectie <= 0;
		end case;
	end if;
end process;

t_sEn <= t_sEn_int;
t_mEn <= t_mEn_int;
t_uEn <= t_uEn_int;
t_down <= t_down_int;
t_clr <= t_clr_int;
S <= std_logic_vector(to_unsigned(selectie,2));

end Behavioral;