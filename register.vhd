LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg IS
	GENERIC (
		width : INTEGER := 32
	);
	PORT (
		d	: IN	STD_LOGIC_VECTOR(width-1 DOWNTO 0);
		clk,
		reset_n,
		we	: IN	STD_LOGIC;
		q	: OUT	STD_LOGIC_VECTOR(width-1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE beh OF reg IS
BEGIN
PROCESS(clk, reset_n)
BEGIN
	IF (reset_n = '0') THEN
		q <= (others => '0');
	ELSIF (rising_edge(clk)) THEN
		IF (we = '1') THEN
			q <= d;
		END IF;
	END IF;
END PROCESS;
END ARCHITECTURE;
