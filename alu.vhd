LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.alu_sigs.all;

ENTITY alu IS
PORT (
	InA, InB	: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
	alu_op		: IN	ALU_op;
	br_cond		: OUT	BR_cond
);
END ENTITY;

ARCHITECTURE log OF alu IS
BEGIN
END ARCHITECTURE;
