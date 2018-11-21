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
    
    component decod_UC is
        port(        
            p : in  std_logic_vector(7  downto 0);
            s : out std_logic_vector(11 downto 0)
        );
    end component;
    
    signal C_pc , C_rem , C_rdm , C_ac , C_ir , Sel , selPCpp , r_not , blk clk , cl : std_logic;
    
    signal B0,B1, B2, B3, B4, B5, B6, B7, B8 : std_logic_vector( 7 downto 0);
    
    signal sel_ULA : std_logic_vector( 2 downto 0); 
    
    signal NZ : std_logic_vector(1 downto 0);
    
    signal cmds : std_logic_vector(11);
    
    begin
    
    ula : ULA
        port map(B7, B0, sel_ULA, B6 , NZ , clk , cl C_ac);
        
    pc : PC
        port map(clk , cl , B0 , selPCpp , C_pc , B5);
        
    ac : REG
        port map(clk , cl , '1' , C_ac , B6 , B7);
        
    ir : REG
        port map(clk , cl , '1' , C_ir , B0 , B8);
        
    rdm : REG
        port map(clk , cl , '1' , C_rdm , B1 , B2);
        
    rem : REG
        port map(clk , cl , '1' , C_rem , B4 , B3);
        
    block_rdm : block_8_bits
        port map(B2 , blk , B0);
    
    block_mem : block_8_bits
        port map(B0 , blk , B1);
        
    block_ac : block_8_bits
        port map(B7 , not(blk) , B0);
        
    mux : multiplex_2_8
        port map(B5 , B0 , sel , B4);
        
    decodUC : decod_UC
        port map(B8 , cmds);
    
end architecture;
