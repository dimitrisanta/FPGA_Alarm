LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY zoneb IS
	PORT (C3,C4,CLOCK,Sw2 : IN std_logic;
		  S2,LED2 : OUT std_logic);
END ENTITY zoneb;

ARCHITECTURE ZONEB OF zoneb IS
BEGIN
   process (CLOCK)
	 BEGIN
		IF RISING_EDGE(CLOCK) THEN
		  if Sw2 = '1' THEN
		 	LED2 <= '0';
		  	if C3='0' or C4='0' then
				S2 <= '1';
		  	ELSE
				S2 <='0';
		  	end if;
		  else
			S2 <= '0';
			LED2 <= '1';
		  END if;
		end if;
	end process;
end architecture ZONEB;

