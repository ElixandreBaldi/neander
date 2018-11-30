library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_neander is
end entity;

architecture comp of tb_neander is
    signal clk,cl : std_logic := '0';
    signal in_i : std_logic_vector(7 downto 0);
    
    component neander is
        port(
            clk : in std_logic;
            cl  : in std_logic;
            in_ir : in std_logic_vector(7 downto 0)
        );
    end component;

  begin  
    
    neanders : neander
        port map(clk,cl,in_i);
    
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
        wait for 200 ns;
        in_i <= "00000010";
        wait for 200 ns;
        in_i <= "00000100";
        wait for 200 ns;
        in_i <= "00000101";
        wait for 200 ns;
        in_i <= "00000110";
        wait for 200 ns;
        in_i <= "00000111";
        wait for 200 ns;
        in_i <= "00001000";
        wait for 200 ns;
        in_i <= "00001001";
        wait for 200 ns;
        in_i <= "00000010";
        wait for 200 ns;
        in_i <= "00001010";
        wait for 200 ns;
        in_i <= "00001011";
        wait for 200 ns;
        in_i <= "00000001";
    
        
        wait for 900000 ns;
    end process;
    
    
    
end architecture;
