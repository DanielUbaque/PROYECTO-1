LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY FOUR_BIT_FULL_MULTIPLICATION IS

	PORT (	INPUT_1_MULTIPLICATION		:	 IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
				INPUT_2_MULTIPLICATION		:	 IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
				OUTPUT_MULTIPLICATION	   :	 OUT STD_LOGIC_VECTOR (7 DOWNTO 0));

END ENTITY FOUR_BIT_FULL_MULTIPLICATION;

ARCHITECTURE gateLevel OF FOUR_BIT_FULL_MULTIPLICATION IS

SIGNAL 	ROW_1		:	  STD_LOGIC_VECTOR (7 DOWNTO 0); 
SIGNAL 	ROW_2		:	  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL 	ROW_3		:    STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL 	ROW_4		:	  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL 	TEM_1		:	  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL 	TEM_2		:	  STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

	MULTIPLICATION_1: ENTITY work.MULTIPLICADOR_1
	PORT MAP	(	A => INPUT_1_MULTIPLICATION,
					B => INPUT_2_MULTIPLICATION(0), 
					Y => ROW_1(3 DOWNTO 0));
					
	ROW_1 (7 DOWNTO 4) <= (OTHERS => '0'); 
	
	MULTIPLICATION_2: ENTITY work.multiplicador_1
	PORT MAP	(	A => INPUT_1_MULTIPLICATION,
					B => INPUT_2_MULTIPLICATION(1), 
					Y => ROW_2(4 DOWNTO 1));
					
	ROW_2 (7 DOWNTO 5) <= (OTHERS => '0');
	ROW_2 (0) <= '0';	
	
	MULTIPLICATION_3: ENTITY work.MULTIPLICADOR_1
	PORT MAP	(	A => INPUT_1_MULTIPLICATION,
					B => INPUT_2_MULTIPLICATION(2), 
					Y => ROW_3(5 DOWNTO 2));
					
	ROW_3 (7 DOWNTO 6) <= (OTHERS => '0');
	ROW_3 (1 DOWNTO 0) <= (OTHERS => '0');
	
	MULTIPLICATION_4: ENTITY work.multiplicador_1
	PORT MAP	(	A => INPUT_1_MULTIPLICATION,
					B => INPUT_2_MULTIPLICATION(3), 
					Y => ROW_4(6 DOWNTO 3));
					
	ROW_4 (7) <= '0';
	ROW_4 (2 DOWNTO 0) <= (OTHERS => '0');
	
	
	SUMA_1: ENTITY work.eightBitfulladder
	PORT MAP	(	A8	 => ROW_1,
					B8	 => ROW_2, 
					Y8  => TEM_1);
	
	SUMA_2: ENTITY work.eightBitfulladder
	PORT MAP	(	A8  => ROW_3,
					B8  => ROW_4, 
					Y8  => TEM_2);

	SUMA_1_y_2: ENTITY work.eightBitfulladder
	PORT MAP	(	A8  => TEM_1,
					B8  => TEM_2, 
					Y8  => OUTPUT_MULTIPLICATION);
	


END ARCHITECTURE gateLevel;