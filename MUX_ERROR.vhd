LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
-------------------------------------------------------------------------------
ENTITY MUX_ERROR IS

	PORT	  (		xi	         :	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
						yi     	   :	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
						xo				:	OUT 	STD_LOGIC_VECTOR(3 DOWNTO 0);
						yo				:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
						result		:	IN	   STD_LOGIC_VECTOR(7 DOWNTO 0));
	
END ENTITY;
-------------------------------------------------------------------------------
ARCHITECTURE gateLevel OF MUX_ERROR IS

SIGNAL ten    :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL TEM_1  :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL TEM_2  :  STD_LOGIC_VECTOR(3 DOWNTO 0);
	
BEGIN

	ten <= "1010";
	TEM_1	<= result (7 DOWNTO 4);
	TEM_2	<= result (3 DOWNTO 0);
	
	xo <= ten WHEN xi >= ten ELSE
			ten WHEN yi >= ten ELSE 
			TEM_1;
				
	yo <= ten WHEN xi >= ten ELSE
			ten WHEN yi >= ten ELSE
			TEM_2;

		
END ARCHITECTURE;