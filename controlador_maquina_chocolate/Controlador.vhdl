library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Controlador is
	port(
        E : in std_logic_vector(1 downto 0);
		r : in std_logic;
		clk : in std_logic;
		p : in std_logic;
		dispenser: out std_logic;
		cofre: out std_logic;
		saida_moedas: out std_logic
	);
end Controlador;

architecture comp of Controlador is    
  
    component CCC is
		port(
		    Q : in std_logic_vector(2 downto 0);        
		    K : out  std_logic_vector(2 downto 0);
		    J : out  std_logic_vector(2 downto 0)       
		);
	end component;
	
	component FF_Controlador is
		port(
			K : in  std_logic_vector(2 downto 0);
			J : in  std_logic_vector(2 downto 0);
			R : in std_logic;      
			CLK : in std_logic;
			P : in std_logic;
			B : out std_logic_vector(2 downto 0)
		);
	end component;
    
    signal k : std_logic_vector(2 downto 0);
	signal j : std_logic_vector(2 downto 0);
	signal b : std_logic_vector(2 downto 0) := "000";  
	signal bs : std_logic_vector(2 downto 0) := "000";  
    
begin
    x0 : CCC
    	port map(bs,k,j);
    	
    x1 : FF_Controlador
    	port map(k,j,r,clk,p,b);    	      
    
    bs(2) <= (b(2) and b(1)) or 
            (b(1) and E(1)) or 
            ((not b(2)) and E(1) and E(0)) or
            ((not b(2)) and b(1) and b(2) and E(0));
        
    bs(1) <= (b(2) and b(1)) or 
            ((not b(2)) and (not b(1)) and E(1)) or 
            (b(1) and (not b(0)) and (not E(1))) or
            (b(1) and E(1) and E(0)) or
            (b(1) and b(0) and (not E(0))) or
            ((not b(2)) and (not b(1)) and b(0) and E(0));
            
    bs(0) <= (b(2) and b(1)) or
            ((not b(2)) and b(0) and (not E(0))) or
            ((not b(2)) and E(1) and E(0)) or
            ((not b(2)) and (not b(0)) and E(0));
    
    dispenser <= b(0) and (not b(1)) and (not b(2));
    cofre <= b(0) and (not b(1)) and (not b(2));
    saida_moedas <= b(0) and b(1) and (not b(2));   
    
end architecture;
