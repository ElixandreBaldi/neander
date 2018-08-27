library ieee;
use ieee.std_logic_1164.all;

entity transmissor_2_8 is
	port(
        a : in  std_logic_vector(7 downto 0);
        b : in  std_logic_vector(7 downto 0);
        x : in  std_logic;
        s : out std_logic_vector(7 downto 0)
	);
end transmissor_2_8;

architecture comp of transmissor_2_8 is
        component multiplex_2_8 is
	        port(
                a : in  std_logic_vector(7 downto 0);
                b : in  std_logic_vector(7 downto 0);
                x : in  std_logic;
                s : out std_logic_vector(7 downto 0)
	        );
        end component;

        component demultiplex_2_8 is
	        port(
                a : out std_logic_vector(7 downto 0);
                b : out std_logic_vector(7 downto 0);
                x : in  std_logic;
                s : in  std_logic_vector(7 downto 0)
	        );
        end component;  

        signal p  : std_logic_vector(7 downto 0);        

        begin
            x : multiplex_2_8 
            port map(a,b,x,p);

            y : demultiplex_2_8
            port map(p,x,s1,s2);

end architecture;
