LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------
ENTITY EIGHTBITFULLADDER IS
	PORT(			A8		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
					B8		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
					Y8		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
														
					
END ENTITY EIGHTBITFULLADDER;
-------------------------------------------------------
ARCHITECTURE structural OF EIGHTBITFULLADDER IS

SIGNAL	sC8	: 	STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	s08	: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL   Cout	:  STD_LOGIC;

BEGIN
	
	oneBitfulladder_0: ENTITY work.ONEBITFULLADDER
	PORT MAP(	A		=>	A8(0),
					B		=>	B8(0),
					Cin	=>	'0',
					Cout	=>	sC8(0),
					s		=>	s08(0));
						
	oneBitfulladder_1: ENTITY work.ONEBITFULLADDER
	PORT MAP(	A		=>	A8(1),
					B		=>	B8(1),
					Cin	=>	sC8(0),
					Cout	=>	sC8(1),
					s		=>	s08(1));
	
	oneBitfulladder_2: ENTITY work.ONEBITFULLADDER
	PORT MAP(	A		=>	A8(2),
					B		=>	B8(2),
					Cin	=>	sC8(1),
					Cout	=>	sC8(2),
					s		=>	s08(2));
	
	oneBitfulladder_3: ENTITY work.ONEBITFULLADDER
	PORT MAP(	A		=>	A8(3),
					B		=>	B8(3),
					Cin	=>	sC8(2),
					Cout	=>	sC8(3),
					s		=>	s08(3));
	
	oneBitfulladder_4: ENTITY work.ONEBITFULLADDER
	PORT MAP(	A		=>	A8(4),
					B		=>	B8(4),
					Cin	=>	sC8(3),
					Cout	=>	sC8(4),
					s		=>	s08(4));
	
	oneBitfulladder_5: ENTITY work.ONEBITFULLADDER
	PORT MAP(	A		=>	A8(5),
					B		=>	B8(5),
					Cin	=>	sC8(4),
					Cout	=>	sC8(5),
					s		=>	s08(5));
	
	oneBitfulladder_6: ENTITY work.ONEBITFULLADDER
	PORT MAP(	A		=>	A8(6),
					B		=>	B8(6),
					Cin	=>	sC8(5),
					Cout	=>	sC8(6),
					s		=>	s08(6));
					
	oneBitfulladder_7: ENTITY work.ONEBITFULLADDER
	PORT MAP(	A		=>	A8(7),
					B		=>	B8(7),
					Cin	=>	sC8(6),
					Cout	=>	Cout,
					s		=>	s08(7));
		
	Y8 <=	s08;	

END ARCHITECTURE structural;