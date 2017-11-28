library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity bcd32bit is

Port ( BCD32in: in std_logic_vector (31 downto 0);
			A, B, C, D, E, F, G, H: out std_logic_vector (6 downto 0));

end bcd32bit;

architecture struct of bcd32bit is

component bcd_7segment is
  port( BCDin : in STD_LOGIC_VECTOR (3 downto 0);
			Seven_Segment : out STD_LOGIC_VECTOR (6 downto 0));
end component;

begin

P0: bcd_7segment port map(bcd32in(3 downto 0), A);
P1: bcd_7segment port map(bcd32in(7 downto 4), B);
P2: bcd_7segment port map(bcd32in(11 downto 8), C);
P3: bcd_7segment port map(bcd32in(15 downto 12), D);
P4: bcd_7segment port map(bcd32in(19 downto 16), E);
P5: bcd_7segment port map(bcd32in(23 downto 20), F);
P6: bcd_7segment port map(bcd32in(27 downto 24), G);
P7: bcd_7segment port map(bcd32in(31 downto 28), H);

end struct;


--BCD32in (3 downto 0);
--BCD32in (7 downto 4);
--BCD32in (11 downto 8);
--BCD32in (15 downto 12);
--BCD32in (19 downto 16);
--BCD32in (23 downto 20);
--BCD32in (27 downto 24);
--BCD32in (31 downto 28);