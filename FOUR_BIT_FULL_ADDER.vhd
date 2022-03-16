LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY FOUR_BIT_FULL_ADDER IS

	PORT (	INPUT_1_ADDER			:	 IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
				INPUT_2_ADDER			:	 IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
				OUTPUT_ADDER		   :	 OUT STD_LOGIC_VECTOR (7 DOWNTO 0));

END ENTITY FOUR_BIT_FULL_ADDER;

ARCHITECTURE gateLevel OF FOUR_BIT_FULL_ADDER IS

SIGNAL	sC		:  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	s0		:  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL   Cout	:  STD_LOGIC;



BEGIN

	oneBitfulladder_0: ENTITY work.oneBitfulladder
	PORT MAP(	A		=>	INPUT_1_ADDER(0),
					B		=>	INPUT_2_ADDER(0),
					Cin	=>	'0',
					Cout	=>	sC(0),
					s		=>	s0(0)		);
						
	oneBitfulladder_1: ENTITY work.oneBitfulladder
	PORT MAP(	A		=>	INPUT_1_ADDER(1),
					B		=>	INPUT_2_ADDER(1),
					Cin	=>	sC(0),
					Cout	=>	sC(1),
					s		=>	s0(1)	);
	
	oneBitfulladder_2: ENTITY work.oneBitfulladder
	PORT MAP(	A		=>	INPUT_1_ADDER(2),
					B		=>	INPUT_2_ADDER(2),
					Cin	=>	sC(1),
					Cout	=>	sC(2),
					s		=>	s0(2)	);
	
	oneBitfulladder_3: ENTITY work.oneBitfulladder
	PORT MAP(	A		=>	INPUT_1_ADDER(3),
					B		=>	INPUT_2_ADDER(3),
					Cin	=>	sC(2),
					Cout	=>	Cout,
					s		=>	s0(3));
					
	OUTPUT_ADDER  <= 	"000" & Cout & s0;
	

	

END ARCHITECTURE gateLevel;