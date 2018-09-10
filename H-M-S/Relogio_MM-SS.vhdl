library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Relogio_MM_SS is
	port(
		I   : in std_logic;
		r   : in std_logic;      
		clk : in std_logic;
		p   : in std_logic;
		c_9_s :  out std_logic_vector(3 downto 0);
        c_5_s :  out std_logic_vector(2 downto 0);
		c_9_m :  out std_logic_vector(3 downto 0);
        c_5_m :  out std_logic_vector(2 downto 0)
	);
end Relogio_MM_SS;

architecture comp of Relogio_MM_SS is    
  
   component Relogio_SS is
	port(
        I   : in std_logic;X: in std_logic;
		r   : in std_logic;      
		clk : in std_logic;
		p   : in std_logic;
		c_9 : out std_logic_vector(3 downto 0);
        c_5 : out std_logic_vector(2 downto 0)
	);
    end component;

	signal x   : std_logic;
	--signal pp   : std_logic;
	
	signal c9s : std_logic_vector(3 downto 0) := "0000";
    signal c5s : std_logic_vector(2 downto 0) := "000";
    
	signal c9m : std_logic_vector(3 downto 0):= "0000";
    signal c5m : std_logic_vector(2 downto 0):= "000";
    
    
    
	
begin
    x <= c9s(3) and c9s(0) and c5m(2) and c5m(0);
    
    c_9_s <= c9s;
    c_5_s <= c5s;
    c_9_m <= c9m;
    c_5_m <= c5m;

    x0 : Relogio_SS
    	port map(x,r,clk,p,c9m,c5m);
    	
    x1 : Relogio_SS
    	port map(I,r,clk,p,c9s,c5s);
    	
end architecture;
