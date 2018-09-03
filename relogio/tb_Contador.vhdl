library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Contador is
--
end tb_Contador;

architecture comp of tb_Contador is    
  
	component Contador is
		port(
			r : in std_logic;      
			clk : in std_logic;
			p : in std_logic
		);
	end component;

    signal clks: std_logic;
    signal P: std_logic;
    signal R: std_logic;
    
begin
    x0 : Contador
    	port map(R,clks,P);

    R <= '0';
    P <= '1';
    
    process
    	begin                  
        for i in 0 to 100 loop
            clks <= not clks;
            wait for 50 ns;
        end loop;
        wait;
    end process;
    
    
end architecture;
