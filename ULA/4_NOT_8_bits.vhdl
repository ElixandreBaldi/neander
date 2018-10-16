library ieee;
use ieee.std_logic_1164.all;

entity porta_NOT_8in is
	port(
        a : in std_logic_vector(7 downto 0);
        s : out std_logic_vector(7 downto 0)
	);
end porta_NOT_8in;

architecture comp of porta_NOT_8in is
      begin
            s(0) <= not a(0);
            s(1) <= not a(1);
            s(2) <= not a(2);
            s(3) <= not a(3);
            s(4) <= not a(4);
            s(5) <= not a(5);
            s(6) <= not a(6);
            s(7) <= not a(7);
end architecture;






