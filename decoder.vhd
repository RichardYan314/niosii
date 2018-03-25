LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY decoder IS
	PORT (
		binary_in	: IN	STD_LOGIC_VECTOR;
		onehot_out	: OUT	STD_LOGIC_VECTOR
	);
BEGIN
	ASSERT 2**binary_in'length = onehot_out'length SEVERITY FAILURE;
END ENTITY;

ARCHITECTURE log OF decoder IS
BEGIN
	onehot_out <= (onehot_out'range => '0');
	onehot_out(to_integer(unsigned(binary_in))) <= '1';
END ARCHITECTURE;
