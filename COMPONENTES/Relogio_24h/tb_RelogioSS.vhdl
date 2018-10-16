library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Relogio_SS is
--
end tb_Relogio_SS;

architecture comp of tb_Relogio_SS is    
  
    component Relogio_SS is
        port(
            I: in std_logic;
            r : in std_logic;      
            clk : in std_logic;
            p : in std_logic;
            c_9 : out std_logic_vector (3 downto 0);
            c_5 :  out std_logic_vector(2 downto 0)
        );
    end component;

    signal clks: std_logic := '0';
    signal P: std_logic := '1';
    signal R: std_logic := '0';
    signal c9 : std_logic_vector(3 downto 0);
    signal c5 : std_logic_vector(2 downto 0);
    signal I : std_logic := '1';
    
begin
    x0 : Relogio_SS
    	port map(I,R,clks,P,c9,c5);
    
    process
    	begin                  
    	wait for 50 ns;
    	R <= not R;
        for i in 0 to 1000 loop
            clks <= not clks;
            wait for 50 ns;
        end loop;
        wait;
    end process;
    
end architecture;
