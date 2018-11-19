library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC is
    port(
        clk  : in std_logic;
        cl   : in std_logic;
        barr : in std_logic_vector(7 downto 0);
        inc_PC : in std_logic;
        c_PC : in std_logic;
        s    : out std_logic_vector(7 downto 0)
    );
end PC;
architecture comp of PC is

    component REG is
        port(
            clk : in  std_logic;
            cl  : in  std_logic;
            pr  : in  std_logic;
            c   : in  std_logic;
            b   : in  std_logic_vector(7 downto 0);
            s   : out std_logic_vector(7 downto 0)
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

    component somador_8_bits is
        port(
            a  : in  std_logic_vector(7 downto 0);
            b  : in  std_logic_vector(7 downto 0);
            te : in  std_logic;
            s  : out std_logic_vector(7 downto 0);
            ts : out std_logic
        );
    end component;
        signal  S_mux,saida_REG : std_logic_vector(7 downto 0);        
        signal  saida_sum : std_logic_vector(7 downto 0);
        signal  tsaida : std_logic;        
    begin        
        
        x1 : multiplex_2_8
        port map(barr,saida_sum,inc_PC,S_mux);

        x2 : REG
        port map(clk,cl,'1',c_PC,S_mux,saida_REG);

        x3 : somador_8_bits
        port map("00000001",saida_REG,'0',saida_sum,tsaida);
        
        s <= saida_REG;
end comp;
