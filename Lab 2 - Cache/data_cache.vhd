library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_cache is
  port( data_in: in std_logic_vector (31 downto 0);
			data_out: out std_logic_vector (31 downto 0);
			addr: in std_logic_vector (31 downto 0);
			CS: in std_logic; -- chip select
			WE: in std_logic; -- write enable
			OE: in std_logic;	-- read enable
			clk: in std_logic);
end data_cache;

--1. DATA_IN[31..0]: a write port which is a 32-bit input.
--2. DATA_OUT[31..0]: a read port which is a 32-bit output.
--3. ADDR[31..0]: an input which is a destination memory address for the input port DATA_IN[31..0]:
--4. CS: a chip select input.
--5. WE: a write enable input.
--6. OE: a read enable input

architecture struct of data_cache is

type dataCache is array(0 to 127) of std_logic_vector(31 downto 0);
  signal datas : dataCache;

begin
  dc : process (clk) is
  begin
    if rising_edge(clk) then
      if CS = '0' then
			data_out <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
		end if;
		if CS = '1' then
			if WE = '0' then
				if OE = '0' then
					data_out <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
				end if;
				if OE = '1' then
					data_out <= datas(to_integer(unsigned(addr(6 downto 0))));
				end if;
			end if;
			if WE = '1' then
				datas(to_integer(unsigned(addr(6 downto 0)))) <= data_in;
			end if;
		end if;
    end if;
  end process;
end struct;