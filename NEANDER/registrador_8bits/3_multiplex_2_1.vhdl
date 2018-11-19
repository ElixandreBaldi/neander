library ieee;
use ieee.std_logic_1164.all;

entity multiplex_2_1 is
	port(
        a : in  std_logic;
        b : in  std_logic;
        x : in  std_logic;
        s : out std_logic
	);
end multiplex_2_1;

architecture comp of multiplex_2_1 is
    begin
        s <= (a and (not x)) or (b and x);
end architecture comp;
