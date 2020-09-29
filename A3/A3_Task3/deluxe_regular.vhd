library ieee; use ieee.std_logic_1164.all;

ENTITY Deluxe_Regular IS 
	PORT( clk, token_1, token_2 : IN STD_LOGIC;
			soap, water, brush : OUT STD_LOGIC); 
END Deluxe_Regular; 

ARCHITECTURE design OF Deluxe_Regular IS
component counter5bit is
	port ( clk , rst : in std_logic ;
	q: out std_logic_vector (4 downto 0) );
end component;

signal start_timer, time_10sec, time_20sec, time_30sec: std_logic;
signal q_out : std_logic_vector (4 downto 0);

-- Declare a state type
type state_type is (Initial, s11, s12, s13, 
							s21, s22, s23, s24, s25, s26);

-- Declare current and next state variables .
signal current_state , next_state : state_type := Initial;

BEGIN

t0 : counter5bit port map ( clk , start_timer , q_out );

time_10sec <= q_out (3) and q_out (1);
time_20sec <= q_out (4) and q_out (2);
time_30sec <= q_out (4) and q_out (3) and q_out (2) and q_out (1);

process ( clk )
begin
	if (clk'event and clk='1') then
			current_state <= next_state ;
	end if ;
end process ;
-- Process to determine next state

process ( current_state, time_10sec, time_20sec, time_30sec)
begin
	case current_state is
		when Initial =>
			if (token_2 = '1') then
				next_state <= s21 ;
			elsif (token_1 = '1') then
				next_state <= s11 ;
			else
				next_state <= current_state;
			end if ;

		when s11 =>
			if (time_10sec = '1') then
				next_state <= s12 ;
			else
				next_state <= current_state;
			end if ;
			
		when s12 =>
			if (time_20sec = '1') then
				next_state <= s13 ;
			else
				next_state <= current_state;
			end if ;
			
		when s13 =>
			if (time_10sec = '1') then
				next_state <= Initial ;
			else
				next_state <= current_state;
			end if ;
			
		when s21 =>
			if (time_10sec = '1') then
				next_state <= s22 ;
			else
				next_state <= current_state;
			end if ;
			
		when s22 =>
			if (time_10sec = '1') then
				next_state <= s23 ;
			else
				next_state <= current_state;
			end if ;
		
		when s23 =>
			if (time_10sec = '1') then
				next_state <= s24 ;
			else
				next_state <= current_state;
			end if ;
			
		when s24 =>
			if (time_20sec = '1') then
				next_state <= s25 ;
			else
				next_state <= current_state;
			end if ;
			
		when s25 =>
			if (time_30sec = '1') then
				next_state <= s26 ;
			else
				next_state <= current_state;
			end if ;
			
		when s26 =>
			if (time_10sec = '1') then
				next_state <= Initial ;
			else
				next_state <= current_state;
			end if ;
			
end case ;
end process ;

-- Conditional assignments for outputs:
soap 	<= '1' when	((current_state = s22) or (current_state = s23)) else '0';

water <= '1' when ((current_state = s11) or (current_state = s12) 
						or (current_state = s21) or (current_state = s25)) else '0';
						
brush <= '1' when ((current_state = s12) or (current_state = s13) 
						or (current_state = s23) or (current_state = s24)  
						or (current_state = s25) or (current_state = s26)) else '0';

start_timer <= '1' when (current_state /= next_state)	else '0';

END design ;
