library ieee;
use ieee.std_logic_1164.all;

entity demultiplex_2_8 is
	port(
        a : out std_logic_vector(7 downto 0);
        b : out std_logic_vector(7 downto 0);
        x : in  std_logic;
        s : in  std_logic_vector(7 downto 0)
	);
end demultiplex_2_8;

architecture comp of demultiplex_2_8 is
        component demultiplex_2_1 is
	        port(
                a : out std_logic;
                b : out std_logic;
                x : in  std_logic;
                s : in  std_logic
	        );
        end component;
        
        begin
            x0 : demultiplex_2_1 
            port map(a(0),b(0),x,s(0));

            x1 : demultiplex_2_1 
            port map(a(1),b(1),x,s(1));

            x2 : demultiplex_2_1 
            port map(a(2),b(2),x,s(2));

            x3 : demultiplex_2_1 
            port map(a(3),b(3),x,s(3));

            x4 : demultiplex_2_1 
            port map(a(4),b(4),x,s(4));

            x5 : demultiplex_2_1 
            port map(a(5),b(5),x,s(5));

            x6 : demultiplex_2_1 
            port map(a(6),b(6),x,s(6));

            x7 : demultiplex_2_1 
            port map(a(7),b(7),x,s(7));
end architecture;
