LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------
ENTITY MULTIPLICADOR_1 IS
	PORT (	
				A	:	IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				B	:	IN STD_LOGIC;
				Y	:	OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
				
END ENTITY MULTIPLICADOR_1;
-------------------------------
ARCHITECTURE gateLevel OF MULTIPLICADOR_1 IS

BEGIN

	y(0)	<=		A(0) AND B;
	y(1)	<=		A(1) AND B;
	y(2)	<=		A(2) AND B;
	y(3)	<=		A(3) AND B;

END ARCHITECTURE gateLevel;