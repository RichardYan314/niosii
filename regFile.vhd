LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY regFile IS
	PORT (
		regA,
		regB,
		regC	: IN	STD_LOGIC_VECTOR(4 DOWNTO 0);
		A,
		B	: OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
		C	: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
		clk,
		reset_n,
		RF_write : IN	STD_LOGIC
	);
END ENTITY;

ARCHITECTURE log OF regFile IS
SIGNAL regwes	: STD_LOGIC_VECTOR(31 DOWNTO 0);

TYPE aov IS ARRAY(natural range <>) of STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL regouts	: aov(31 DOWNTO 0);

BEGIN

dec1 : entity work.decoder PORT MAP (
	binary_in	=> C,
	onehot_out	=> regwes
);

regouts(0) <= (OTHERS => '0');

gen_regs:
FOR i IN 31 DOWNTO 1 GENERATE
SIGNAL we : STD_LOGIC;
BEGIN
	we <= regwes(i) and RF_write;
	reg : entity work.reg PORT MAP (
		d	=> C,
		clk	=> clk,
		reset_n	=> reset_n,
		we	=> we,
		q	=> regouts(i)
	);
END GENERATE gen_regs;
END ARCHITECTURE;
