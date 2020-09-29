library ieee;
use ieee.std_logic_1164.all;

entity Robot is
	port (clk	:	in std_logic;
			S1S2	:	in std_logic_vector(1 downto 0);
			Z1Z2	:	out std_logic_vector(1 downto 0));
end Robot;

architecture design of Robot is

type state_type is (A, B, C, D);
signal state: state_type := A;

begin
process ( S1S2, clk)
begin
if (clk'event and clk='1') then
	case state is
		when A =>
			if S1S2 = "00" then
				state <= A;
			elsif S1S2 = "01" then
				state <= B;
			elsif S1S2 = "10" then
				state <= D;
			end if;
			
		when B =>
			if S1S2 = "00" then
				state <= C;
			elsif S1S2 = "01" then
				state <= B;
			elsif S1S2 = "10" then
				state <= D;
			elsif S1S2 = "11" then
				state <= B;
			end if;
				
		when C =>
			if S1S2 = "00" then
				state <= C;
			elsif S1S2 = "01" then
				state <= B;
			elsif S1S2 = "10" then
				state <= D;
			end if;
			
		when D =>
			if S1S2 = "00" then
				state <= A;
			elsif S1S2 = "10" then
				state <= D;
			elsif S1S2 = "11" then
				state <= B;
			end if;
	end case ;
end if;
end process ;

Z1Z2 <= "01" when state = B else
		"10" when state = D else
		"11" when state = A or state = C else
		"00";

end design;