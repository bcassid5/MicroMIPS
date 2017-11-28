--=====================--
--Full Circuit for Test--
--=====================--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuit is

Port ( RAup, RAdown, RBup, RBdown, clk: in std_logic; --variables for push buttons to set register values
			X: in std_logic_vector (31 downto 0);
			Y: in std_LOGIC_vector (31 downto 0);
			Sel: in std_LOGIC_vector (4 downto 0);
			OutSel: in std_LOGIC_VECTOR(1 downto 0);
			Ovfl: out std_logic;
			A, B, C, D, E, F, G, H: out std_logic_vector (6 downto 0));

end circuit;

architecture struct of circuit is

component bcd32bit is
  port( BCD32in: in std_logic_vector (31 downto 0);
			A, B, C, D, E, F, G, H: out std_logic_vector (6 downto 0) );
end component;

component alu is
  port( X, Y: in std_logic_vector (31 downto 0);
			Sel: in std_LOGIC_vector(4 downto 0);
			Ovfl: out std_logic;
			S: out std_logic_vector (31 downto 0) );
end component;

component mux_4to1_top is
	port (SEL : in  STD_LOGIC_VECTOR (1 downto 0);     -- select input
           A, B, C, D : in  STD_LOGIC_VECTOR (31 downto 0);     -- inputs
           X   : out STD_LOGIC_vector (31 downto 0));
end component;

signal alu_out: std_LOGIC_vector (31 downto 0);
signal out32: std_LOGIC_VECTOR(31 downto 0);
--signal count: integer:=1;
--registers*
signal RA: std_LOGIC_vector(31 downto 0):="00000000000000000000000000000000";
signal RB: std_LOGIC_vector(31 downto 0):="00000000000000000000000000000000";

begin

--create process for clk
process(clk)
begin

if (rising_edge(clk)) then
	if (RAup='0') then
		RA (31 downto 16) <= X (31 downto 16);
	end if;
	if (RAdown='0') then
		RA (15 downto 0) <= X (15 downto 0);
	end if;
	if (RBup='0') then
		RB (31 downto 16) <= Y (31 downto 16);
	end if;
	if (RBdown='0') then
		RB (15 downto 0) <= Y (15 downto 0);
	end if;

end if;

end process;

P0: alu port map(RA, RB, Sel(4 downto 0), Ovfl, alu_out);
P1: mux_4to1_top port map (OutSel, RA, RB, alu_out, "00000000000000000000000000000000", out32); 
P2: bcd32bit port map(out32, A, B, C, D, E, F, G, H);

end struct;