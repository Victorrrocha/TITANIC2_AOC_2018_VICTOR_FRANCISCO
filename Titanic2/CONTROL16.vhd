library ieee;
use ieee.std_logic_1164.all;

-- implentação da unidade de controle que recebe 4 bits de OPcode e sem campo funct.

entity CONTROL16 is
port(
	clk			: 	in std_logic;
	opcode		:	in	std_logic_vector (3 downto 0);
	regDst		: 	out std_logic;
	ulaFont		:	out std_logic;
	memParaReg	:	out std_logic;
	escReg		:	out std_logic;
	lerMem		:	out std_logic;
	escMem		:	out std_logic;
	desvio		:	out std_logic;
	ulaOP			: 	out std_logic_vector (7 downto 0)
);
end entity CONTROL16;

architecture CONTROL16_BH of CONTROL16 is 

begin
	process(clk, opcode)
		begin
			if clk = '1' then	
				if opcode = "0000" then --AND
					regDst <= '1';
					ulaFont <= '0';		
					memParaReg <= '0';
					escReg <= '1';
					lerMem <= '0';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "00000000";
				
				elsif opcode = "0001" then --or
					regDst <= '1';
					ulaFont <= '0';		
					memParaReg <= '0';
					escReg <= '1';
					lerMem <= '0';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "00000001";
					
				elsif opcode = "0010" then --NAND
					regDst <= '1';
					ulaFont <= '0';		
					memParaReg <= '0';
					escReg <= '1';
					lerMem <= '0';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "00101001";
				
				elsif opcode = "0011" then --nor
					regDst <= '1';
					ulaFont <= '0';		
					memParaReg <= '0';
					escReg <= '1';
					lerMem <= '0';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "00101000";
					
				elsif opcode = "0100" then --XOR
					regDst <= '1';
					ulaFont <= '0';		
					memParaReg <= '0';
					escReg <= '1';
					lerMem <= '0';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "00000100";
					
				elsif opcode = "0101" then --soma
					regDst <= '1';
					ulaFont <= '0';		
					memParaReg <= '0';
					escReg <= '1';
					lerMem <= '0';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "00000010";
					
				elsif opcode = "0110" then --sub
					regDst <= '1';
					ulaFont <= '0';		
					memParaReg <= '0';
					escReg <= '1';
					lerMem <= '0';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "00010010";
				
				elsif opcode = "0111" then --not
					regDst <= '1';
					ulaFont <= '0';		
					memParaReg <= '0';
					escReg <= '1';
					lerMem <= '0';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "01001000";
				
				elsif opcode = "1000" then --shift_L
					regDst <= '1';
					ulaFont <= '0';		
					memParaReg <= '0';
					escReg <= '1';
					lerMem <= '0';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "10000011";
					
				elsif opcode = "1001" then --SHIFT_R
					regDst <= '1';
					ulaFont <= '0';		
					memParaReg <= '0';
					escReg <= '1';
					lerMem <= '0';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "00000011";
					
				elsif opcode = "1010" then --load
					regDst <= '0';
					ulaFont <= '1';		
					memParaReg <= '1';
					escReg <= '1';
					lerMem <= '1';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "11001100";
				
				elsif opcode = "1011" then --store
					regDst <= '0';
					ulaFont <= '1';		
					memParaReg <= '1';
					escReg <= '1';
					lerMem <= '1';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "10101010";
					
				elsif opcode = "1100" then --branch equal
					regDst <= '0';
					ulaFont <= '1';		
					memParaReg <= '1';
					escReg <= '1';
					lerMem <= '1';
					escMem <= '0';
					desvio <= '0';
					ulaOP <= "01010101";
					
				elsif opcode = "1101" then --jump
					regDst <= '0';
					ulaFont <= '0';		
					memParaReg <= '1';
					escReg <= '0';
					lerMem <= '0';
					escMem <= '0';
					desvio <= '1';
					ulaOP <= "11111111";
				
				end if;
			
			
			else
					regDst <= 'Z';
					ulaFont <= 'Z';		
					memParaReg <= 'Z';
					escReg <= 'Z';
					lerMem <= 'Z';
					escMem <= 'Z';
					desvio <= 'Z';
					ulaOP <= "ZZZZZZZZ";
			end if;
	end process;
end CONTROL16_BH;