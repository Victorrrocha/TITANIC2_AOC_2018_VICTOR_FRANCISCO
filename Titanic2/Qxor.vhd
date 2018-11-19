LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Qxor IS
PORT (

	a, b : IN  std_ulogic_vector(15 downto 0);
	x    : OUT std_ulogic_vector(15 downto 0)

);
END Qxor;

ARCHITECTURE implements OF Qxor IS
BEGIN

	x <= a xor b;

END implements;