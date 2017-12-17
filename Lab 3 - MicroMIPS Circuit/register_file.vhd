library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
  port( RegW: in std_logic;
				DR: in std_logic_vector (4 downto 0);
				SR1: in std_logic_vector (4 downto 0);
				SR2: in std_logic_vector (4 downto 0);
				Reg_In: in std_logic_vector (31 downto 0);
				Data_Out1: out std_logic_vector (31 downto 0);
				Data_Out2: out std_logic_vector (31 downto 0)
				
    );
end register_file;


architecture behavioral of register_file is
  type registerFile is array(0 to 31) of std_logic_vector(31 downto 0);
  signal registers : registerFile;
begin
  process (RegW) is
  begin
      -- Read A and B before bypass
      data_Out1 <= registers(to_integer(unsigned(SR1)));
      data_Out2 <= registers(to_integer(unsigned(SR2)));
      -- Write and bypass
      if RegW = '1' then
        registers(to_integer(unsigned(DR))) <= Reg_In;  -- Write
      end if;
  end process;
end behavioral;