library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Relogio_SS is
	port(
        I   : in std_logic;
		r   : in std_logic;      
		clk : in std_logic;
		p   : in std_logic;
		c_9 : out std_logic_vector(3 downto 0);
        c_5 :  out std_logic_vector(2 downto 0)
	);
end Relogio_SS;

architecture comp of Relogio_SS is    
  
    component Contador_5 is
        port(
            X   : in std_logic;
            r   : in std_logic;      
            clk : in std_logic;
            p   : in std_logic;
            s   : out std_logic_vector(2 downto 0)
        );
    end component;
	
    component Contador_9 is
        port(
            X   : in std_logic;
            r   : in std_logic;      
            clk : in std_logic;
            p   : in std_logic;
            s   : out std_logic_vector(3 downto 0)
        );
    end component;

	signal x : std_logic;
	signal pre : std_logic := '1';
	signal sa : std_logic_vector(3 downto 0);
	
begin
    
        

    x0 : Contador_9
    	port map(I,r,clk,p,sa);
    c_9 <= sa;
    x <= sa(0) and sa(3) and I;
    x1 : Contador_5
    	port map(x,r,clk,p,c_5);
    	    
    	
end architecture;
