library ieee;
use ieee.std_logic_1164.all;

entity porta_AND_8in is
	port(
        a : in std_logic_vector(7 downto 0);
        b : in std_logic_vector(7 downto 0);
        s : out std_logic_vector(7 downto 0)
	);
end porta_AND_8in;

architecture comp of porta_AND_8in is
        component porta_and_2in is
                port(
                        a : in std_logic;
                        b : in std_logic; 
                        s : out std_logic
                );
        end component;
        
        begin
                x0 : porta_and_2in 
                port map(a(0),b(0),s(0));

                x1 : porta_and_2in 
                port map(a(1),b(1),s(1));

                x2 : porta_and_2in 
                port map(a(2),b(2),s(2));

                x3 : porta_and_2in 
                port map(a(3),b(3),s(3));

                x4 : porta_and_2in 
                port map(a(4),b(4),s(4));

                x5 : porta_and_2in 
                port map(a(5),b(5),s(5));

                x6 : porta_and_2in 
                port map(a(6),b(6),s(6));

                x7 : porta_and_2in 
                port map(a(7),b(7),s(7));

end architecture;






