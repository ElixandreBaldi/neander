library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity;

architecture comp of tb is
    component ULA is
        port(
            cy      : in std_logic_vector(7 downto 0);
            cx      : in std_logic_vector(7 downto 0);
    
            sel     : in  std_logic_vector(2 downto 0);
            s       : out std_logic_vector(7 downto 0);
              
            nz      : out std_logic_vector(1 downto 0);
    
            clock   : in std_logic;
            clear   : in std_logic;
    
            cargaAC : in std_logic
        );
    end component;

        signal cy,cx,s : std_logic_vector(7 downto 0);
        signal sel : std_logic_vector(2 downto 0);
        signal nz : std_logic_vector(1 downto 0);
        signal clk,clear,cAC : std_logic:= '0';



begin
    x0: ULA
    port map(cy,cx,sel,s,nz,clk,clear,cAC);

    U_CLOCK: process
    begin
        clk <= not(clk);
        wait for 10 ns;
    end process;


    U_TBREG: process
        begin
            wait for 50 ns;
            clear <= '1';
            
            for i in 0 to 5 loop
                cx <= std_logic_vector(to_unsigned(2,cx'length));
                cy <= std_logic_vector(to_unsigned(3,cy'length));
                sel <= std_logic_vector(to_unsigned(i,sel'length));
                
                wait for 50 ns;

            end loop;


    end process;

end architecture;