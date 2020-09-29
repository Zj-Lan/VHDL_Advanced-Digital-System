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
signal pul : std_logic := '0';
begin
	process(Clk)
	begin
	
		if Reset = '1' then
			Pul <= '0';
		elsif (clk'event and clk = '0') then
			pul <= not pul;
		end if;	
	end process;
pulse <= pul;
END design_timer;
