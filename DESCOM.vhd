LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------
ENTITY DESCOM IS
	PORT(			INPUT_DES		     :	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
					OUTPUT_DES		     :	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));	
					
END ENTITY DESCOM;
-------------------------------------------------------
ARCHITECTURE gateLevel OF DESCOM IS

SIGNAL	TEN	    : 	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	NOT_TEN   : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	

--------------------------------SALIDA UNIDAD
SIGNAL	RESULT_1	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	
SIGNAL	RESULT_2	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	
SIGNAL	RESULT_3	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	
SIGNAL	RESULT_4	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	
SIGNAL	RESULT_5	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	
SIGNAL	RESULT_6	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	RESULT_7	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	
SIGNAL	RESULT_8	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	RESULT_9	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);

--------------------------------SALIDA UNIDAD Y DECIMAL
SIGNAL	x1	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	
SIGNAL	x2	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	
SIGNAL	x3	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	
SIGNAL	x4	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	
SIGNAL	x5	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	
SIGNAL	x6	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	x7	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);	
SIGNAL	x8	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	x9	  : 	STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 

	TEN			<=		 "00001010";
	NOT_TEN 	 	<= 	 "11110110";

------------------------------------------INPUT 0-10	
	
	RESULT_1		 <=	INPUT_DES;
	
------------------------------------------INPUT 10-20

	INPUT_10_20: ENTITY work.eightBitfulladder
	PORT MAP	(	A8  => RESULT_1,
					B8  => NOT_TEN, 
					Y8  => RESULT_2);
					
------------------------------------------INPUT 20-30

	INPUT_20_30: ENTITY work.eightBitfulladder
	PORT MAP	(	A8  => RESULT_2,
					B8  => NOT_TEN, 
					Y8  => RESULT_3);
					
------------------------------------------INPUT 30-40

	INPUT_30_40: ENTITY work.eightBitfulladder
	PORT MAP	(	A8  => RESULT_3,
					B8  => NOT_TEN, 
					Y8  => RESULT_4);

------------------------------------------INPUT 40-50

	INPUT_40_50: ENTITY work.eightBitfulladder
	PORT MAP	(	A8  => RESULT_4,
					B8  => NOT_TEN, 
					Y8  => RESULT_5);

------------------------------------------INPUT 50-60

	INPUT_50_60: ENTITY work.eightBitfulladder
	PORT MAP	(	A8  => RESULT_5,
					B8  => NOT_TEN, 
					Y8  => RESULT_6);
					
------------------------------------------INPUT 60-70

	INPUT_60_70: ENTITY work.eightBitfulladder
	PORT MAP	(	A8  => RESULT_6,
					B8  => NOT_TEN, 
					Y8  => RESULT_7);
					
------------------------------------------INPUT 70-80

	INPUT_70_80: ENTITY work.eightBitfulladder
	PORT MAP	(	A8  => RESULT_7,
					B8  => NOT_TEN, 
					Y8  => RESULT_8);

------------------------------------------INPUT 80-90

	INPUT_80_90: ENTITY work.eightBitfulladder
	PORT MAP	(	A8  => RESULT_8,
					B8  => NOT_TEN, 
					Y8  => RESULT_9);
					
--------------------------------------------------------
-----------------------------------------CONCATENACIÓN
	x1 <= "0000" & RESULT_1(3 DOWNTO 0);
	x2 <= "0001" & RESULT_2(3 DOWNTO 0);
	x3 <= "0010" & RESULT_3(3 DOWNTO 0);
	x4 <= "0011" & RESULT_4(3 DOWNTO 0);
	x5 <= "0100" & RESULT_5(3 DOWNTO 0);
	x6 <= "0101" & RESULT_6(3 DOWNTO 0);
	x7 <= "0110" & RESULT_7(3 DOWNTO 0);
	x8 <= "0111" & RESULT_8(3 DOWNTO 0);
	x9 <= "1000" & RESULT_9(3 DOWNTO 0);
--------------------------------------------------------
-------------------------------------------CUAL ES MAYOR
	
	OUTPUT_DES	<=	x1 WHEN RESULT_1 < TEN ELSE
						x2 WHEN RESULT_2 < TEN ELSE
						x3 WHEN RESULT_3 < TEN ELSE
						x4 WHEN RESULT_4 < TEN ELSE
						x5 WHEN RESULT_5 < TEN ELSE
						x6 WHEN RESULT_6 < TEN ELSE
						x7 WHEN RESULT_7 < TEN ELSE
						x8 WHEN RESULT_8 < TEN ELSE
						x9 WHEN RESULT_9 < TEN ELSE
						x1;
					
	
END ARCHITECTURE gateLevel;

					
					
	
	
	
	