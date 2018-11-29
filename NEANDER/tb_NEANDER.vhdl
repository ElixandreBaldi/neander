library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_neander is
end entity;

architecture comp of tb_neander is
    signal clk,cl : std_logic := '0';
    
    component neander is
        port(
            clk : in std_logic;
            cl  : in std_logic
        );
    end component;

  begin  
    
    neanders : neander
        port map(clk,cl);
    
    U_CLOCK: process
    begin
        clk <= not(clk);
        wait for 10 ns;
    end process;
    
    proc: process
    begin  
        --cl <= '0';
        wait for 500 ns;        
        cl <= '1';
        wait for 900000 ns;
    end process;
    
    
    
end architecture;
