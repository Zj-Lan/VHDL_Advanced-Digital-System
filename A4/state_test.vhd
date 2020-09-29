library ieee; use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY State_test IS 
	PORT( clock, reset,odd_noteven, write_l : IN STD_LOGIC; 
			Datain : IN std_logic_vector (7 downto 0);
			state, n_state : buffer std_logic_vector (2 downto 0);
			T, B : buffer std_logic_vector (5 downto 0);
			busy, TxData : OUT STD_LOGIC
			); 
END State_test; 

ARCHITECTURE RTL OF State_test IS
	constant CLKSPERBIT : integer := 18;
	constant	BITSPERCHAR : integer := 11;
	--signal BT : integer range 0 to 18;
	--signal BC : integer range 0 to 11;
	signal BT : integer :=16;
	signal BC : integer :=11;
	signal SR : std_logic_vector (10 downto 0);
	signal parity : std_logic;
	
	signal BT_n : integer :=0;
	signal BC_n : integer :=0;
	
	
-- Declare a state type
type state_type is (IDLE, S1);
-- Declare current and next state variables .
-- Init to NS_GREEN since we don ’t have a reset state .
signal current_state , next_state : state_type := IDLE ;
BEGIN
process ( clock )
begin
	if (clock'event and clock='1') then
		if (reset = '1') then
		current_state <= IDLE ;
		else
		current_state <= next_state ;
		end if; 
	end if ;
end process ;
-- Process to determine next state

process ( current_state, write_l, BT, BC)
begin
	case (current_state) is
		when IDLE => if (write_l = '1') then 
								next_state <= S1; 
						else next_state <= IDLE;
						end if;
						
		when S1 => if (BT = 0) then 
							next_state <= IDLE;  
						else next_state <= S1;
						end if;
end case ;
end process ;
-- Conditional assignments for outputs:
process (current_state)
begin 
	case (current_state) is
	when IDLE => 
		BT <= CLKSPERBIT - 2;
		
	When S1 =>
		BT <= BT -1;
		--if (BT_n = 0) then
		--	BT	<=0; 
		--end if;

	end case;
end process;

TxData <= SR(0);

state <= "001"	when (Current_state = IDLE ) else
			"010"	when (Current_state = S1) else
		--	"011"	when (Current_state = S2) else
		--	"100"	when (Current_state = S3) else 
			"111";
B<= std_logic_vector(to_unsigned(BT, 6));
END RTL ;
