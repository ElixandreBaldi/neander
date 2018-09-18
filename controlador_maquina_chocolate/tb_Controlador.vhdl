library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Controlador is
--
end tb_Controlador;

architecture comp of tb_Controlador is    
  
	component Controlador is
		port(            
            E : in std_logic_vector(1 downto 0);
            r : in std_logic;
            clk : in std_logic;
            p : in std_logic;
            dispenser: out std_logic;
            cofre: out std_logic;
            saida_moedas: out std_logic
		);
	end component;
	signal E: std_logic_vector(1 downto 0) := "00";
    signal cofre: std_logic := '0';
    signal dispenser: std_logic := '0';
    signal saida_moedas: std_logic := '0';
    signal clks: std_logic := '0';
    signal P: std_logic := '1';
    signal R: std_logic := '0';
    
begin
    x0 : Controlador
    	port map(E,R,clks,P, dispenser, cofre, saida_moedas);    
    
    process
    	begin                  
    	wait for 50 ns;
    	R <= not R;
        for i in 0 to 100 loop
            clks <= not clks;
            wait for 50 ns;
        end loop;
        wait;
    end process;
    
    process
    	begin                      	    	
    	wait for 100 ns;
    	
    	for i in 0 to 100 loop
            E(0) <= '0';
            E(1) <= '0';        
            wait for 50 ns;
            
            E(0) <= '0';
            E(1) <= '1';        
            wait for 50 ns;
            
            E(0) <= '0';
            E(1) <= '1';        
            wait for 50 ns;
            
            E(0) <= '1';
            E(1) <= '0';                      
            wait for 50 ns;
        end loop;
        wait;
    end process;
    
end architecture;
