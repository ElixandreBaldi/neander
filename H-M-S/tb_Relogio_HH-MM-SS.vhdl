library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Relogio_HH_MM_SS is
--
end tb_Relogio_HH_MM_SS;

architecture comp of tb_Relogio_HH_MM_SS is    
  
    component Relogio_HH_MM_SS is
        port(
            I   : in std_logic;
            r   : in std_logic;      
            clk : in std_logic;
            p   : in std_logic;
            flag  : out std_logic;
            c_9_s :  out std_logic_vector(3 downto 0);
            c_5_s :  out std_logic_vector(2 downto 0);
            c_9_m :  out std_logic_vector(3 downto 0);
            c_5_m :  out std_logic_vector(2 downto 0);
            c_9_h :  out std_logic_vector(3 downto 0);
            c_2_h :  out std_logic_vector(1 downto 0)
        );
    end component;

    signal I    : std_logic := '1';
    signal clks : std_logic := '0';
    signal P    : std_logic := '1';
    signal R    : std_logic := '0';
    signal c9_s : std_logic_vector(3 downto 0);
    signal c5_s : std_logic_vector(2 downto 0);
    signal c9_m : std_logic_vector(3 downto 0);
    signal c5_m : std_logic_vector(2 downto 0);
    signal c9_h : std_logic_vector(3 downto 0);
    signal c2_h : std_logic_vector(1 downto 0);
    signal flag : std_logic;
    
    
begin
    x0 : Relogio_HH_MM_SS
    	port map(I,R,clks,P,flag,c9_s,c5_s,c9_m,c5_m,c9_h,c2_h);
    
    process
    	begin                  
    	wait for 50 ns;
    	R <= '1';
        for i in 0 to 99999999 loop
            clks <= not clks;
            wait for 50 ns;
            R <= not flag;
        end loop;
        wait;
    end process;
    
end architecture;
