library ieee;
use ieee.std_logic_1164.all;

entity demultiplex_2_1 is
	port(
        a : out std_logic;
        b : out std_logic;
        x : in  std_logic;
        s : in  std_logic
	);
end demultiplex_2_1;

architecture comp of demultiplex_2_1 is
    begin
        a <= s and (not x);
        b <= s and b;
end architecture comp;
