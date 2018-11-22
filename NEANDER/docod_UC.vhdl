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
        s(0)   <= (not(p(4) or p(5) or p(6) or p(7)));
        s(1)   <= p(4) and (not(p(5) or p(6) or p(7)));
        s(2)   <= p(5) and (not(p(4) or p(6) or p(7)));
        s(3)   <= p(4) and p(5) and (not(p(6) or p(7)));
        s(4)   <= p(6) and (not(p(4) or p(5) or p(7)));
        s(5)   <= p(6) and p(4) and (not(p(5) or p(7)));
        s(6)   <= p(6) and p(5) and (not(p(4) or p(7)));
        s(7)   <= p(4) and p(5) and p(6) and (not p(7));
        s(8)   <= p(7) and (not(p(4) or p(5) or p(6)));
        s(9)   <= p(7) and p(4) and (not(p(5) or p(6)));
        s(10)  <= p(7) and p(5) and (not(p(4) or p(6)));
        s(11)  <= p(4) and p(5) and p(6) and p(7);
end architecture;
