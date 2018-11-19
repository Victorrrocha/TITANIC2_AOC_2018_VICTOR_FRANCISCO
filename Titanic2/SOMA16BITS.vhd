LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
Use Ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity SOMA16BITS is 
port(
	A, B	: in 	std_ulogic_vector(15 downto 0);
	cin 	: in 	std_ulogic;
	cout 	: out	std_ulogic;
	sum	: out std_ulogic_vector(15 downto 0)
);
end entity SOMA16BITS;

architecture adder_bh of SOMA16BITS is
begin 
process(A, B, cin)
	variable soma	: std_ulogic_vector (15 downto 0);
	variable c	  	: std_ulogic;
	begin
		
	c := cin;
	for i in 0 to 15 loop
	
	soma(i) := A(i) xor B(i) xor C;
	c := (A(i) and B(i)) or ((A(i) xor B(i)) and c);
	end loop;

cout <= c;
sum <= soma;
end process;
end adder_bh;