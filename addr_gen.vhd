LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY addr_gen IS
PORT (
	RA		: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
	clk		: IN	STD_LOGIC;
	reset_n		: IN	STD_LOGIC;
	PC_select	: IN	STD_LOGIC;
	PC_enable	: IN	STD_LOGIC;
	INC_select	: IN	STD_LOGIC;
	imm32		: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
	PC_OUT		: OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
	ret_addr	: OUT	STD_LOGIC_VECTOR
);
END ENTITY;

ARCHITECTURE beh OF addr_gen IS
SIGNAL MuxPCout : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL PC_OUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MuxINCout : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL AdderOut : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN

WITH PC_select SELECT MuxPCout <=
	RA		WHEN '0',
	AdderOut	WHEN '1';

pc : ENTITY work.reg PORT MAP (
	d	=> MuxPCout,
	clk	=> clk,
	reset_n	=> reset_n,
	we	=> PC_enable,
	q	=> PC_out
);

pc_temp : ENTITY work.reg PORT MAP (
	d	=> PC_out,
	clk	=> clk,
	we	=> '1',
	q	=> ret_addr
);

addr

END ARCHITECTURE;
