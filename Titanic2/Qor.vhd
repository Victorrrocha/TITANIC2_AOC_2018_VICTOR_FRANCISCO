LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Qor IS
PORT (

	a, b : IN  std_ulogic_vector(15 downto 0);
	x    : OUT std_ulogic_vector(15 downto 0)

);
END Qor;


ARCHITECTURE implements OF Qor IS
BEGIN

	x <= a OR b;

END implements;