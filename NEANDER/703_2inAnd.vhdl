library ieee;
use ieee.std_logic_1164.all;

entity two_in_AND is
	port(
		a : in std_logic;
		b : in std_logic;
		s : out std_Logic
	);
end entity;

architecture compandtamento of two_in_AND is
begin
	s <= a and b;
end compandtamento;
		
