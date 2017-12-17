LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity next_add is 
	port(	
		rt: in std_logic_vector (31 downto 0);
		rs: in std_logic_vector (31 downto 0);
		PC: in std_logic_vector (29 downto 0);
		BrType: in std_logic_vector (1 downto 0);
		BPCSrc: in std_logic_vector (1 downto 0);
		NextPC: out std_logic_vector (31 downto 0);
		IncrPC: out std_logic_vector (31 downto 0);
		SE: in std_logic_vector (13 downto 0);
		JTA: in std_logic_vector (25 downto 0);
		SysCallAddr: in std_logic_vector (29 downto 0)
	);
end next_add;

architecture bhv of next_add is

component add4
	port (
		a, b		: in	STD_LOGIC_VECTOR(29 downto 0);
	   ans		: out	STD_LOGIC_VECTOR(29 downto 0);
	   cout		: out	STD_LOGIC
	);
end component;

component branch_condition
	port (
		BrType: in std_logic_vector (1 downto 0);
		rt: in std_logic_vector (31 downto 0);
		rs: in std_logic_vector (31 downto 0);
		BrTrue: out std_logic
	);
end component;

component branch_and
	port (
		A: in std_logic_vector(29 downto 0);
		Br: in std_logic;
		Ou: out std_logic_vector (29 downto 0)
	);
end component;

signal SeImm: std_LOGIC_VECTOR (29 downto 0);
signal BrCheck: std_logic;
signal BrAnd: std_logic_vector (29 downto 0);
signal Cout: std_logic;
signal Src2: std_logic_vector (29 downto 0);
signal IncrTemp: std_logic_vector (29 downto 0);

begin

P0:branch_condition port map(BrType, rt, rs, BrCheck);
SeImm (15 downto 0) <= PC (15 downto 0);
SeImm (29 downto 16) <= SE;
P1: branch_and port map (SeImm, BrCheck, BrAnd);
P2: add4 port map (BrAnd, PC, IncrTemp, Cout);
Src2 (29 downto 26) <= IncrTemp (29 downto 26);
Src2 (25 downto 0) <= JTA;
IncrPC(31 downto 2) <= IncrTemp;

process (BPCSrc)
begin
		--last unit - MUX
		if (BPCSrc = "00") then
			NextPC(31 downto 2) <= IncrTemp;
		end if;
		if (BPCSrc = "01") then
			--calculated previously...
			NextPC(31 downto 2) <= Src2;
		end if;
		if (BPCSrc = "10") then
			NextPC(31 downto 2) <= rs(31 downto 2);
		end if;
		if (BPCSrc = "11") then
			NextPC(31 downto 2) <= SysCallAddr;
		end if;
end process;
	
end bhv;