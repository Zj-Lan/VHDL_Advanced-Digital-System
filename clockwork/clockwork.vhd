library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity clockwork is
port (
		clk1 		: in std_logic;
		switch	: in std_logic := '1';
		mode		: in std_logic := '1';
		increase : in std_logic := '1';
		ring		: out std_logic;
		ampm		: out std_logic;
		s1,s2, m1, m2, h1, h2 : out std_logic_vector(4 downto 0);
      display1	: out std_logic_vector(6 downto 0);
      display2	: out std_logic_vector(6 downto 0);
		display3	: out std_logic_vector(6 downto 0);
		display4	: out std_logic_vector(6 downto 0);
		display5	: out std_logic_vector(6 downto 0);
		display6	: out std_logic_vector(6 downto 0)
     );
end clockwork;

architecture Behavioral of clockwork is
	type states is (clock, clockmin, clockhour, chrono, start, stop, alarm, alarmmin, alarmhour);
	signal state			: states := clock;
	signal sec1				: integer := 0;
	signal sec2				: integer := 0;
	signal min1 			: integer := 0;
	signal min2 			: integer := 0;
	signal hour1 			: integer := 0;
	signal hour2 			: integer := 0;
	signal adig1			: integer := 0;
	signal adig2 			: integer := 0;
	signal adig3 			: integer := 0;
	signal adig4 			: integer := 0;
	signal cdig1			: integer := 0;
	signal cdig2 			: integer := 0;
	signal cdig3 			: integer := 0;
	signal cdig4 			: integer := 0;
	signal chrdig1			: integer := 0;
	signal chrdig2			: integer := 0;
	signal chrdig3			: integer := 0;
	signal chrdig4			: integer := 0;
	signal chrdig5			: integer := 0;
	signal chrdig6			: integer := 0;
	signal changemin		: std_logic := '0';
	signal changehour		: std_logic := '0';
	signal achangemin		: std_logic := '0';
	signal achangehour	: std_logic := '0';
	signal chronometer	: std_logic := '0';
	signal clock1			: std_logic_vector(6 downto 0);
	signal clock2			: std_logic_vector(6 downto 0);
	signal clock3			: std_logic_vector(6 downto 0);
	signal clock4			: std_logic_vector(6 downto 0);
	signal clock5			: std_logic_vector(6 downto 0);
	signal clock6			: std_logic_vector(6 downto 0);
	signal change1			: std_logic_vector(6 downto 0);
	signal change2			: std_logic_vector(6 downto 0);
	signal change3			: std_logic_vector(6 downto 0);
	signal change4			: std_logic_vector(6 downto 0);
	signal chrono1			: std_logic_vector(6 downto 0);
	signal chrono2			: std_logic_vector(6 downto 0);
	signal chrono3			: std_logic_vector(6 downto 0);
	signal chrono4			: std_logic_vector(6 downto 0);
	signal chrono5			: std_logic_vector(6 downto 0);
	signal chrono6			: std_logic_vector(6 downto 0);
	signal alarm1			: std_logic_vector(6 downto 0);
	signal alarm2			: std_logic_vector(6 downto 0);
	signal alarm3			: std_logic_vector(6 downto 0);
	signal alarm4			: std_logic_vector(6 downto 0);
	signal clk 				: std_logic :='0';
	signal chronoclk 		: std_logic :='0';
	
