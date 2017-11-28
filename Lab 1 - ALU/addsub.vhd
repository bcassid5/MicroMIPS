-- FULL ADDER
library ieee;
use ieee.std_logic_1164.all;
entity Full_Adder is
   port( X, Y, Cin : in std_logic;
         sum, Cout : out std_logic);
end Full_Adder;
 
architecture bhv of Full_Adder is
begin
   sum <= (X xor Y) xor Cin;
   Cout <= (X and (Y or Cin)) or (Cin and Y);
end bhv;


--32 bit Adder Subtractor
library ieee;
use ieee.std_logic_1164.all;
entity addsub is
   port( OP: in std_logic;
          A,B  : in std_logic_vector(31 downto 0);
          R  : out std_logic_vector(31 downto 0);
          OVERFLOW : out std_logic);
end addsub;
 
architecture struct of addsub is
component Full_Adder is
  port( X, Y, Cin : in std_logic;
        sum, Cout : out std_logic);
end component;
signal C: std_logic_vector(32 downto 1);
signal TMP: std_logic_vector(31 downto 0);
 
begin
TMP(0)<= OP xor B(0);
TMP(1)<= OP xor B(1);
TMP(2)<= OP xor B(2);
TMP(3)<= OP xor B(3);
TMP(4)<= OP xor B(4);
TMP(5)<= OP xor B(5);
TMP(6)<= OP xor B(6);
TMP(7)<= OP xor B(7);
TMP(8)<= OP xor B(8);
TMP(9)<= OP xor B(9);
TMP(10)<= OP xor B(10);
TMP(11)<= OP xor B(11);
TMP(12)<= OP xor B(12);
TMP(13)<= OP xor B(13);
TMP(14)<= OP xor B(14);
TMP(15)<= OP xor B(15);
TMP(16)<= OP xor B(16);
TMP(17)<= OP xor B(17);
TMP(18)<= OP xor B(18);
TMP(19)<= OP xor B(19);
TMP(20)<= OP xor B(20);
TMP(21)<= OP xor B(21);
TMP(22)<= OP xor B(22);
TMP(23)<= OP xor B(23);
TMP(24)<= OP xor B(24);
TMP(25)<= OP xor B(25);
TMP(26)<= OP xor B(26);
TMP(27)<= OP xor B(27);
TMP(28)<= OP xor B(28);
TMP(29)<= OP xor B(29);
TMP(30)<= OP xor B(30);
TMP(31)<= OP xor B(31);
FA0:Full_Adder port map(A(0),TMP(0),OP, R(0),C(1));
FA1:Full_Adder port map(A(1),TMP(1),C(1), R(1),C(2));
FA2:Full_Adder port map(A(2),TMP(2),C(2), R(2),C(3));
FA3:Full_Adder port map(A(3),TMP(3),C(3), R(3),C(4));
FA4:Full_Adder port map(A(4),TMP(4),C(4), R(4),C(5));
FA5:Full_Adder port map(A(5),TMP(5),C(5), R(5),C(6));
FA6:Full_Adder port map(A(6),TMP(6),C(6), R(6),C(7));
FA7:Full_Adder port map(A(7),TMP(7),C(7), R(7),C(8));
FA8:Full_Adder port map(A(8),TMP(8),C(8), R(8),C(9));
FA9:Full_Adder port map(A(9),TMP(9),C(9), R(9),C(10));
FA10:Full_Adder port map(A(10),TMP(10),C(10), R(10),C(11));
FA11:Full_Adder port map(A(11),TMP(11),C(11), R(11),C(12));
FA12:Full_Adder port map(A(12),TMP(12),C(12), R(12),C(13));
FA13:Full_Adder port map(A(13),TMP(13),C(13), R(13),C(14));
FA14:Full_Adder port map(A(14),TMP(14),C(14), R(14),C(15));
FA15:Full_Adder port map(A(15),TMP(15),C(15), R(15),C(16));
FA16:Full_Adder port map(A(16),TMP(16),C(16), R(16),C(17));
FA17:Full_Adder port map(A(17),TMP(17),C(17), R(17),C(18));
FA18:Full_Adder port map(A(18),TMP(18),C(18), R(18),C(19));
FA19:Full_Adder port map(A(19),TMP(19),C(19), R(19),C(20));
FA20:Full_Adder port map(A(20),TMP(20),C(20), R(20),C(21));
FA21:Full_Adder port map(A(21),TMP(21),C(21), R(21),C(22));
FA22:Full_Adder port map(A(22),TMP(22),C(22), R(22),C(23));
FA23:Full_Adder port map(A(23),TMP(23),C(23), R(23),C(24));
FA24:Full_Adder port map(A(24),TMP(24),C(24), R(24),C(25));
FA25:Full_Adder port map(A(25),TMP(25),C(25), R(25),C(26));
FA26:Full_Adder port map(A(26),TMP(26),C(26), R(26),C(27));
FA27:Full_Adder port map(A(27),TMP(27),C(27), R(27),C(28));
FA28:Full_Adder port map(A(28),TMP(28),C(28), R(28),C(29));
FA29:Full_Adder port map(A(29),TMP(29),C(29), R(29),C(30));
FA30:Full_Adder port map(A(30),TMP(30),C(30), R(30),C(31));
FA31:Full_Adder port map(A(31),TMP(31),C(31), R(31),C(32));
OVERFLOW <= C(31) XOR C(32) ;
end struct;