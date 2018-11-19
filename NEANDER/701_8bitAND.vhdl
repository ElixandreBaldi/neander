library ieee;
use ieee.std_logic_1164.all;

entity AND_8_bit is
	port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		sand : out std_logic_vector(7 downto 0)
	);
end entity;

architecture comportamento of AND_8_bit is 
	component two_in_AND is
		port(
			a : in std_logic;
			b : in std_logic;
			s : out std_Logic
		);
	end component;
	
begin
	And0 : two_in_AND 
	port map(a(0), b(0), sand(0));
	
	And1 : two_in_AND
	port map(a(1), b(1), sand(1));
	
	And2 : two_in_AND
	port map(a(2), b(2), sand(2));
	
	And3 : two_in_AND
	port map(a(3), b(3), sand(3));
	
	And4 : two_in_AND
	port map(a(4), b(4), sand(4));
	
	And5 : two_in_AND
	port map(a(5), b(5), sand(5));
	
	And6 : two_in_AND
	port map(a(6), b(6), sand(6));
	
	And7 : two_in_AND
	port map(a(7), b(7), sand(7));
	
end comportamento;
	
