LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
-------------------------------
ENTITY ONEBITFULLADDER IS
	PORT (	A		:	IN STD_LOGIC;
				B		:	IN STD_LOGIC;
				Cin	:	IN STD_LOGIC;
				Cout  :	OUT STD_LOGIC;
				s		:	OUT STD_LOGIC);
				
END ENTITY ONEBITFULLADDER;
------------------------------
ARCHITECTURE Behavioral OF ONEBITFULLADDER IS 

BEGIN
	
	s		<=		(A XOR(B XOR Cin));
	Cout	<= 	(A AND B) OR (Cin AND A) OR (Cin AND B);

END ARCHITECTURE Behavioral;