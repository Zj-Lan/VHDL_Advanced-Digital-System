--student name: ZHIJIE LAN
--student number: 201990309
--timer module

library ieee ;
use ieee . std_logic_1164 . all ;

ENTITY timetest IS
	PORT ( Clk: in std_logic ;
			Pulse: out std_logic);
END timetest;

ARCHITECTURE design_timetest OF timetest IS
signal pul: std_logic :='0';
begin
	process(Clk)
	variable a : integer := 0;
--	variable b : integer := 0;
	begin
	
		if (clk'event and clk='1') then
			a:=a+1;
			if (a<=20/2) then
				pul <= '0';
			elsif (a>20/2 and a<20) then
				pul <= '1';
			else
				a:=0;
				
			end if;
			
		end if;	
	end process;
pulse<=pul;
END design_timetest;
