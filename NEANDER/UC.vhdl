library ieee;
use ieee.std_logic_1164.all;

entity UC is
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
end UC;

architecture comp of UC is
    component Contador_9 is
        port(
            r : in std_logic;      
            clk : in std_logic;
            p : in std_logic;
            q : out std_logic_vector(3 downto 0)
        );
    end component;

    component lda is
        port(
            b: in std_logic_vector(3 downto 0);        
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
    
    signal ss : std_logic_vector(3 downto 0 );
    
    begin
    
    contador: Contador_9
        port map(cl,clk,'1',ss);
    LDAs : lda
        port map(ss,c_ac,sel_ula,c_PC,sel_PC,sel_mux, c_rem, c_rdm,bloqueios,r_notW,c_ri);
        
        


end architecture;
