LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
-------------------------------------------------------------------------------
ENTITY MUX_NEGATIVE IS


	PORT	  (		X				:	IN 	STD_LOGIC_VECTOR(3 DOWNTO 0);
						Y				:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
						SEL_DIG_NEG	:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
						FLAG_NEG		:	OUT	STD_LOGIC);
	
END ENTITY;
-------------------------------------------------------------------------------
ARCHITECTURE gateLevel OF MUX_NEGATIVE IS
		
BEGIN
	
		FLAG_NEG	<= '1' WHEN (X < Y AND SEL_DIG_NEG = "01") ELSE '0';
		
END ARCHITECTURE;