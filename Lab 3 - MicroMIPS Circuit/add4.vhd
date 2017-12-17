LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BIT_ADDER is
	port( a, b, cin         : in  STD_LOGIC;
	      sum, cout         : out STD_LOGIC );
end BIT_ADDER;

architecture BHV of BIT_ADDER is
begin

	sum <=  (not a and not b and cin) or
			(not a and b and not cin) or
			(a and not b and not cin) or
			(a and b and cin);

	cout <= (not a and b and cin) or
			(a and not b and cin) or
			(a and b and not cin) or
			(a and b and cin);
end BHV;

LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add4 is
	port( a, b		: in	STD_LOGIC_VECTOR(29 downto 0);
	      ans		: out	STD_LOGIC_VECTOR(29 downto 0);
	      cout		: out	STD_LOGIC);
end add4;

architecture STRUCTURE of add4 is

component BIT_ADDER
	port( a, b, cin		: in  STD_LOGIC;
	      sum, cout		: out STD_LOGIC );
end component;

signal c : STD_LOGIC_VECTOR (29 downto 0);
begin

c(0) <= '1';
b_adder0: BIT_ADDER port map (a(0), b(0), c(0), ans(0), c(1));
b_adder1: BIT_ADDER port map (a(1), b(1), c(1), ans(1), c(2));
b_adder2: BIT_ADDER port map (a(2), b(2), c(2), ans(2), c(3));
b_adder3: BIT_ADDER port map (a(3), b(3), c(3), ans(3), c(4));
b_adder4: BIT_ADDER port map (a(4), b(4), c(4), ans(4), c(5));
b_adder5: BIT_ADDER port map (a(5), b(5), c(5), ans(5), c(6));
b_adder6: BIT_ADDER port map (a(6), b(6), c(6), ans(6), c(7));
b_adder7: BIT_ADDER port map (a(7), b(7), c(7), ans(7), c(8));
b_adder8: BIT_ADDER port map (a(8), b(8), c(8), ans(8), c(9));
b_adder9: BIT_ADDER port map (a(9), b(9), c(9), ans(9), c(10));
b_adder10: BIT_ADDER port map (a(10), b(10), c(10), ans(10), c(11));
b_adder11: BIT_ADDER port map (a(11), b(11), c(11), ans(11), c(12));
b_adder12: BIT_ADDER port map (a(12), b(12), c(12), ans(12), c(13));
b_adder13: BIT_ADDER port map (a(13), b(13), c(13), ans(13), c(14));
b_adder14: BIT_ADDER port map (a(14), b(14), c(14), ans(14), c(15));
b_adder15: BIT_ADDER port map (a(15), b(15), c(15), ans(15), c(16));
b_adder16: BIT_ADDER port map (a(16), b(16), c(16), ans(16), c(17));
b_adder17: BIT_ADDER port map (a(17), b(17), c(17), ans(17), c(18));
b_adder18: BIT_ADDER port map (a(18), b(18), c(18), ans(18), c(19));
b_adder19: BIT_ADDER port map (a(19), b(19), c(19), ans(19), c(20));
b_adder20: BIT_ADDER port map (a(20), b(20), c(20), ans(20), c(21));
b_adder21: BIT_ADDER port map (a(21), b(21), c(21), ans(21), c(22));
b_adder22: BIT_ADDER port map (a(22), b(22), c(22), ans(22), c(23));
b_adder23: BIT_ADDER port map (a(23), b(23), c(23), ans(23), c(24));
b_adder24: BIT_ADDER port map (a(24), b(24), c(24), ans(24), c(25));
b_adder25: BIT_ADDER port map (a(25), b(25), c(25), ans(25), c(26));
b_adder26: BIT_ADDER port map (a(26), b(26), c(26), ans(26), c(27));
b_adder27: BIT_ADDER port map (a(27), b(27), c(27), ans(27), c(28));
b_adder28: BIT_ADDER port map (a(28), b(28), c(28), ans(28), c(29));
b_adder29: BIT_ADDER port map (a(29), b(29), c(29), ans(29), cout);

END STRUCTURE;