LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity REGBANK16 is 
port(
	ReadReg1	:	in 	std_logic_vector(3 downto 0);
	ReadReg2	:	in 	std_logic_vector(3 downto 0);
	WriteReg	: 	in 	std_logic_vector(3 downto 0); 
	WriteData:	in 	std_logic_vector(15 downto 0);
	RegWrite	: 	in		std_logic;
	ReadData1: 	out 	std_logic_vector(15 downto 0);
	ReadData2:	out 	std_logic_vector(15 downto 0)
);
end REGBANK16;

architecture REGBANK16_BH of REGBANK16 is
	
TYPE REGBANK_ARRAY IS ARRAY (15 downto 0) OF STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL ARRAYREG: REGBANK_ARRAY;
	
begin 
	
	process(RegWrite)
	
	begin
		if( RegWrite = '1' ) then  --escreve na posição do WriteReg
			
			ARRAYREG(conv_integer(unsigned(WriteReg))) <= WriteData;
		end if;
	end process;
	
	
	ReadData1 <= ARRAYREG(conv_integer(unsigned(ReadReg1))); 
	ReadData2 <= ARRAYREG(conv_integer(unsigned(ReadReg2)));

end REGBANK16_BH;