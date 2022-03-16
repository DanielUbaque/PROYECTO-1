LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
-------------------------------------------------------------------------------
ENTITY NBITCOMPARATOR IS


	PORT	  (		x				:	IN 	STD_LOGIC_VECTOR(3 DOWNTO 0);
						y				:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
						sel1			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
						sel2			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0));
	
END ENTITY;
-------------------------------------------------------------------------------
ARCHITECTURE gateLevel OF NBITCOMPARATOR IS
		
	
	BEGIN
	
		sel1	<= x WHEN x > y ELSE y ;

		sel2	<= x WHEN x < y ELSE y ;
		
END ARCHITECTURE;