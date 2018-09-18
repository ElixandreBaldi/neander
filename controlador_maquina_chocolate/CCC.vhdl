library ieee;
use ieee.std_logic_1164.all;

entity CCC is
	port(
        Q : in std_logic_vector(2 downto 0);        
        K : out  std_logic_vector(2 downto 0);
        J : out  std_logic_vector(2 downto 0)       
	);
end CCC;

architecture comp of CCC is
    begin
        K(0) <= '1';
        J(0) <= '1';
      	K(1) <= not Q(2) and Q(1) and Q(0);
      	J(1) <= not Q(2) and not Q(1) and Q(0);
      	K(2) <= '1';
      	J(2) <= '0';
end architecture comp;


