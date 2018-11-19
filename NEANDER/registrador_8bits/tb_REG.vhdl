library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_REG is
--
end tb_REG;

architecture comp of tb_REG is
    
    component FF_D_8_bits is
    port(
        d  : in std_logic_vector(7 downto 0);
        pr  : in std_logic;
        cl : in std_logic;
        clk  : in std_logic;        
        q : out std_logic_vector(7 downto 0);
        qn : out std_logic_vector(7 downto 0)
    );
    end component;
    
    component multiplex_2_8 is
	port(
        a : in  std_logic_vector(7 downto 0);
        b : in  std_logic_vector(7 downto 0);
        x : in  std_logic;
        s : out std_logic_vector(7 downto 0)
	);
    end component;


    signal CLKS: std_logic := '0';    
    signal D: std_logic_vector(7 downto 0) := "00000000";
    signal POWER: std_logic := '0'; -- 1 é ativo e 0 é inativo
    signal PR: std_logic := '1';
    signal CL: std_logic := '0';        
    signal Q : std_logic_vector(7 downto 0) := "00000000";
    signal QN: std_logic_vector(7 downto 0);
    signal S: std_logic_vector(7 downto 0) := "00000000";
    
begin
    REG_0 : FF_D_8_bits
    port map(S,PR,CL,CLKS,Q,QN);
    
    MULX_0 : multiplex_2_8
    port map(Q,D, POWER, S);
    
    process
    begin       
        for i in 0 to 100 loop
            POWER <= not POWER;
            wait for 900 ns;
        end loop;
        wait;
    end process;
    
    process
    begin       
        for i in 0 to 1000 loop
            CLKS <= not CLKS;
            wait for 50 ns;
        end loop;
        wait;
    end process;

    process
    begin
        wait for 10 ns;
        CL <= not CL;
        wait for 150 ns;
        for i in 0 to 255 loop
            D <= std_logic_vector(to_unsigned(i,D'length));            
            Wait for 200 ns;
        end loop;
        
        for i in 0 to 255 loop
            D <= std_logic_vector(to_unsigned(i,D'length));            
            Wait for 200 ns;
        end loop;
    wait;
    end process;
end architecture;

