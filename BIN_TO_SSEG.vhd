-----------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------------
ENTITY BIN_TO_SSEG IS
	PORT( bin1	   :	IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			flag		:  IN  STD_LOGIC;
			sseg	   :	OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
			
			
END ENTITY BIN_TO_SSEG;

ARCHITECTURE behaviour OF BIN_TO_SSEG IS

SIGNAL flag_bin1 :  STD_LOGIC_VECTOR(4 DOWNTO 0); 

BEGIN
	
	flag_bin1 <= flag & bin1;

	WITH flag_bin1 SELECT
	sseg <=
			"1000000" WHEN "00000",--0
			"1111001" WHEN "00001",--1
			"0100100" WHEN "00010",--2
			"0110000" WHEN "00011",--3
			"0011001" WHEN "00100",--4
			"0010010" WHEN "00101",--5
			"0000010" WHEN "00110",--6
			"1111000" WHEN "00111",--7
			"0000000" WHEN "01000",--8
			"0010000" WHEN "01001",--9
			"0111111" WHEN "11111",--negative
			"0000110" WHEN OTHERS; --E
			
	
END behaviour;