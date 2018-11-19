library ieee;
use ieee.std_logic_1164.all;

entity shiftL_8_bits is
	port(
        a : in std_logic_vector(7 downto 0);
        s : out std_logic_vector(7 downto 0)
	);
end shiftL_8_bits;

architecture comp of shiftL_8_bits is
    begin
          s(0) <= '0';
          s(1) <=  a(0);
          s(2) <=  a(1);
          s(3) <=  a(2);
          s(4) <=  a(3);
          s(5) <=  a(4);
          s(6) <=  a(5);
          s(7) <=  a(6);
end architecture;
