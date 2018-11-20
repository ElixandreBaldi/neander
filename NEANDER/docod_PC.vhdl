library ieee;
use ieee.std_logic_1164.all;

entity decod_UC is
	port(        
        p : in  std_logic_vector(7  downto 0);
        s : out std_logic_vector(11 downto 0)
	);
end decod_UC;

architecture comp of decod_UC is
    begin
        s(0)  <= (not(p(0) or p(1) or p(2) or p(3) or p(4) or p(5) or p(6) or p(7)));
        s(1)  <= p(0) and (not(p(1) or p(2) or p(3) or p(4) or p(5) or p(6) or p(7)));
        s(2)  <= p(1) and (not(p(0) or p(2) or p(3) or p(4) or p(5) or p(6) or p(7)));
        s(3)  <= p(1) and p(0) and (not(p(2) or p(3) or p(4) or p(5) or p(6) or p(7)));
        s(4)  <= p(2) and (not(p(0) or p(1) or p(3) or p(4) or p(5) or p(6) or p(7)));
        s(5)  <= p(2) and p(0) and (not(p(1) or p(3) or p(4) or p(5) or p(6) or p(7)));
        s(6)  <= p(2) and p(1) and (not(p(0) or p(3) or p(4) or p(5) or p(6) or p(7)));
        s(7)  <= p(2) and p(1) and p(0) and (not(p(3) or p(4) or p(5) or p(6) or p(7)));
        s(8)  <= p(3) and (not(p(0) or p(1) or p(2) or p(4) or p(5) or p(6) or p(7)));
        s(9)  <= p(3) and p(0) and (not(p(1) or p(2) or p(4) or p(5) or p(6) or p(7)));
        s(10) <= p(3) and p(1) and (not(p(0) or p(2) or p(4) or p(5) or p(6) or p(7)));
        s(11) <= p(3) and p(2) and (not(p(0) or p(1) or p(4) or p(5) or p(6) or p(7)));
end architecture;
