--student name: ZHIJIE LAN
--student number: 201990309
--timer module

library ieee ;
use ieee . std_logic_1164 . all ;

ENTITY timer IS
	PORT ( Clk , Reset : in std_logic ;
			Pulse: out std_logic);
END timer;

ARCHITECTURE design_timer OF timer IS
begin
	process(Clk)
	begin
	
		if Reset = '1' then
			Pulse <= '0';
		else
			Pulse <= Clk;
		end if;	
	end process;
END design_timer;

