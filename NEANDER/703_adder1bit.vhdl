library ieee;
use ieee.std_logic_1164.all;

entity adder_1_bit is
	port(
		a : in std_logic;
		b : in std_logic;
		te : in std_logic;
		s : out std_Logic;
		ts : out std_logic
	);
end entity;

architecture compandtamento of adder_1_bit is
begin
	s <= (a xor b) xor te;
	ts <= (b and te) or (a and te) or (a and b);
end compandtamento;
		
