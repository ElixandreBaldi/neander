library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_FF is
--
end tb_FF;

architecture comp of tb_FF is
    
    component FF is
	    port(
            clk : in  std_logic;
            J : in  std_logic;
            K : in  std_logic;
            PR: in  std_logic;
            CL: in  std_logic;        
            Q : out std_logic;
            Qn : out std_logic
	    );
    end component;

    signal clks: std_logic := '0';
    signal j : std_logic;
    signal k : std_logic;
    signal pr: std_logic;
    signal cl: std_logic;        
    signal q : std_logic;
    signal qn:std_logic;    
    
begin
    x0 : FF
    port map(clks,j,k,pr,cl,q,qn);
    
    cl <= '0';
    pr <= '1';
    

    process
    begin                  
    
        for i in 0 to 100 loop
            clks <= not clks;
            wait for 50 ns;
        end loop;
        wait;
    end process;

    process
    begin       
    
        j <= '0';
        k <= '0';
        wait for 100 ns;        

        j <= '0';
        k <= '1';
        wait for 100 ns;

        j <= '1';
        k <= '0';
        wait for 100 ns;

        j <= '1';
        k <= '1';
        wait for 100 ns;

    wait;
    end process;
end architecture;

