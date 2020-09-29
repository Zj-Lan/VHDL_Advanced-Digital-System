library ieee;
use ieee.std_logic_1164.all;

entity inv is
	port (i1		:	in		std_logic;
			F_inv	:	out	std_logic );
end inv;

architecture design_inv of inv is
begin
	F_inv <= not i1;
end design_inv;