library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tbPc is
    --
end entity;

architecture comp of tbPc is

    component PC is
        port(
            clk  : in std_logic;
            cl   : in std_logic;
            barr : in std_logic_vector(7 downto 0);
            inc_PC : in std_logic;
            c_PC : in std_logic;
            s    : out std_logic_vector(7 downto 0)
        );
    end component;

    signal bb,saida : std_logic_vector(7 downto 0);
    signal carga,clk,cl,inc : std_logic:='0';        

    begin
        xc : PC
        port map(clk,cl,bb,inc,carga,saida);
    

        U_CLOCK: process
            begin
                clk <= not(clk);
                wait for 10 ns;
        end process;

        U_inc: process
            begin
                bb <= std_logic_vector(to_unsigned(0,bb'length));
                inc <= not(inc);
                wait for 50 ns;
        end process;


        U_TBPC: process
            begin
                wait for 50 ns;
                cl <= '1';
                
                for i in 0 to 5 loop
                    wait for 50 ns;
                end loop;
        end process;
end architecture;
