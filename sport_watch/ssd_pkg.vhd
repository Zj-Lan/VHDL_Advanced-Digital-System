----------------------------------------------------------------------------------
-- Company: HSN	
-- Engineer: Qinghui Liu , Zhili Shao, Joseph Fotso
-- 
-- Create Date:    14:27:31 02/01/2016 
-- Design Name: 
-- Module Name:    FSM_process_pkg  
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.FSM_process_pkg.all;

package ssd_pkg is

-- Bin to BCD function, 16-bit binary number convert on 20bit BCD
-- with 5 groups of 4-bit, each representing 1 digit
	function Bin2BCD (bin: natural) return std_logic_vector; --(15 downto 0)
	
-- BCD to 7seg display (ssd), 4-bit BCD value conver to 7-bit
-- representing the 7 segments for the LCD display return ssgement vector (6 downto 0)
	function BCD2ssd (bcd: std_logic_vector(3 downto 0)) return std_logic_vector; 
	
-- caculate and return number of days in a month upon defferent years
	function nDays_In_Month(Months: in  natural; Years : in  natural) return natural; 
	
	procedure ssd_Blink_Display(	signal blink_flag : in SSD_BLINK_STATE;	
											variable delay_cnt : inout natural;
											constant BLINK_TM  : in natural;
											variable bcd0	: in std_logic_vector (7 downto 0);
											variable bcd1	: in std_logic_vector (7 downto 0);
											variable bcd2	: in std_logic_vector (7 downto 0);
											variable bcd3	: in std_logic_vector (7 downto 0);	
											signal ssd0 : out std_logic_vector(7 downto 0);
											signal ssd1 : out std_logic_vector(7 downto 0);
											signal ssd2 : out std_logic_vector(7 downto 0);
											signal ssd3 : out std_logic_vector(7 downto 0)
										);

end ssd_pkg;

