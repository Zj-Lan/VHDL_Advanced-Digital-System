--student name: ZHIJIE LAN
--student number: 201990309
--timer module

library ieee ;
use ieee . std_logic_1164 . all ;
USE ieee.numeric_std.all;

ENTITY second IS
	PORT ( Clock : in std_logic ;
				Temp : in std_logic_vector(7 downto 0); 
			pulse: out std_logic;
			test: out std_logic_vector(7 downto 0);
			rate: out integer);
END second;

ARCHITECTURE design_second OF second IS
shared variable TempRate, currentTemp, lastTemp : integer :=0;
--signal pul: std_logic := '0';

begin
	process ( Clock )
	variable s1 : integer := 0;
	variable s2 : integer := 0;
	begin
		if (Clock'event and Clock='1') then
				s1 := s1 + 1;
				test<="00000001";
				--devide 32768 to 256*128
				if (s1 > 5) then 
					s2:= s2+1;
					test<="00000010";
					if(s2>2 and s2<4) then
					test<="00000100";
						lastTemp := currentTemp;
						currentTemp := to_integer(signed(Temp));
						TempRate := currentTemp - lastTemp;
						pulse <= '1';
					elsif (s2>=4)then
					test<="00001000";
						lastTemp := currentTemp;
						currentTemp := to_integer(signed(Temp));
						TempRate := currentTemp - lastTemp;
						pulse <= '0';
						S2:=0;
					end if;
					test<="00010000";
					s1:=0;
				end if;
		end if;
	end process ;
	
--pulse <= pul;
--rate <= TempRate;
	
END design_second;

