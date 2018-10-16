library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Relogio_MM_SS is
--
end tb_Relogio_MM_SS;

architecture comp of tb_Relogio_MM_SS is    
  
    component Relogio_MM_SS is
        port(
            I: in std_logic;
            r : in std_logic;      
            clk : in std_logic;
            p : in std_logic;
            c_9_s : out std_logic_vector(3 downto 0);
            c_5_s :  out std_logic_vector(2 downto 0);
            c_9_m : out std_logic_vector(3 downto 0);
            c_5_m :  out std_logic_vector(2 downto 0)
        );
    end component;

    signal I : std_logic := '1';
    signal clks: std_logic := '0';
    signal P: std_logic := '1';
    signal R: std_logic := '0';
    signal c9_s : std_logic_vector(3 downto 0);
    signal c5_s : std_logic_vector(2 downto 0);
    signal c9_m : std_logic_vector(3 downto 0);
    signal c5_m : std_logic_vector(2 downto 0);
    
    
begin
    x0 : Relogio_MM_SS
    	port map(I,R,clks,P,c9_s,c5_s,c9_m,c5_m);
    
    process
    	begin                  
    	wait for 50 ns;
    	R <= not R;
        for i in 0 to 10000 loop
            clks <= not clks;
            wait for 50 ns;
        end loop;
        wait;
    end process;
    
end architecture;
