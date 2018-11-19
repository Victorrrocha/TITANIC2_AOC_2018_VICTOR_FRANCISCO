LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Qand IS
PORT (

	a, b : IN  std_ulogic_vector(15 downto 0);
	x    : OUT std_ulogic_vector(15 downto 0) 
);
END Qand;

ARCHITECTURE implements OF Qand IS
BEGIN 

	x <= a AND b;

END implements;