library ieee;
use ieee.std_logic_1164.all;

entity CCC_2 is
	port(
        X : in std_logic;
        Q : in std_logic_vector(1 downto 0);        
        K : out  std_logic_vector(1 downto 0);
        J : out  std_logic_vector(1 downto 0)       
	);
end CCC_2;

architecture comp of CCC_2 is
    begin
        K(0) <= '1' and X;        
        J(0) <= (not Q(1) and not Q(0)) and X;
      	K(1) <= '1' and X;
      	J(1) <= (not Q(1) and Q(0)) and X;
end architecture comp;


