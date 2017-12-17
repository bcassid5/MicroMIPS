-- Branch Condition Checker

LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity branch_condition is 
	port(
		BrType: in std_logic_vector (1 downto 0);
		rt: in std_logic_vector (31 downto 0);
		rs: in std_logic_vector (31 downto 0);
		BrTrue: out std_logic
	);
end branch_condition;

architecture bhv of branch_condition is
begin
process (BrType) is
begin
		BrTrue <= '0';
		if (BrType = "00") then
			BrTrue <= '0';
		end if;
		if (BrType = "01") then
			if (rs = rt) then
				BrTrue <= '1';
			end if;
		end if;
		if (BrType = "10") then
			if (rs /= rt) then
				BrTrue <= '1';
			end if;
		end if;
		if (BrType = "11") then
			if (rs < "00000000000000000000000000000000") then
				BrTrue <= '1';
			end if;
		end if;
end process;

end bhv;