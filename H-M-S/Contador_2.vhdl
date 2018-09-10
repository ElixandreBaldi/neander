library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Contador_2 is
	port(
		r   : in std_logic;      
		clk : in std_logic;
		p   : in std_logic
	);
end Contador_2;

architecture comp of Contador_2 is    
  
    component CCC_2 is
		port(
		    Q : in std_logic_vector(1 downto 0);        
		    K : out  std_logic_vector(1 downto 0);
		    J : out  std_logic_vector(1 downto 0)       
		);
	end component;
	
	component FF_Contador_2 is
		port(
			K   : in  std_logic_vector(1 downto 0);
			J   : in  std_logic_vector(1 downto 0);
			R   : in std_logic;      
			CLK : in std_logic;
			P   : in std_logic;
			B   : out std_logic_vector(1 downto 0)
		);
	end component;
    
    signal k : std_logic_vector(1 downto 0);
	signal j : std_logic_vector(1 downto 0);
	signal b : std_logic_vector(1 downto 0) := "00";  
    
begin
    x0 : CCC_2
    	port map(b,k,j);
    	
    x1 : FF_Contador_2
    	port map(k,j,r,clk,p,b);
    	
end architecture;
