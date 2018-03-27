LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.alu_sigs.all;

ENTITY datapath IS
PORT (
	regA, regB		: IN	STD_LOGIC_VECTOR(4 DOWNTO 0);
	RF_write		: IN	STD_LOGIC;
	IR26_22, IR21_17, link	: IN	STD_LOGIC_VECTOR(4 DOWNTO 0);
	C_select		: IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
	imm32			: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
	B_select		: IN	STD_LOGIC;
	alu_op			: IN	ALU_op;
	br_cond			: OUT	BR_cond;
	mem_addr		: OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
	mem_data		: INOUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
	return_addr		: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
	Y_select		: IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
	clk			: IN	STD_LOGIC;
	reset_n			: IN	STD_LOGIC
);
END ENTITY;

ARCHITECTURE log OF datapath IS
SIGNAL regC : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL A, B, RBout, InA, InB, ALU_out, RZout, RYout : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL muxBout, muxYout : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN

WITH C_select SELECT regC <=
	IR26_22 WHEN "00",
	IR21_17 WHEN "01",
	LINK    WHEN OTHERS; -- "10"

rf: ENTITY work.regFile PORT MAP (
	regA, regB, regC, A, B, RYout, clk, reset_n, RF_write
);

RA: ENTITY work.reg PORT MAP (
	A, clk, reset_n, '1', InA
);

RB: ENTITY work.reg PORT MAP (
	B, clk, reset_n, '1', RBout
);

WITH B_select SELECT MuxBout <=
	RBout WHEN '0',
	imm32 WHEN OTHERS; -- '1'

InB <= MuxBout;

alu: ENTITY work.alu PORT MAP (
	InA	=> InA,
	InB	=> InB,
	alu_op	=> alu_op,
	br_cond => br_cond,
	ALU_out	=> ALU_out
);

RZ: ENTITY work.reg PORT MAP (
	ALU_out, clk, reset_n, '1', RZout
);

mem_addr <= RZout;

RM: ENTITY work.reg PORT MAP (
	RBout, clk, reset_n, '1', mem_data
);

WITH Y_select SELECT MuxYout <=
	RZout		WHEN "00",
	mem_data	WHEN "01",
	return_addr	WHEN OTHERS; -- "02"

RY: ENTITY work.reg PORT MAP (
	muxYout, clk, reset_n, '1', RYout
);

END ARCHITECTURE;
