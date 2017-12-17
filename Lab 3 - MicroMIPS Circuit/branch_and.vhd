LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity branch_and is

	port (
		A: in std_logic_vector(29 downto 0);
		Br: in std_logic;
		Ou: out std_logic_vector (29 downto 0)
	);
	
end branch_and;

architecture bhv of branch_and is

begin
Ou(0) <= A(0) and Br;
Ou(1) <= A(1) and Br;
Ou(2) <= A(2) and Br;
Ou(3) <= A(3) and Br;
Ou(4) <= A(4) and Br;
Ou(5) <= A(5) and Br;
Ou(6) <= A(6) and Br;
Ou(7) <= A(7) and Br;
Ou(8) <= A(8) and Br;
Ou(9) <= A(9) and Br;
Ou(10) <= A(10) and Br;
Ou(11) <= A(11) and Br;
Ou(12) <= A(12) and Br;
Ou(13) <= A(13) and Br;
Ou(14) <= A(14) and Br;
Ou(15) <= A(15) and Br;
Ou(16) <= A(16) and Br;
Ou(17) <= A(17) and Br;
Ou(18) <= A(18) and Br;
Ou(19) <= A(19) and Br;
Ou(20) <= A(20) and Br;
Ou(21) <= A(21) and Br;
Ou(22) <= A(22) and Br;
Ou(23) <= A(23) and Br;
Ou(24) <= A(24) and Br;
Ou(25) <= A(25) and Br;
Ou(26) <= A(26) and Br;
Ou(27) <= A(27) and Br;
Ou(28) <= A(28) and Br;
Ou(29) <= A(29) and Br;

end bhv;