--==========================================--
--====== 32 bit Arithmetic Logic Unit ======--
--==========================================--

library ieee;
use ieee.std_logic_1164.all;

entity alu is
	port (
			--define variables
			X, Y: in std_logic_vector (31 downto 0);
			--Ctrl: in std_logic;
			Sel: in std_LOGIC_vector(4 downto 0);
			Ovfl: out std_logic;
			S: out std_logic_vector (31 downto 0));
end alu;

architecture struct of alu is

component logic_unit is
  port( A,B  : in std_logic_vector(31 downto 0);
          S : in std_logic_vector (1 downto 0);
			 R : out std_logic_vector(31 downto 0) );
end component;

component addsub is
  port( OP: in std_logic;
          A,B  : in std_logic_vector(31 downto 0);
          R  : out std_logic_vector(31 downto 0);
          OVERFLOW : out std_logic);
end component;

component mux_4to1_top is
  port( SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           A, B, C, D : in  STD_LOGIC_VECTOR (31 downto 0);
           X   : out STD_LOGIC_vector (31 downto 0) );
end component;

signal sig_logic: std_logic_vector (31 downto 0);
signal sig_adder: std_LOGIC_VECTOR (31 downto 0);
signal sig_slt: std_LOGIC_VECTOR (31 downto 0);

begin

process (X, Y)
begin 
if (X < Y) then
	sig_slt <= "00000000000000000000000000000001";
	end if;
if (X > Y) then
	sig_slt <= "00000000000000000000000000000000";
	end if;
end process;

P0:addsub port map(Sel(4), X, Y, sig_adder, Ovfl);
P1:logic_unit port map (X, Y, Sel(3 downto 2), sig_logic);
P3:mux_4to1_top port map(Sel(1 downto 0), "00001111000011110000111100001111", sig_slt, sig_adder, sig_logic, S);
	
end struct;



--lui constant = 00001111000011110000111100001111


--slt code?

--if RA < RB than SLT = 00000000000000000000000000000001
--if RA > RB than SLT = 00000000000000000000000000000000