package body ssd_pkg is

	-- caculate and return number of days in a month upon defferent years
	function nDays_In_Month(Months: in  natural; 
									Years : in  natural) return natural is
		variable is_leap: std_logic := '0';
		variable n_days : natural range 28 to 31 := 31;
	begin
		 if Years mod 4 = 0 then
			if Years  mod 100 = 0 then
				if Years mod 400 = 0 then
					is_leap :='1';
				else 	
					is_leap :='0';
				end if;
			else 
				is_leap :='1';
			end if;
		 else 
			is_leap :='0';
		 end if;	 
		
		if Months = 4 or Months = 9 or 
			Months = 6 or Months = 11 then  
			n_days := 30;
		elsif Months = 2 then
			if is_leap = '0' then
				n_days := 28;
			else 
				n_days := 29;
			end if;		
		else
		 n_days := 31;
		end if;
		
		return n_days;
		
	end nDays_In_Month;
	

	--- binary to bcd conversion function----
	function Bin2BCD(bin: natural) return std_logic_vector is
		variable i : integer := 0;
		variable BCD: std_logic_vector(19 downto 0):= (others => '0');
		variable Bin_tmp: std_logic_vector(15 downto 0):= (others => '0');	
	begin 
		Bin_tmp := std_logic_vector(to_unsigned(bin, Bin_tmp'length));
		for i in 0 to 15 loop
			BCD(19 downto 1) := BCD(18 downto 0); --shift left
			BCD(0) := Bin_tmp(15);
			Bin_tmp(15 downto 1) := Bin_tmp(14 downto 0);
			Bin_tmp(0) := '0';
			
			if(i<15 and BCD(3 downto 0)>"0100" ) then
				BCD(3 downto 0) :=std_logic_vector(unsigned(BCD(3 downto 0)) + 3);
			end if;
			
			if(i<15 and BCD(7 downto 4)>"0100" ) then
				BCD(7 downto 4) := std_logic_vector(unsigned(BCD(7 downto 4)) + 3);
			end if;
			
			if(i<15 and BCD(11 downto 8)>"0100" ) then
				BCD(11 downto 8) := std_logic_vector(unsigned(BCD(11 downto 8)) + 3);
			end if;
			
			if(i<15 and BCD(15 downto 12)>"0100" ) then
				BCD(15 downto 12) := std_logic_vector(unsigned(BCD(15 downto 12)) + 3);
			end if;	

			if(i<15 and BCD(19 downto 16)>"0100" ) then
				BCD(19 downto 16) := std_logic_vector(unsigned(BCD(19 downto 16)) + 3);
			end if;	
			
		end loop;
		return BCD(15 downto 0);
	end Bin2BCD;

	-- BCD to 7segment display conversion function ---
	function BCD2ssd (bcd:std_logic_vector(3 downto 0)) return std_logic_vector is
		variable SSEG : std_logic_vector(6 downto 0):= (others => '1');
	begin
		case bcd is
			when "0000" => SSEG:="0000001"; -- 0 --
			when "0001" => SSEG:="1001111"; -- 1 --
			when "0010" => SSEG:="0010010"; -- 2 --
			when "0011" => SSEG:="0000110"; -- 3 --
			when "0100" => SSEG:="1001100"; -- 4 --
			when "0101" => SSEG:="0100100"; -- 5 --
			when "0110" => SSEG:="0100000"; -- 6 --
			when "0111" => SSEG:="0001111"; -- 7 --
			when "1000" => SSEG:="0000000"; -- 8 --
			when "1001" => SSEG:="0000100"; -- 9 --
			when "1010" => SSEG:="0001000"; -- a --
			when "1011" => SSEG:="1100000"; -- b --
			when "1100" => SSEG:="0110001"; -- c --
			when "1101" => SSEG:="1000010"; -- d --
			when "1110" => SSEG:="0110000"; -- e --
			when "1111" => SSEG:="0111000"; -- f --			
			when others => SSEG:="1111111";
		end case;
		return SSEG;
	end BCD2ssd;
 
   -- ssd blink process
	procedure ssd_Blink_Display(	signal blink_flag : in SSD_BLINK_STATE;	
											variable delay_cnt : inout natural;
											constant BLINK_TM  : in natural;
											variable bcd0	: in std_logic_vector (7 downto 0);
											variable bcd1	: in std_logic_vector (7 downto 0);
											variable bcd2	: in std_logic_vector (7 downto 0);
											variable bcd3	: in std_logic_vector (7 downto 0);	
											signal ssd0 : out std_logic_vector(7 downto 0);
											signal ssd1 : out std_logic_vector(7 downto 0);
											signal ssd2 : out std_logic_vector(7 downto 0);
											signal ssd3 : out std_logic_vector(7 downto 0)	
										) is
	begin
		case blink_flag is
			when BLALL =>
				if (delay_cnt < BLINK_TM/2) then
					ssd0  <= x"FF";
					ssd1  <= x"FF";
					ssd2  <= x"FF";
					ssd3  <= x"FF";								
				elsif (delay_cnt  <BLINK_TM ) then
					ssd0  <= bcd0;
					ssd1  <= bcd1;
					ssd2  <= bcd2;
					ssd3  <= bcd3;	
				else 	
					delay_cnt := 0;
				end if;
				
			when BL01 =>
				if (delay_cnt < BLINK_TM/2) then
					ssd0  <= x"FF";
					ssd1  <= x"FF";
				elsif (delay_cnt  <BLINK_TM ) then						
					ssd0  <= bcd0;
					ssd1  <= bcd1;
				else
					delay_cnt := 0;
				end if;
				ssd2  <= bcd2;
				ssd3  <= bcd3;	

			when BL23 =>
				if (delay_cnt < BLINK_TM/2) then
					ssd2  <= x"FF";
					ssd3  <= x"FF";
				elsif (delay_cnt  <BLINK_TM ) then						
					ssd2  <= bcd2;
					ssd3  <= bcd3;
				else
					delay_cnt := 0;
				end if;
				ssd0  <= bcd0;
				ssd1  <= bcd1;	

			when BL0 =>
				if (delay_cnt < BLINK_TM/2) then
					ssd0  <= x"FF";
				elsif (delay_cnt  <BLINK_TM ) then						
					ssd0  <= bcd0;					
				else
					delay_cnt := 0;
				end if;
				ssd1  <= bcd1;
				ssd2  <= bcd2;	
				ssd3  <= bcd3;

			when BL1 =>
				if (delay_cnt < BLINK_TM/2) then
					ssd1  <= x"FF";
				elsif (delay_cnt  <BLINK_TM ) then						
					ssd1  <= bcd1;					
				else
					delay_cnt := 0;
				end if;
				ssd0  <= bcd0;
				ssd2  <= bcd2;	
				ssd3  <= bcd3;

			when BL2 =>
				if (delay_cnt < BLINK_TM/2) then
					ssd2  <= x"FF";
				elsif (delay_cnt  <BLINK_TM ) then						
					ssd2  <= bcd2;					
				else
					delay_cnt := 0;
				end if;
				ssd0  <= bcd0;
				ssd1  <= bcd1;	
				ssd3  <= bcd3;

			when BL3 =>
				if (delay_cnt < BLINK_TM/2) then
					ssd3  <= x"FF";
				elsif (delay_cnt  < BLINK_TM ) then						
					ssd3  <= bcd3;					
				else
					delay_cnt := 0;
				end if;
				ssd0  <= bcd0;
				ssd1  <= bcd1;	
				ssd2  <= bcd2;
				
			when others =>
				ssd0  <= bcd0;
				ssd1  <= bcd1;
				ssd2  <= bcd2;
				ssd3  <= bcd3;
				delay_cnt := 0;
				
		end case;	
	end;

end ssd_pkg;
