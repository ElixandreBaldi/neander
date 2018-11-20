library ieee;
use ieee.std_logic_1164.all;


entity neander is


end entity;

architecture comp of neander is

    component ULA is
        port(
            cy      : in  std_logic_vector(7 downto 0);
            cx      : in  std_logic_vector(7 downto 0);
            sel     : in  std_logic_vector(2 downto 0);
            s       : out std_logic_vector(7 downto 0);
            nz      : out std_logic_vector(1 downto 0);
            clock   : in  std_logic;
            clear   : in  std_logic;
            cargaAC : in  std_logic
        );
    end component;
    
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
    
    component block_8_bits is
        port(
            a : in std_logic_vector(7 downto 0);
            p : in std_logic;
            s : out std_logic_vector(7 downto 0)
        );
    end component;

    
    component as_ram is
        port(
            addr  : in    std_logic_vector(7 downto 0);
            data  : inout std_logic_vector(7 downto 0);
            rnotw : in    std_logic;
            notcs : in    std_logic
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
    
    begin
    
    ula : ULA
        port map();
        
    pc : PC
        port map();
        
    ac : REG
        port map();
        
    ir : REG
        port map();
        
    rdm : REG
        port map();
        
    rem : REG
        port map();
    
    rem : REG
        port map();
        
    block_rdm : block_8_bits
        port map();
    
    block_mem : block_8_bits
        port map();
        
    block_ac : block_8_bits
        port map();
        
    mux : multiplex_2_8
        port map();
    
end architecture;
