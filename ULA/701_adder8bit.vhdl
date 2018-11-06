library ieee;
use ieee.std_logic_1164.all;

entity adder_8_bit is
	port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		te :in std_logic;
		s : out std_logic_vector(7 downto 0);
		ts : out std_logic
	);
end entity;

architecture comportamento of adder_8_bit is
	component adder_1_bit is
			port(
			a : in std_logic;
			b : in std_logic;
			te : in std_logic;
			s : out std_Logic;
			ts : out std_logic
		);
	end component;
	
	signal ts0, ts1, ts2 , ts3, ts4, ts5, ts6 : std_logic;
begin
	b0: adder_1_bit
	port map(a(0),b(0),te,s(0),ts0);
	
	b1: adder_1_bit
	port map(a(1),b(1),ts0,s(1),ts1);
	
	b2: adder_1_bit
	port map(a(2),b(2),ts1,s(2),ts2);
	
	b3: adder_1_bit
	port map(a(3),b(3),ts2,s(3),ts3);
	
	b4: adder_1_bit
	port map(a(4),b(4),ts3,s(4),ts4);
	
	b5: adder_1_bit
	port map(a(5),b(5),ts4,s(5),ts5);
	
	b6: adder_1_bit
	port map(a(6),b(6),ts5,s(6),ts6);
	
	b7: adder_1_bit
	port map(a(7),b(7),ts6,s(7),ts);
	
end comportamento;
		
