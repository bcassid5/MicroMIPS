-- 32 bit AND ---------------------------
library ieee;
use ieee.std_logic_1164.all;

entity and_32bit is
	port (
		A : in std_LOGIC_VECTOR (31 downto 0);
		B : in std_LOGIC_VECTOR (31 downto 0);
		R : out std_LOGIC_VECTOR (31 downto 0)
	);
end and_32bit;

architecture bhv_and of and_32bit is
begin
	R(31 downto 0) <= A(31 downto 0) and B(31 downto 0);
end bhv_and;

-- 32 bit OR ---------------------------
library ieee;
use ieee.std_logic_1164.all;

entity or_32bit is
	port (
		A : in std_LOGIC_VECTOR (31 downto 0);
		B : in std_LOGIC_VECTOR (31 downto 0);
		R : out std_LOGIC_VECTOR (31 downto 0)
	);
end or_32bit;

architecture bhv_or of or_32bit is
begin
	R(31 downto 0) <= A(31 downto 0) or B(31 downto 0);
end bhv_or; 

-- 32 bit XOR ---------------------------
library ieee;
use ieee.std_logic_1164.all;

entity xor_32bit is
	port (
		A : in std_LOGIC_VECTOR (31 downto 0);
		B : in std_LOGIC_VECTOR (31 downto 0);
		R : out std_LOGIC_VECTOR (31 downto 0)
	);
end xor_32bit;

architecture bhv_xor of xor_32bit is
begin
	R(31 downto 0) <= A(31 downto 0) xor B(31 downto 0);
end bhv_xor;

-- 32 bit NOR ---------------------------
library ieee;
use ieee.std_logic_1164.all;

entity nor_32bit is
	port (
		A : in std_LOGIC_VECTOR (31 downto 0);
		B : in std_LOGIC_VECTOR (31 downto 0);
		R : out std_LOGIC_VECTOR (31 downto 0)
	);
end nor_32bit;

architecture bhv_nor of nor_32bit is
begin
	R(31 downto 0) <= A(31 downto 0) nor B(31 downto 0);
end bhv_nor;



-- Logic Unit ---------------------------

library ieee;
use ieee.std_logic_1164.all;
entity logic_unit is
   port(  A,B  : in std_logic_vector(31 downto 0);
          S : in std_logic_vector (1 downto 0);
			 R : out std_logic_vector(31 downto 0)
	);
end logic_unit;
 
architecture bhv_log of logic_unit is

component and_32bit is
  port( A, B : in std_logic_vector (31 downto 0);
        R : out std_logic_vector (31 downto 0));
end component;
component or_32bit is
  port( A, B : in std_logic_vector (31 downto 0);
        R : out std_logic_vector (31 downto 0));
end component;
component xor_32bit is
  port( A, B : in std_logic_vector (31 downto 0);
        R : out std_logic_vector (31 downto 0));
end component;
component nor_32bit is
  port( A, B : in std_logic_vector (31 downto 0);
        R : out std_logic_vector (31 downto 0));
end component;	
component mux_4to1_top is
  port( 
		SEL: in std_LOGIC_VECTOR (1 downto 0);
		A, B, C, D: in std_LOGIC_VECTOR (31 downto 0);
		X: out std_LOGIC_vector (31 downto 0));
end component;
	
signal sig_and: std_LOGIC_VECTOR(31 downto 0);
signal sig_or: std_LOGIC_VECTOR(31 downto 0);
signal sig_xor: std_LOGIC_VECTOR(31 downto 0);
signal sig_nor: std_LOGIC_VECTOR(31 downto 0);

begin
P0:and_32bit port map(A, B, sig_and);
P1:or_32bit port map(A, B, sig_or);
P2:xor_32bit port map(A, B, sig_xor);
P3:nor_32bit port map(A, B, sig_nor);
P4:mux_4to1_top port map(S, sig_and, sig_or, sig_xor, sig_nor, R);
   
end bhv_log;
