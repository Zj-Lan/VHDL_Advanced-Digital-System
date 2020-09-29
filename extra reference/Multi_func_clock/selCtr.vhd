----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Kaj Van der Hallen
-- 
-- Create Date:    10:15:48 02/23/2012 
-- Module Name:    selCtr - Behavioral 
-- Project Name: Multifunctionele klok
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity selCtr is
    Port ( clk25MHz : in STD_LOGIC;
			  moden : in STD_LOGIC;
			  sel : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (1 downto 0));
end selCtr;

architecture Behavioral of selCtr is

type state is (state0,state1,state2,state3);
signal next_state: state;
signal present_state : state := state0;
signal previous_sel : std_logic := '0'; --Vorige toestand van de sel-ingang (flankdetectie)

signal selectie : integer range 0 to 3 := 0;
begin

process (clk25MHz)
	begin
	if rising_edge(clk25MHz) then
	
		if sel = '1' and previous_sel = '0' then
			--Selectieknop wordt ingedrukt en was bij vorige klokpuls nog niet ingedrukt
			previous_sel <= '1';
			
			if moden = '0' then
				present_state <= state0;
			else
				present_state <= next_state;
			end if;
			
		elsif sel = '0' then
			previous_sel <= '0';
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
			when state0 => --time_func
				selectie <= 0;
			when state1 => --date_func
				selectie <= 1;
			when state2 => --alarm_clock_func
				selectie <= 2;
			when state3 => --timer_func
				selectie <= 3;
			when others =>
				selectie <= 0;
		end case;
	end if;
end process;


S <= std_logic_vector(to_unsigned(selectie,2));
end Behavioral;