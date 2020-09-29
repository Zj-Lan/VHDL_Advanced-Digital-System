----------------------------------------------------------------------------------
-- Company: Artesis
-- Engineer: Michael Deboeure
-- Module Name:    	Keuze_Uitgang_VGA - Behavioral
-- Project Name: 	Weergave_Module
-- Target Devices: FPGA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Keuze_Uitgang_VGA is
Port	(	klok25MHz : in std_logic;
			sel: in std_logic_vector (2 downto 0);
			-- time_func
			t_eS : in std_logic_vector (3 downto 0);
			t_tS : in std_logic_vector (3 downto 0);
			t_eM : in std_logic_vector (3 downto 0);
			t_tM : in std_logic_vector (3 downto 0);
			t_eU : in std_logic_vector (3 downto 0);
			t_tU : in std_logic_vector (3 downto 0);
			-- date_func
			d_eD : in std_logic_vector (3 downto 0);
			d_tD : in std_logic_vector (3 downto 0);
			d_eM : in std_logic_vector (3 downto 0);
			d_tM : in std_logic_vector (3 downto 0);
			d_eJ : in std_logic_vector (3 downto 0);
			d_tJ : in std_logic_vector (3 downto 0);
			-- alarm_clock_func
			w_eM : in std_logic_vector (3 downto 0);
			w_tM : in std_logic_vector (3 downto 0);
			w_eU : in std_logic_vector (3 downto 0);
			w_tU : in std_logic_vector (3 downto 0);
			-- timer_func
			Ti_eS : in std_logic_vector (3 downto 0);
			Ti_tS : in std_logic_vector (3 downto 0);
			Ti_eM : in std_logic_vector (3 downto 0);
			Ti_tM : in std_logic_vector (3 downto 0);
			Ti_eU : in std_logic_vector (3 downto 0);
			Ti_tU : in std_logic_vector (3 downto 0);
			-- chronometer_func
			c_eH : in std_logic_vector (3 downto 0);
			c_tH : in std_logic_vector (3 downto 0);
			c_eS : in std_logic_vector (3 downto 0);
			c_tS : in std_logic_vector (3 downto 0);
			c_eM : in std_logic_vector (3 downto 0);
			c_tM : in std_logic_vector (3 downto 0);
			l_eH : in std_logic_vector (3 downto 0);
			l_tH : in std_logic_vector (3 downto 0);
			l_eS : in std_logic_vector (3 downto 0);
			l_tS : in std_logic_vector (3 downto 0);
			l_eM : in std_logic_vector (3 downto 0);
			l_tM : in std_logic_vector (3 downto 0);
			-- VGAscherm
			V_t1 : out std_logic_vector (3 downto 0); -- X0:00:00
			V_e1 : out std_logic_vector (3 downto 0); -- 0X:00:00
			V_t2 : out std_logic_vector (3 downto 0); -- 00:X0:00
			V_e2 : out std_logic_vector (3 downto 0); -- 00:0X:00
			V_t3 : out std_logic_vector (3 downto 0); -- 00:00:X0
			V_e3 : out std_logic_vector (3 downto 0)  -- 00:00:0X
			);
end Keuze_Uitgang_VGA;

architecture Behavioral of Keuze_Uitgang_VGA is

begin

keuze: Process(klok25MHz, sel)
	begin
		if rising_edge(klok25MHz) then
		
			case sel is
				when "000" => -- time_func
					V_t1 <= t_tU;
					V_e1 <= t_eU;
					V_t2 <= t_tM;
					V_e2 <= t_eM;
					V_t3 <= t_tS;
					V_e3 <= t_eS;
				when "001" => -- date_func
					V_t1 <= d_tD;
					V_e1 <= d_eD;
					V_t2 <= d_tM;
					V_e2 <= d_eM;
					V_t3 <= d_tJ;
					V_e3 <= d_eJ;
				when "010" => -- alarm_clock_func
					V_t1 <= w_tU;
					V_e1 <= w_eU;
					V_t2 <= w_tM;
					V_e2 <= w_eM;
					V_t3 <= "0000";
					V_e3 <= "0000";
				when "011" => -- timer_func
					V_t1 <= Ti_tU;
					V_e1 <= Ti_eU;
					V_t2 <= Ti_tM;
					V_e2 <= Ti_eM;
					V_t3 <= Ti_tS;
					V_e3 <= Ti_eS;
				when "100" => -- Chronofunctie (tijd)
					V_t1 <= c_tM;
					V_e1 <= c_eM;
					V_t2 <= c_tS;
					V_e2 <= c_eS;
					V_t3 <= c_tH;
					V_e3 <= c_eH;
				when "101" => -- Chronofunctie (laptijd)
					V_t1 <= l_tM;
					V_e1 <= l_eM;
					V_t2 <= l_tS;
					V_e2 <= l_eS;
					V_t3 <= l_tH;
					V_e3 <= l_eH;
				when others => --Default
					V_t1 <= "0000";
					V_e1 <= "0000";
					V_t2 <= "0000";
					V_e2 <= "0000";
					V_t3 <= "0000";
					V_e3 <= "0000";
			end case;
		end if; --Einde rising edge
		
	end process keuze;

end Behavioral;
