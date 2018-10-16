library ieee;
use ieee.std_logic_1164.all;

entity multiplex_2_8 is
	port(
        a : in  std_logic_vector(7 downto 0);
        b : in  std_logic_vector(7 downto 0);
        x : in  std_logic;
        s : out std_logic_vector(7 downto 0)
	);
end multiplex_2_8;

architecture comp of multiplex_2_8 is
        component multiplex_2_1 is
	        port(
                a : in  std_logic;
                b : in  std_logic;
                x : in  std_logic;
                s : out std_logic
	        );
        end component;
        
        begin
            x0 : multiplex_2_1 
            port map(a(0),b(0),x,s(0));

            x1 : multiplex_2_1 
            port map(a(1),b(1),x,s(1));

            x2 : multiplex_2_1 
            port map(a(2),b(2),x,s(2));

            x3 : multiplex_2_1 
            port map(a(3),b(3),x,s(3));

            x4 : multiplex_2_1 
            port map(a(4),b(4),x,s(4));

            x5 : multiplex_2_1 
            port map(a(5),b(5),x,s(5));

            x6 : multiplex_2_1 
            port map(a(6),b(6),x,s(6));

            x7 : multiplex_2_1 
            port map(a(7),b(7),x,s(7));

end architecture;
