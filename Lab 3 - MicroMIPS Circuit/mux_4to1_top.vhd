-- 4-to-1 MUX ---------------------------
library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1_top is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);     -- select input
           A, B, C, D : in  STD_LOGIC_VECTOR (31 downto 0);     -- inputs
           X   : out STD_LOGIC_vector (31 downto 0));                        -- output
end mux_4to1_top;

architecture bhv_mux of mux_4to1_top is
begin
process(SEL,A,B,C,D)
begin
	case SEL is
		when "00" =>X<=A;
		when "01" =>X<=B;
		when "10" =>X<=C;
		when "11" =>X<=D;
	end case;
end process;
end bhv_mux;