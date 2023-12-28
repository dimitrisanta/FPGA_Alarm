LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY sensors IS
	PORT (Sen1,Sen2,CLOCK,Sw3 : IN std_logic;
		  S3,LED3 : OUT std_logic);
END ENTITY sensors;

ARCHITECTURE SENSORS OF sensors IS
BEGIN
 process (CLOCK)
	BEGIN
	 IF RISING_EDGE(CLOCK) THEN
		if Sw3 = '1' THEN
			LED3 <= '0';
	   		if Sen1='1' or Sen2='1' then
				 S3 <= '1';
	 		ELSE 
				 S3 <='0';
			end if;
		else
			LED3 <= '1';
			S3 <= '0';
		END if;	
	end if;
	end process;
end architecture SENSORS;
