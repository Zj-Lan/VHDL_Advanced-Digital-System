library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--project
--201991139 WANG ZHONGTIAN
--201990309 LAN ZHIJIE

entity Ctrl is
	port( Ctrl_clk_in:  in  std_logic;
			Ctrl_set_in:	 in  std_logic;
			Ctrl_time_out: out bit_vector(15 downto 0)
		  );
end Ctrl;

architecture Design of Ctrl is

-- minutes
signal m1: integer range 0 to 10 := 0; 
signal m2: integer range 0 to 6 := 0; 
-- hours
signal h1: integer range 0 to 10 := 0; 
signal h2: integer range 0 to 3 := 0; 

begin
	
	process(Ctrl_clk_in, Ctrl_set_in)
	begin
		-- check pulse
		if Ctrl_clk_in = '1' or Ctrl_set_in = '1' then
		    m1 <= m1 + 1;
			Ctrl_time_out(3 downto 0) <= to_bitvector(std_logic_vector(to_unsigned(m1, 4)));
			if m1 = 9 then
				m2 <= m2 + 1;
				m1 <= 0;
				Ctrl_time_out(7 downto 4) <= to_bitvector(std_logic_vector(to_unsigned(m2, 4)));
				if m2 = 5 and m1 = 9 then
					h1 <= h1 + 1;
					m1 <= 0;
					m2 <= 0;
					Ctrl_time_out(11 downto 8) <= to_bitvector(std_logic_vector(to_unsigned(h1, 4)));
					if h1 = 9 then
					  h2 <= h2 + 1;
					  h1 <= 0;
					  Ctrl_time_out(15 downto 12)<= to_bitvector(std_logic_vector(to_unsigned(h2, 4)));
					  
					end if; 
					if h2 = 2 and h1 = 4 then
						 h2 <= 0;
						 h1 <= 0;
					  end if;
				end if; 
			end if; 
		end if; 
	end process;
end Design;

