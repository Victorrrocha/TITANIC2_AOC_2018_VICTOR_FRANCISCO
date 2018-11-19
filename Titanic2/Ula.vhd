library	ieee;
use ieee.std_logic_1164.all;

entity Ula is
	port (
	
		a, b  : in  std_ulogic_vector(15 downto 0);
		op    : in  std_ulogic_vector( 7 downto 0);
		cout  : out std_ulogic;
		s     : out std_ulogic_vector(15 downto 0)
		
	);
end Ula;

architecture implements of Ula is
	component multiplexer_4op 
	port (
	
		a, b, c  : in  std_ulogic_vector(15 downto 0);
		selector    : in  std_ulogic_vector( 1 downto 0);
		x           : out std_ulogic_vector(15 downto 0)
	);
end component;

component SOMA16BITS
port(
	A, B	: in 	std_ulogic_vector(15 downto 0);
	cin 	: in 	std_ulogic;
	cout 	: out	std_ulogic;
	sum	: out std_ulogic_vector(15 downto 0)
);
end component;
component Qand 
PORT (

	a, b : IN  std_ulogic_vector(15 downto 0);
	x    : OUT std_ulogic_vector(15 downto 0) 
);
END component;
component Qor 
PORT (

	a, b : IN  std_ulogic_vector(15 downto 0);
	x    : OUT std_ulogic_vector(15 downto 0) 

);
END component;

component Qxor 
PORT (

	a, b : IN  std_ulogic_vector(15 downto 0);
	x    : OUT std_ulogic_vector(15 downto 0)

);
END component;

-- utiliza o "cin" do somador, para indicar
-- sera Left ou Right, repectivamente '1' e '0'
component Shift_2bits
PORT (

	a    : IN  std_ulogic_vector(15 downto 0);
	cin  : in std_logic;
	x    : OUT std_ulogic_vector(15 downto 0) 
);
END component;

component Multiplexer_5pos 
PORT (

	a, b, c, d, e  : IN  std_ulogic_vector(15 downto 0);
	seletor        : IN  std_ulogic_vector( 2 downto 0);
	x              : OUT std_ulogic_vector(15 downto 0)

);
END component;

-- co => complemento de dois
 SIGNAL notA, notB, co, aa, ab, ba, bb, bc, bd, be : std_ulogic_vector(15 downto 0);
 SIGNAL lixo02 : std_ulogic;
begin 
	notA <= not a;
	notB <= not b;
	
	Soma_1: SOMA16BITS port map (notB,"0000000000000001",'0',lixo02,co);
	Multiplexer_01: multiplexer_4op port map(a, notA, notB, op(6 downto 5), aa);
	Multiplexer_02: multiplexer_4op port map(b, notB, co, op(4 downto 3), ab);
	And_01: Qand port map (aa, ab, ba); 
	Or_01 : Qor  port map (aa, ab, bb); 
	Shift_01: shift_2bits port map (b, op(7), bd);
	Xor_01: Qxor port map (aa, ab, be); 
	
	-- UC deverar seta '0' em Carry in.. Para fucnionar o Xor
	Somador_16bits: SOMA16BITS port map(aa, ab, '0', cout, bc);
	
	Multiplexer_03: multiplexer_5pos port map(ba, bb, bc, bd, be, op(2 downto 0), s);
	
end implements;