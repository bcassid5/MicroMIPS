library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity program_ctr is
  port(CLK: in std_logic;
           
       PC_In: in std_logic_vector(31 downto 0);
       PC_out: out std_logic_vector(31 downto 0));
end program_ctr;

architecture Behavioral of program_ctr is
  
begin
  process(clk)
  begin
    if CLK = '1' and CLK'event then
      
        PC_out <= PC_In;
     
    end if;
  end process;
  
end Behavioral;