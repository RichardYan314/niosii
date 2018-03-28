LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_textio.all;

ENTITY simpRam IS
GENERIC (
	ADDR_WIDTH : INTEGER := 10
);
PORT (
	data	: INOUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
	address	: IN	STD_LOGIC_VECTOR(ADDR_WIDTH-1 DOWNTO 0);
	we	: IN	STD_LOGIC;
	word	: IN	STD_LOGIC;
	clk	: IN	STD_LOGIC
);
END ENTITY;

ARCHITECTURE beh OF simpRam IS
SIGNAL addr_tmp : STD_LOGIC_VECTOR(address'range);
SIGNAL addr : INTEGER RANGE 0 TO (2**(address'left + 1));
SUBTYPE byte IS STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE mem IS ARRAY(2**ADDR_WIDTH-1 DOWNTO 0) OF byte;
SIGNAL ram : mem;
BEGIN

WITH word SELECT addr_tmp <=
	address WHEN '1',
	address(address'high DOWNTO 2) & "00" WHEN OTHERS; -- '0'
	
addr <= to_integer(unsigned(addr_tmp));


PROCESS (clk) IS

BEGIN
	

	IF (rising_edge(clk)) THEN
		IF (we = '1') THEN
			ram(addr) <= data(7 DOWNTO 0);
			IF (word = '1') THEN
				ram(addr+1) <= data(15 DOWNTO 8);
				ram(addr+2) <= data(23 DOWNTO 16);
				ram(addr+3) <= data(31 DOWNTO 24);
			END IF;
		ELSE -- we = '0'
			data(7 DOWNTO 0) <= ram(addr);
			IF (word = '1') THEN
				data(15 DOWNTO 8) <= ram(addr+1);
				data(23 DOWNTO 16) <= ram(addr+1);
				data(31 DOWNTO 24) <= ram(addr+1);
			ELSE -- word = '0'
				data(31 DOWNTO 8) <= (OTHERS => '0');
			END IF;
		END IF;
	END IF;
END PROCESS;

END ARCHITECTURE;
