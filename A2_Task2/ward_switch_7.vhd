library ieee;
use ieee.std_logic_1164.all;

entity encoder_8_3 is
	port (encoder_in:		in		std_logic_vector(7 downto 0);
			encoder_out:	out	std_logic_vector(2 downto 0));
end encoder_8_3;

architecture design_encoder_8_3 of encoder_8_3 is
begin
	
		encoder_out <= "000" when encoder_in(7) = '1' else
							"111" when encoder_in(6) = '1' else
							"110" when encoder_in(5) = '1' else
							"101" when encoder_in(4) = '1' else
							"100" when encoder_in(3) = '1' else	
							"011" when encoder_in(2) = '1' else	
							"010" when encoder_in(1) = '1' else
							"001" when encoder_in(0) = '1' else
							"000";
	
end design_encoder_8_3;

library ieee;
use ieee.std_logic_1164.all;

entity decoder_4_7 is
	port (decoder_in:		in		std_logic_vector(3 downto 0);
			decoder_out:	out	std_logic_vector(6 downto 0));
end decoder_4_7;

architecture design_decoder_4_7 of decoder_4_7 is
begin
with decoder_in select
	decoder_out <= "1111110" when "0000",
						"0110000" when "0001",
						"1101101" when "0010",
						"1111001" when "0011",
						"0110011" when "0100",
						"1011011" when "0101",
						"1011111" when "0110",
						"1110000" when "0111",
						"1111111" when "1000",
						"1111011" when "1001",
						"0000000" when others;
end design_decoder_4_7;

library ieee; 
use ieee.std_logic_1164.all;

entity ward_switch_7 is
	port( input:	in		std_logic_vector(7 downto 0);
			output:	out 	std_logic_vector(6 downto 0);
			signal_3: out	std_logic_vector(2 downto 0));
end ward_switch_7;

architecture design_ward of ward_switch_7 is

component encoder_8_3 is
	port (encoder_in:		in		std_logic_vector(7 downto 0);
			encoder_out:	out	std_logic_vector(2 downto 0));
end component;

component decoder_4_7 is
	port (decoder_in:		in		std_logic_vector(3 downto 0);
			decoder_out:	out	std_logic_vector(6 downto 0));
end component;

signal encoder_3	:	std_logic_vector(2 downto 0);

begin
encoder:	encoder_8_3 port map (input, encoder_3);
decoder: decoder_4_7 port map ('0' & encoder_3, output);

signal_3 <= encoder_3;

end design_ward;