library ieee;
use ieee.std_logic_1164.all;


entity neander is
    port(
        clk : in std_logic;
        cl  : in std_logic
    );
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
    
    component UC is
        port(        
        inst : in std_logic_vector(11 downto 0);
        clk  : in std_logic;
        cl   : in std_logic;
        nz   : in std_logic_vector(1 downto 0);
        c_ac :      out std_logic;
        sel_ula:    out std_logic_vector(2 downto 0);
        c_PC:       out std_logic;
        sel_PC:     out std_logic;
        sel_mux :   out std_logic;
        c_rem :     out std_logic;
        c_rdm  :    out std_logic;
        bloqueios : out std_logic;
        r_notW :    out std_logic;
        c_ri :      out std_logic
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
    
    signal C_pc , C_rem , C_rdm , C_ac , C_ir , Sel , selPCpp , r_not , blk, blkn : std_logic;
    
    signal B0,B1, B2, B3, B4, B5, B6, B7, B8 : std_logic_vector( 7 downto 0) := "00000000";
    
    signal sel_ULA : std_logic_vector( 2 downto 0); 
    
    signal NZ : std_logic_vector(1 downto 0);
    
    signal cmds : std_logic_vector(11 downto 0);
    
    begin
    
    RAM : as_ram
        port map(B3 , B1 , r_not , '0');
    
    pcs : UC
        port map(cmds , clk , cl , NZ , C_ac , sel_ULA , C_PC , selPCpp , sel , C_rem , C_rdm , blk , r_not , C_ir);
    
    ulas : ULA
        port map(B7, B0, sel_ULA, B6 , NZ , clk , cl, C_ac);
        
    PCss : PC
        port map(clk , cl , B0 , selPCpp , C_pc , B5);
        
    acs : REG
        port map(clk , cl , '1' , C_ac , B6 , B7);
        
    irs : REG
        port map(clk , cl , '1' , C_ir , B0 , B8);
        
    rdms : REG
        port map(clk , cl , '1' , C_rdm , B1 , B2);
        
    rems : REG
        port map(clk , cl , '1' , C_rem , B4 , B3);
        
    block_rdms : block_8_bits
        port map(B2 , blk , B0);
    
    block_mems : block_8_bits
        port map(B0 , blk , B1);
    
    blkn <= not blk;
    block_acs : block_8_bits
        port map(B7 , blk, B0);
        
    muxs : multiplex_2_8
        port map(B5 , B0 , sel , B4);
        
    decodUCs : decod_UC
        port map(B8 , cmds);
    
end architecture;
