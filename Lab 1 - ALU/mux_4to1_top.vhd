-- 4-to-1 MUX ---------------------------
library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1_top is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);     -- select input
           R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31,R32: in  STD_LOGIC_VECTOR (31 downto 0);     -- inputs
           X   : out STD_LOGIC_vector (31 downto 0));                        -- output
end mux_4to1_top;

architecture bhv_mux of mux_4to1_top is
begin
process(SEL,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31,R32)
begin
	case SEL is
		when "00000" =>X<= R1;
		when "00001" =>X<= R2;
		when "00010" =>X<= R3;
		when "00011" =>X<= R4;
		when "00100" =>X<= R5;
		when "00101" =>X<= R6;
		when "00110" =>X<= R7;
		when "00111" =>X<= R8;
		when "01000" =>X<= R9;
		when "01001" =>X<= R10;
		when "01010" =>X<= R11;
		when "01011" =>X<= R12;
		when "01100" =>X<= R13;
		when "01101" =>X<= R14;
		when "01110" =>X<= R15;
		when "01111" =>X<= R16;
		when "10000" =>X<= R17;
		when "10001" =>X<= R18;
		when "10010" =>X<= R19;
		when "10011" =>X<= R20;
		when "10100" =>X<= R21;
		when "10101" =>X<= R22;
		when "10110" =>X<= R23;
		when "10111" =>X<= R24;
		when "11000" =>X<= R25;
		when "11001" =>X<= R26;
		when "11010" =>X<= R27;
		when "11011" =>X<= R28;
		when "11100" =>X<= R29;
		when "11101" =>X<= R30;
		when "11110" =>X<= R31;
		when "11111" =>X<= R32;
	end case;
end process;
end bhv_mux;