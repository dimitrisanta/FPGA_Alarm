LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY clk_div IS
	PORT(	Clock :IN STD_LOGIC ;
			f1Mhz :BUFFER STD_LOGIC;
			f500Khz :BUFFER STD_LOGIC;
			f100Khz :BUFFER STD_LOGIC;
			f10Khz:BUFFER STD_LOGIC;
			f1Khz :BUFFER STD_LOGIC;
			f100hz :BUFFER STD_LOGIC;
			f10hz :BUFFER STD_LOGIC;
			f1hz :BUFFER STD_LOGIC);
END clk_div;


ARCHITECTURE Behavior OF clk_div IS

	signal CountA: STD_LOGIC_VECTOR(4 DOWNTO 0); --G?a t? 1MHZ ?a? 500KHZ
	signal CountB: STD_LOGIC_VECTOR(3 DOWNTO 0); --G?a t? 100KHZ
	signal CountC: STD_LOGIC_VECTOR(3 DOWNTO 0); --G?a t? 10KHZ
	signal CountD: STD_LOGIC_VECTOR(3 DOWNTO 0); --G?a t? 1KHZ
	signal CountE: STD_LOGIC_VECTOR(3 DOWNTO 0); --G?a t? 100HZ
	signal CountF: STD_LOGIC_VECTOR(3 DOWNTO 0); --G?a t? 10HZ
	signal CountG: STD_LOGIC_VECTOR(3 DOWNTO 0); --G?a t? 1HZ

BEGIN

	PROCESS(Clock)
		BEGIN
			IF Clock'EVENT AND Clock='1' THEN
				CASE CountA IS
					WHEN "01100" =>
						f1Mhz <= NOT f1Mhz ;
						CountA <= CountA + '1' ;
					WHEN "11000" =>
						CountA <= "00000" ;
						F500Khz <= NOT f500Khz;
						f1Mhz <= NOT f1Mhz ;
					WHEN OTHERS =>
						CountA <= CountA + '1' ;
				END CASE;
			END IF;
	END PROCESS;

	DIVIDE100k: PROCESS(f1Mhz)
		BEGIN
			IF f1Mhz'EVENT AND f1Mhz='1' THEN
				CASE CountB IS
					WHEN "0100" =>
						f100Khz <= NOT f100Khz ;
						CountB <= CountB + '1' ;
					WHEN "1001" =>
						CountB <= "0000" ;
						f100Khz <= NOT f100Khz ;
					WHEN OTHERS =>
						CountB <= CountB + '1' ;
					END CASE;
			END IF;
		END PROCESS;

	DIVIDE10k: PROCESS(f100Khz)
		BEGIN
			IF f100Khz'EVENT AND f100Khz='1' THEN
				CASE CountC IS
					WHEN "0100" =>
						f10Khz <= NOT f10Khz ;
						CountC <= CountC + '1' ;
					WHEN "1001" =>
						CountC <= "0000" ;
						f10Khz <= NOT f10Khz ;
					WHEN OTHERS =>
						CountC <= CountC + '1' ;
				END CASE;
			END IF;
		END PROCESS;

	DIVIDE1k: PROCESS(f10Khz)
		BEGIN
			IF f10Khz'EVENT AND f10Khz='1' THEN
				CASE CountD IS
					WHEN "0100" =>
						f1Khz <= NOT f1Khz ;
						CountD <= CountD + '1' ;
					WHEN "1001" =>
						CountD <= "0000" ;
						f1Khz <= NOT f1Khz ;
					WHEN OTHERS =>
						CountD <= CountD + '1' ;
				END CASE;
			END IF;
		END PROCESS;

	DIVIDE100: PROCESS(f1Khz)
		BEGIN
			IF f1Khz'EVENT AND f1Khz='1' THEN
				CASE CountE IS
					WHEN "0100" =>
						f100hz <= NOT f100hz ;
						CountE <= CountE + '1' ;
					WHEN "1001" =>
						CountE <= "0000" ;
						f100hz <= NOT f100hz ;
					WHEN OTHERS =>
						CountE <= CountE + '1' ;
				END CASE;
			END IF;
		END PROCESS;

	DIVIDE10: PROCESS(f100hz)
		BEGIN
			IF f100hz'EVENT AND f100hz='1' THEN
				CASE CountF IS
					WHEN "0100" =>
						f10hz <= NOT f10hz ;
						CountF <= CountF + '1' ;
					WHEN "1001" =>
						CountF <= "0000" ;
						f10hz <= NOT f10hz ;
					WHEN OTHERS =>
						CountF <= CountF + '1' ;
				END CASE;
			END IF;
		END PROCESS ;
		
	DIVIDE1: PROCESS(f10hz)
		BEGIN
			IF f10hz'EVENT AND f10hz='1' THEN
				CASE CountG IS
					WHEN "0100" =>
						f1hz <= NOT f1hz ;
						CountG <= CountG + '1' ;
					WHEN "1001" =>
						CountG <= "0000" ;
						f1hz <= NOT f1hz ;
					WHEN OTHERS =>				
						CountG <= CountG + '1' ;
				END CASE;
			END IF;
		END PROCESS;
END Behavior;
