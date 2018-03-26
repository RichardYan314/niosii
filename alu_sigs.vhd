LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE alu_sigs IS
TYPE ALU_op IS (
add,
sub,

srll,
sraa,
slll,
roll,
rorr,
norr,
andd,
orr,
xorr
);

TYPE BR_cond IS
RECORD
	eq,
	ne,
	lt,
	ltu,
	ge,
	geu	: STD_LOGIC;
END RECORD;
END PACKAGE;