begin

	--states
	machine_inputs: process(chronoclk)
	begin
		if rising_edge(chronoclk) then
			case state is
				when clock =>
					if switch = '0' then
						state <= chrono;
					elsif mode <= '0' then
						state <= clockmin;
					else
						state <= clock;
					end if;
					
				when clockmin =>
					if mode = '0' then
						state <= clockhour;
					else
						state <= clockmin;
					end if;
					
				when clockhour =>
					if mode = '0' then
						state <= clock;
					else
						state <= clockhour;
					end if;
					
				when chrono =>
					if switch = '0' then
						state <= alarm;
					elsif mode = '0' then
						state <= start;
					else
						state <= chrono;
					end if;
					
				when start =>
					if mode = '0' then
						state <= stop;
					else
						state <= start;
					end if;
					
				when stop =>
					if mode = '0' then
						state <= chrono;
					else
						state <= stop;
					end if;
					
				when alarm =>
					if switch = '0' then
						state <= clock;
					elsif mode = '0' then
						state <= alarmmin;
					else
						state <= alarm;
					end if;
					
				when alarmmin =>
					if mode = '0' then
						state <= alarmhour;
					else
						state <= alarmmin;
					end if;
						
				when alarmhour =>
					if mode = '0' then
						state <= alarm;
					else
						state <= alarmhour;
					end if;
			end case;
		end if;
	end process machine_inputs;
	
	--state behavior
	machine_outputs: process(state, chronoclk)
	begin
		if rising_edge(chronoclk) then
			case state is
				when clock =>
					display1 <= clock1;
					display2 <= clock2;
					display3 <= clock3;
					display4 <= clock4;
					display5 <= clock5;
					display6 <= clock6;
					changemin <= '0';
					changehour <= '0';
				when clockmin =>
					display3 <= change1;
					display4 <= change2;
					display1 <= clock1;
					display2 <= clock2;
					display5 <= clock5;
					display6 <= clock6;
					changemin <= '1';
					changehour <= '0';
				when clockhour =>
					display5 <= change3;
					display6 <= change4;
					display1 <= clock1;
					display2 <= clock2;
					display3 <= clock3;
					display4 <= clock4;
					changehour <= '1';
					changemin <= '0';
				when chrono =>
					display1 <= "1000000";
					display2 <= "1000000";
					display3 <= "1000000";
					display4 <= "1000000";
					display5 <= "1000000";
					display6 <= "1000000";
				when start =>
					display1 <= chrono1;
					display2 <= chrono2;
					display3 <= chrono3;
					display4 <= chrono4;
					display5 <= chrono5;
					display6 <= chrono6;
					chronometer <= '1';
				when stop =>
					display1 <= chrono1;
					display2 <= chrono2;
					display3 <= chrono3;
					display4 <= chrono4;
					display5 <= chrono5;
					display6 <= chrono6;
					chronometer <= '0';
				when alarm =>
					display1 <= "1000000";
					display2 <= "1000000";
					display3 <= alarm1;
					display4 <= alarm2;
					display5 <= alarm3;
					display6 <= alarm4;
					achangemin <= '0';
					achangehour <= '0';
				when alarmmin =>
					display1 <= "1000000";
					display2 <= "1000000";
					display3 <= alarm1;
					display4 <= alarm2;
					display5 <= alarm3;
					display6 <= alarm4;
					achangemin <= '1';
					achangehour <= '0';
				when alarmhour =>
					display1 <= "1000000";
					display2 <= "1000000";
					display3 <= alarm1;
					display4 <= alarm2;
					display5 <= alarm3;
					display6 <= alarm4;
					achangehour <= '1';
					achangemin <= '0';
			end case;
		end if;
	end process machine_outputs;
	
	--clock and alarm
	clock_alarm: process(clk) --period of clk is 1 second.
	variable sec,min,hour 	: integer := 0;
	variable minC, hourC		: integer := 0;
	variable alarmH			: integer := 0;
	variable alarmM			: integer := 0;
	begin
		if(clk'event and clk='1') then
			if changemin = '1' then
				if increase = '0' then
					min := min + 1;
					cdig1 <= min/10;
					cdig2 <= min rem 10;
				end if;
			elsif changehour = '1' then
				if increase = '0' then
					hour := hour + 1;
					cdig3 <= hour/10;
					cdig4 <= hour rem 10;
				end if;
				min1 <= min/10;
				min2 <= min rem 10;
				hour1 <= hour/10;
				hour2 <= hour rem 10;
			end if;
			if(hour > 12) then
						ampm <= '1';
					else
						ampm <= '0';
					end if;
			if min = alarmM and hour = alarmH then
				ring <= '1';
			else
				ring <= '0';
			end if;
			sec := sec + 1;
			sec1 <= sec/10;
			sec2 <= sec rem 10;
			if(sec = 59) then
				sec	:= 0;
				min 	:= min + 1;
				min1 <= min/10;
				min2 <= min rem 10;
				if(min = 59) then
					hour 	:= hour + 1;
					min 	:= 0;
					hour1 <= hour/10;
					hour2 <= hour rem 10;
					if(hour = 23) then
						hour := 0;
					end if;
				end if;
			end if;
		end if;
		if(clk'event and clk='0') then
			if achangemin = '1' then
				if increase = '0' then
					alarmM := alarmM + 1;
					adig1 <= alarmM/10;
					adig2 <= alarmM rem 10;
				end if;
			elsif achangehour = '1' then
				if increase = '0' then
					alarmH := alarmH + 1;
					adig3 <= alarmH/10;
					adig4 <= alarmH rem 10;
				end if;
			end if;
		end if;
	end process clock_alarm;
	
	--chronometer
	chronos_time: process(chronoclk, clk, chronometer)
	variable mili,sec,min 	: integer := 0;
	begin
		if chronometer = '1' then
			if(chronoclk'event and chronoclk='1') then
				mili := mili + 1;
				chrdig1 <= mili/10;
				chrdig2 <= mili rem 10;
				if(mili = 99) then
					mili	:= 0;
				end if;
			end if;
			if(clk'event and clk='1') then
				sec 	:= sec + 1;
				chrdig3 <= sec/10;
				chrdig4 <= sec rem 10;
				if(sec = 59) then
					sec 	:= 0;
					min 	:= min + 1;
					chrdig5 <= min/10;
					chrdig6 <= min rem 10;
				end if;
			end if;
		else
			mili 		:= mili;
			sec		:= sec;
			min		:= min;
			chrdig1 	<= mili/10;
			chrdig2 	<= mili rem 10;
			chrdig3 	<= sec/10;
			chrdig4 	<= sec rem 10;
			chrdig5 	<= min/10;
			chrdig6 	<= min rem 10;
			if mode = '0' then
				mili		:= 0;
				sec		:= 0;
				min		:= 0;
				chrdig1 	<= mili/10;
				chrdig2 	<= mili rem 10;
				chrdig3 	<= sec/10;
				chrdig4 	<= sec rem 10;
				chrdig5 	<= min/10;
				chrdig6 	<= min rem 10;
			end if;
		end if;
	end process chronos_time;
	
	--clk generation.For 50 MHz clock this generates 1 Hz clock.
	clocking: process(clk1)
	variable count : integer := 1;
	begin
		if(clk1'event and clk1 = '1') then
			count := count + 1;
			--if(count = 25000000) then
				if (count = 10) then
				clk <= not clk;
				count := 1;
			end if;
		end if;
	end process clocking;
	
	--clk generation.For 50 MHz clock this generates 1000 Hz clock.
	chrono_clocking: process(clk1)
	variable count : integer := 1;
	begin
		if(clk1'event and clk1='1') then
			count := count + 1;
		--	if(count = 25000) then
			if (count = 2) then
				chronoclk <= not chronoclk;
				count := 1;
			end if;
		end if;
	end process chrono_clocking;

	--digits table:
	WITH sec1 SELECT
					clock2 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH sec2 SELECT
					clock1 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH min1 SELECT
					clock4 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;					
	WITH min2 SELECT
					clock3 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH hour1 SELECT
					clock6 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH hour2 SELECT
					clock5 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH adig1 SELECT
					alarm2 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH adig2 SELECT
					alarm1 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH adig3 SELECT
					alarm4 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH adig4 SELECT
					alarm3 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH cdig1 SELECT
					change2 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH cdig2 SELECT
					change1 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH cdig3 SELECT
					change4 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH cdig4 SELECT
					change3 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH chrdig1 SELECT
					chrono2 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH chrdig2 SELECT
					chrono1 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH chrdig3 SELECT
					chrono4 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;					
	WITH chrdig4 SELECT
					chrono3 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH chrdig5 SELECT
					chrono6 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
	WITH chrdig6 SELECT
					chrono5 <= 	"1000000" WHEN 0,
									"1111001" WHEN 1,
									"0100100" WHEN 2,
									"0110000" WHEN 3,
									"0011001" WHEN 4,
									"0010010" WHEN 5,
									"0000010" WHEN 6,
									"1111000" WHEN 7,
									"0000000" WHEN 8,
									"0010000" WHEN 9,
									"0000000" WHEN OTHERS;
									
	s1 <= std_logic_vector(to_unsigned(sec1, 5)); 
	s2 <= std_logic_vector(to_unsigned(sec2, 5));
	m1 <= std_logic_vector(to_unsigned(min1, 5));
	m2 <= std_logic_vector(to_unsigned(min2, 5));
	h1 <= std_logic_vector(to_unsigned(hour1, 5));
	h2 <= std_logic_vector(to_unsigned(hour2, 5));

end Behavioral;