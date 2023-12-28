LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY zonea IS
	PORT (C1,C2,CLOCK,Sw1: IN std_logic;
		  S,LED1 : OUT std_logic);
END ENTITY zonea;

ARCHITECTURE ZONEA OF zonea IS
BEGIN
process (CLOCK)
	BEGIN
		IF RISING_EDGE(CLOCK) THEN
			if (Sw1 = '1') THEN
		   		LED1 <= '0';
		   		if C1='1' or C2='1' then
					S <= '1';
				ELSE 
					S <='0';
				END if;
			else
				LED1 <= '1';
				S <= '0';
			END if;
	    END if;
	end process;
end architecture ZONEA;



