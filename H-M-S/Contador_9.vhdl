library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Contador_9 is
	port(
		r : in std_logic;      
		clk : in std_logic;
        X: in std_logic;
		p : in std_logic;
		s : out std_logic_vector(3 downto 0)
	);
end Contador_9;

architecture comp of Contador_9 is    
  
    component CCC_9 is
		port(
		    Q : in std_logic_vector(3 downto 0);  
		    K : out  std_logic_vector(3 downto 0);
		    J : out  std_logic_vector(3 downto 0)
		);
	end component;
	
	component FF_Contador_9 is
		port(
			K : in  std_logic_vector(3 downto 0);
			J : in  std_logic_vector(3 downto 0);
			R : in std_logic;      
			CLK : in std_logic;
			P : in std_logic;
			B : out std_logic_vector(3 downto 0)
		);
	end component;
    
    signal k : std_logic_vector(3 downto 0);
	signal j : std_logic_vector(3 downto 0);
	signal b : std_logic_vector(3 downto 0) := "0000";  
    
begin
    x0 : CCC_9
    	port map(b,k,j);
    	
    x1 : FF_Contador_9
    	port map(k,j,r,clk,p,b);
    	
    s <= b;
end architecture;
