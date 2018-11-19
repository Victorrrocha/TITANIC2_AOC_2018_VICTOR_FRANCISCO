library ieee;
use ieee.std_logic_1164.all;
Use Ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity SUM4 is 
port(
	clk	: 	in 	std_logic;
	A		:	in 	std_logic_vector (15 downto 0);
	cin	: 	in 	std_logic;
	cout	: 	out 	std_logic;
	sum	:	out 	std_logic_vector (15 downto 0)
);
end entity SUM4;

architecture SOMA4_BH of SUM4 is

constant quatro : std_logic_vector (15 downto 0) := "0000000000000100";

begin 
	process(clk)
		variable soma	:	std_logic_vector (15 downto 0);
		variable c		:	std_logic;
		begin
		if clk = '1' then
			c := cin;
			for i in 0 to 15 loop
			soma(i) := A(i) xor quatro(i) xor c;
			c := (A(i) and quatro(i)) or ((quatro(i) xor A(i)) and c); 
			end loop;
		end if;
	cout <= c;
	sum <= soma;
	end process;
	
end SOMA4_BH;