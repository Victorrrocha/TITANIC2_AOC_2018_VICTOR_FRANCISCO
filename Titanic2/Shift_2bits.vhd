LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Shift_2bits IS
PORT (

	a    : IN  std_ulogic_vector(15 downto 0);
	cin  : in std_logic;
	x    : OUT std_ulogic_vector(15 downto 0) 
);
END Shift_2bits;

ARCHITECTURE implements OF Shift_2bits IS
BEGIN 
	process (cin)
	begin
		if cin = '0' then
			x <= "00" & a(15 downto 2);
		else
			x <= a(13 downto 0) & "00";
		end if;
	end process;

END implements;