library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Contador_5 is
--
end tb_Contador_5;

architecture comp of tb_Contador_5 is    
  
	component Contador_5 is
		port(
			r : in std_logic;      
			clk : in std_logic;
			p : in std_logic
		);
	end component;

    signal clks: std_logic := '0';
    signal P: std_logic := '1';
    signal R: std_logic := '0';
    
begin
    x0 : Contador_5
    	port map(R,clks,P);    
    
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
    
end architecture;
