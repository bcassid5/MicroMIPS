library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity instr_cache is
  port(
       ADDR: in std_logic_vector(31 downto 0);
       outp: out std_logic_vector(31 downto 0));
end instr_cache;

architecture Internal of instr_cache is
  type RAMtype is array (0 to 127) of std_logic_vector(7 downto 0);
  signal RAM1: RAMtype := (3=>"00111100", 2=>"00000000", 1=>"00000000", 0=>"00000000", 7=>"00110000", 6=>"00000001", 5=>"00000000", 4=>"00000000", 11=>"00000000", 10=>"00000001", 9=>"00010000", 8=>"00100000",15=>"10101100", 14=>"00000001", 13=>"00010000", 12=>"00000000", 19=>"00000000", 18=>"00000000", 17=>"00000000", 16=>"00001100", others => (others => '0'));
 
begin
outp(7 downto 0) <= RAM1(to_integer(unsigned(ADDR(6 downto 0))));
outp(15 downto 8) <= RAM1(to_integer(unsigned(ADDR(6 downto 0)))+1);
outp(23 downto 16) <= RAM1(to_integer(unsigned(ADDR(6 downto 0)))+2);
outp(31 downto 24) <= RAM1(to_integer(unsigned(ADDR(6 downto 0)))+3);  
end Internal;