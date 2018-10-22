library ieee;
use ieee.std_logic_1164.all;

entity block_8_bits is
	port(
        a : in std_logic_vector(7 downto 0);
        p : in std_logic;
        s : out std_logic_vector(7 downto 0)
	);
end block_8_bits;

architecture comp of block_8_bits is
      begin
        s <= a when p = '1' else ( others => 'Z');
end architecture;






