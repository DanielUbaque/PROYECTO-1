LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
-------------------------------------------------------------------------------
ENTITY NBITCOMPARATOR_SUB IS

	PORT	  (		X				    :	 IN 	STD_LOGIC_VECTOR(3 DOWNTO 0);
						Y				    :	 IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
						OUTPUT_SUB_END  :  IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
						OUTPUT_SUB	    :	 OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
	
END ENTITY;
-------------------------------------------------------------------------------
ARCHITECTURE gateLevel OF NBITCOMPARATOR_SUB IS

SIGNAL TEM_SUB_1 :	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL TEM_SUB_2 :	STD_LOGIC_VECTOR(7 DOWNTO 0);
		
BEGIN
	
	TEM_SUB_1   <=   "0000" & OUTPUT_SUB_END;
	TEM_SUB_2   <=   "1111" & OUTPUT_SUB_END;
	
	OUTPUT_SUB	<= TEM_SUB_1 WHEN X >= Y ELSE 
						TEM_SUB_2;


		
END ARCHITECTURE;