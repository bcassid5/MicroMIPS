-- Control Unit

LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity cnt_unit is

	port (
		En: in std_logic;
		Op: in std_logic_vector (5 downto 0);
		Fn: in std_logic_vector (5 downto 0);
		Instruct: out std_logic_vector (16 downto 0)
	);

end cnt_unit;

architecture bhv of cnt_unit is 
begin
process (Op, Fn)
begin
	if (Op = "000000") then
		if (Fn = "100000") then
			Instruct <= "10101000010000000";
		elsif (Fn = "100010") then
			Instruct <= "10101010010000000";
		elsif (Fn = "101010") then
			Instruct <= "10101010001000000";
		elsif (Fn = "100100") then
			Instruct <= "10101000011000000";
		elsif (Fn = "100101") then
			Instruct <= "10101000111000000";
		elsif (Fn = "100110") then
			Instruct <= "10101001011000000";
		elsif (Fn = "100111") then
			Instruct <= "10101001111000000";
		elsif (Fn = "001000") then
			Instruct <= "00000000000000010";
		elsif (Fn = "001100") then
			Instruct <= "00000000000000011";
		end if;
	elsif (Op = "001111") then
		Instruct <= "10001100000000000";	
	elsif (Op = "001000") then
		Instruct <= "10001100010000000";
	elsif (Op = "001010") then
		Instruct <= "10001110001000000";
	elsif (Op = "001100") then
		Instruct <= "10001100011000000";
	elsif (Op = "001101") then
		Instruct <= "10001100111000000";
	elsif (Op = "001110") then
		Instruct <= "10001101011000000";
	elsif (Op = "100011") then
		Instruct <= "10000100010100000";
	elsif (Op = "101011") then
		Instruct <= "00000100010010000";
	elsif (Op = "000010") then
		Instruct <= "00000000000000001";
	elsif (Op = "000001") then
		Instruct <= "00000000000001100";
	elsif (Op = "000100") then
		Instruct <= "00000000000001000";
	elsif (Op = "000101") then
		Instruct <= "00000000000000100";
	elsif (Op = "000011") then
		Instruct <= "11010000000000001";
	end if;
end process;
end bhv;


--RegWrite <= Instruct(16) 
--RegDst <= Instruct(15 downto 14) 
--RegInSrc <= Instruct(13 downto 12) 
--ALUSrc <= Instruct(11)
--AddSub <= Instruct(10) 
--LogicFn <= Instruct(9 downto 8)
--FnClass <= Instruct(7 downto 6)
--DataRead <= Instruct(5) 
--DataWrite <= Instruct(4) 
--BrType <= Instruct(3 downto 2) 
--PCSrc <= Instruct(1 downto 0) 