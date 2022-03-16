LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY DIGITS IS
	PORT(	  bin_3		:	 IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
			  bin_2		:	 IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
			  SEL_DIG	:	 IN   STD_LOGIC_VECTOR(1 DOWNTO 0);	  
			  sseg_0	   :	 OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
			  sseg_1	   :	 OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
			  sseg_2	   :	 OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
			  sseg_3    :	 OUT  STD_LOGIC_VECTOR(6 DOWNTO 0));
			
END ENTITY DIGITS;
--------------------------------------------------------
ARCHITECTURE structural OF DIGITS IS

SIGNAL RESULT_TEM   :   STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL bin_1		  :	STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL bin_0		  :	STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ten			  :   STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL FLAG_TEMP	  :   STD_LOGIC;
	
BEGIN

	ten <= "1010";

	digit_3: ENTITY work.BIN_TO_SSEG
		PORT MAP(	bin1		=>	bin_3,
						flag	 	=> '0',
						sseg 		=> sseg_3);
						
						
	digit_2: ENTITY work.BIN_TO_SSEG
		PORT MAP(	bin1		=>	bin_2,
						flag	 	=> '0',
						sseg		=> sseg_2);
	---------------------------------------------------------				
	digit_temp_1_and_0: ENTITY work.CALCULATOR
				
		PORT MAP(	INPUT_1	       =>	 bin_3,
						INPUT_2	       =>	 bin_2,
						SELECTOR_CAL    =>    SEL_DIG,
						OUTPUT_CAL	    =>	 RESULT_TEM);
							 
		DECO_ERROR: ENTITY work.DECO_ERROR					
		PORT MAP(	xi	=> bin_3,
						yi => bin_2,
						xo	=> bin_1,
						yo	=> bin_0,
						result => RESULT_TEM);
				
				
		MUX_NEG: ENTITY work.MUX_NEGATIVE
		PORT MAP(	X				=>		bin_3,
						Y	 			=> 	bin_2,
						SEL_DIG_NEG	=> 	SEL_DIG,
						FLAG_NEG		=> 	FLAG_TEMP);
				
						

	---------------------------------------------------------							
	digit_1: ENTITY work.BIN_TO_SSEG
		PORT MAP(	bin1		=>	bin_1,
						flag	 	=> FLAG_TEMP,
						sseg		=> sseg_1);
						
						
	digit_0: ENTITY work.BIN_TO_SSEG
		PORT MAP(	bin1		=>	bin_0,
						flag	 	=> '0',
						sseg		=> sseg_0);				

END ARCHITECTURE structural;