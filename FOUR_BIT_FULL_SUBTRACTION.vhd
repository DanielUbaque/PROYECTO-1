LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY FOUR_BIT_FULL_SUBTRACTION IS

	PORT (	INPUT_1_SUBTRACTION		:	 IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
				INPUT_2_SUBTRACTION		:	 IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
				OUTPUT_SUBTRACTION	   :	 OUT STD_LOGIC_VECTOR (7 DOWNTO 0));

END ENTITY FOUR_BIT_FULL_SUBTRACTION;

ARCHITECTURE gateLevel OF FOUR_BIT_FULL_SUBTRACTION IS

SIGNAL	RsC		: 		STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	Rs0		: 		STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL   RCout		:		STD_LOGIC;
SIGNAL 	P1 		: 		STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL 	P2 		: 		STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL 	P2N 	   : 		STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL 	RB4		:		STD_LOGIC_VECTOR(3 DOWNTO 0); 
SIGNAL   OUTPUT_SUBTRACTION_CONV	  : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

	COMPARATOR_SUBTRACT_1: ENTITY work.nBitcomparator
	PORT MAP(	x		=>	INPUT_1_SUBTRACTION,
					y		=>	INPUT_2_SUBTRACTION,
					sel1	=>	P1);
					
					
	COMPARATOR_SUBTRACT_2: ENTITY work.nBitcomparator
	PORT MAP(	x		=>	INPUT_1_SUBTRACTION,
					y		=>	INPUT_2_SUBTRACTION,
					sel2	=>	P2);
						
	P2N <= (NOT P2);
	RB4 <= "0001";
	
	oneBitfulladder_0s: ENTITY work.oneBitfulladder
	PORT MAP(	A		=>	P2N(0),
					B		=>	RB4(0),
					Cin	=>	'0',
					Cout	=>	RsC(0),
					s		=>	Rs0(0));
						
	oneBitfulladder_1s: ENTITY work.oneBitfulladder
	PORT MAP(	A		=>	P2N(1),
					B		=>	RB4(1),
					Cin	=>	RsC(0),
					Cout	=>	RsC(1),
					s		=>	Rs0(1)	);
	
	oneBitfulladder_2s: ENTITY work.oneBitfulladder
	PORT MAP(	A		=>	P2N(2),
					B		=>	RB4(2),
					Cin	=>	RsC(1),
					Cout	=>	RsC(2),
					s		=>	Rs0(2));
	
	oneBitfulladder_3s: ENTITY work.oneBitfulladder
	PORT MAP(	A		=>	P2N(3),
					B		=>	RB4(3),
					Cin	=>	RsC(2),
					Cout	=>	RCout,
					s		=>	Rs0(3));
					
	fourBitfullsubtractor: ENTITY work.FOUR_BIT_FULL_ADDER
	PORT MAP(	INPUT_1_ADDER		=>	  P1,
					INPUT_2_ADDER		=>	  Rs0,
					OUTPUT_ADDER      =>   OUTPUT_SUBTRACTION);
					
END ARCHITECTURE gateLevel;