library ieee ;
use ieee . std_logic_1164 . all ;
use ieee . numeric_std . all ;
ENTITY counter5bit IS
	PORT ( clk , rst : in std_logic ;
			q: out std_logic_vector (4 downto 0));
END counter5bit;

ARCHITECTURE rtl OF counter5bit IS
signal cnt : unsigned (4 downto 0) := "00001";
BEGIN
	process (clk)
		begin
			if (clk'event and clk = '1') then
				if (rst='1') then
					cnt <= "00001";
				else
					cnt <= cnt + "1";
				end if ;
			end if ;
		end process ;
q <= std_logic_vector ( cnt );
END rtl ;