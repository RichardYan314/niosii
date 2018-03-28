LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY proc_mem_intf IS
PORT (
	RZ, PC, RM	: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
	data		: INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	MA_select	: IN	STD_LOGIC;
--	MEM_read	: IN	STD_LOGIC;
	MEM_write	: IN	STD_LOGIC;
	MEM_word	: IN	STD_LOGIC;
	clk		: IN	STD_LOGIC;
	MFC		: OUT	STD_LOGIC
);
END ENTITY;

ARCHITECTURE beh OF proc_mem_intf IS
SIGNAL address : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN

with MA_select SELECT address <=
	RZ WHEN '0',
	PC WHEN OTHERS; -- '1'

ram : ENTITY work.simpRAM PORT MAP (
	data => data,
	address => address,
	we => MEM_write,
	word => MEM_word,
	clk => clk
);

MFC <= '1';

END ARCHITECTURE;
