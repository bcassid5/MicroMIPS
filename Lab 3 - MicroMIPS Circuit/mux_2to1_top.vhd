--Mux 2to1

library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1_top is
	port (
		A, B: in std_logic_vector (31 downto 0);
		SEL: in std_logic;
		X: out std_logic_vector (31 downto 0)
	);
end mux_2to1_top;

architecture bhv of mux_2to1_top is
begin
	process(SEL,A,B)
	begin
		case SEL is
			when '0' =>X<=A;
			when '1' =>X<=B;
		end case;
	if (SEL = '1') then
		X(31 downto 16) <= "0000000000000000";
	end if;
end process;

end bhv;