library ieee; use ieee.std_logic_1164.all;

ENTITY regular IS 
	PORT( clk, token_1 : IN STD_LOGIC;
			water, brush : OUT STD_LOGIC); 
END regular; 

ARCHITECTURE design OF regular IS
component counter5bit is
	port ( clk , rst : in std_logic ;
	q: out std_logic_vector (4 downto 0) );
end component;

signal start_timer, time_10sec, time_20sec: std_logic;
signal q_out : std_logic_vector (4 downto 0);

-- Declare a state type
type state_type is (Initial, W10s, WB20s, B10s);

-- Declare current and next state variables .
signal current_state , next_state : state_type := Initial;

BEGIN

t0 : counter5bit port map ( clk , start_timer , q_out );

time_10sec <= q_out (3) and q_out (1);
time_20sec <= q_out (4) and q_out (2);

process ( clk )
begin
	if (clk'event and clk='1') then
			current_state <= next_state ;
	end if ;
end process ;
-- Process to determine next state

process ( current_state, time_10sec, time_20sec)
begin
	case current_state is
		when Initial =>
			if (token_1 = '1') then
				next_state <= W10s ;
			else
				next_state <= current_state;
			end if ;

		when W10s =>
			if (time_10sec = '1') then
				next_state <= WB20s ;
			else
				next_state <= current_state;
			end if ;
			
		when WB20s =>
			if (time_20sec = '1') then
				next_state <= B10s ;
			else
				next_state <= current_state;
			end if ;
			
		when B10s =>
			if (time_10sec = '1') then
				next_state <= Initial ;
			else
				next_state <= current_state;
			end if ;
			
end case ;
end process ;

-- Conditional assignments for outputs:
water <= '1' when ((current_state = W10s) or (current_state = WB20s)) else '0';
brush <= '1' when ((current_state = B10s) or (current_state = WB20s)) else '0';

start_timer <= '1' when (current_state /= next_state)	else '0';

END design ;
