LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY CALCULATOR IS

	PORT (	INPUT_1		  :	 IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
				INPUT_2		  :	 IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
				SELECTOR_CAL  :    IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
				OUTPUT_CAL    :	 OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
			
END ENTITY CALCULATOR;

ARCHITECTURE gateLevel OF CALCULATOR IS

SIGNAL OUTPUT_MULTIPLICATION_1		:	  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL OUTPUT_ADDER_1		         :	  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL OUTPUT_SUBTRACTION_1	   	:	  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL OUTPUT_BITS_MULTIPLICATION	:	  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL OUTPUT_BITS_ADDER	         :	  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL OUTPUT_BITS_SUBTRACTION	   :	  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL OUTPUT_BITS_SUB_TEM    	   :	  STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN



--------------------------------------------------------------MULTIPLICATION
	MULTIPLICATION: ENTITY work.FOUR_BIT_FULL_MULTIPLICATION
	PORT MAP	(	INPUT_1_MULTIPLICATION   =>   INPUT_1,
					INPUT_2_MULTIPLICATION   =>   INPUT_2, 
					OUTPUT_MULTIPLICATION    =>   OUTPUT_MULTIPLICATION_1);
					
	BITS_4_TO_8_MULTIPLICATION: ENTITY work.descom
	PORT MAP	(	INPUT_DES    =>   OUTPUT_MULTIPLICATION_1,
					OUTPUT_DES   =>   OUTPUT_BITS_MULTIPLICATION);
					
-----------------------------------------------------------------------ADDER	
	ADDER: ENTITY work.FOUR_BIT_FULL_ADDER
	PORT MAP	(	INPUT_1_ADDER   =>   INPUT_1,
					INPUT_2_ADDER   =>   INPUT_2, 
					OUTPUT_ADDER    =>   OUTPUT_ADDER_1);
					
	BITS_4_TO_8_ADDER: ENTITY work.descom
	PORT MAP	(	INPUT_DES    =>   OUTPUT_ADDER_1,
					OUTPUT_DES   =>   OUTPUT_BITS_ADDER);
					
-----------------------------------------------------------------SUBTRACTION
	SUBTRACTION: ENTITY work.FOUR_BIT_FULL_SUBTRACTION
	PORT MAP	(	INPUT_1_SUBTRACTION   =>   INPUT_1,
					INPUT_2_SUBTRACTION   =>   INPUT_2, 
					OUTPUT_SUBTRACTION    =>   OUTPUT_SUBTRACTION_1);
					
	OUTPUT_BITS_SUB_TEM <= OUTPUT_SUBTRACTION_1(3 DOWNTO 0);
					
	FLAG: ENTITY work.nBitcomparator_SUB
	PORT MAP	(	X   				  =>   INPUT_1,
					Y                =>   INPUT_2,
					OUTPUT_SUB_END   =>   OUTPUT_BITS_SUB_TEM,
					OUTPUT_SUB  	  =>   OUTPUT_BITS_SUBTRACTION);
					
--------------------------------------------------------------------SELECTOR
	MUX_1: ENTITY work.MUX_CALCULATOR
	PORT MAP	(	IN_1       =>   OUTPUT_BITS_MULTIPLICATION,
					IN_2       =>   OUTPUT_BITS_ADDER, 
					IN_3       =>   OUTPUT_BITS_SUBTRACTION,
					SELECTOR   => 	 SELECTOR_CAL,
					OUTPUT     =>	 OUTPUT_CAL);
					
		

END ARCHITECTURE gateLevel;