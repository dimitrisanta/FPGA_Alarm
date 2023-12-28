LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY mainalarm IS
	PORT (Zone1,Zone2,Sensors,ArmedUnarmed,clk  : IN std_logic;
		  LED1,LED2,LED3,LED4: OUT std_logic;
		  Alarm : OUT std_logic :='0');
		  

END ENTITY mainalarm;

ARCHITECTURE alarm OF mainalarm IS
BEGIN
process (clk)
	BEGIN
	IF RISING_EDGE(clk) THEN
		   if (ArmedUnarmed = '1') then
			 LED4 <= '0';
			  	if (Zone1 = '1') then
					Alarm <= '1';
					LED1 <= '0';
				else
					LED1 <= '1';
				END if;
				if (Zone2 = '1') then
					Alarm <= '1';
					LED2 <= '0';
				else
					LED2 <= '1';
				END if;
				if (Sensors = '1') then
					Alarm <= '1';
					LED3 <= '0';
				else
					LED3 <= '1';
				END if;
			   
		   else
			  LED4 <= '1';
			  LED3 <= '1';
			  LED2 <= '1';
			  LED1 <= '1';
			  Alarm <= '0';
		   END if;
		END if;
	END process;
END architecture alarm;
