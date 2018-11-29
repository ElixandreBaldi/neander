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
    
    component nop is
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
    
    component STA is
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
    
    component NOTs is
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
    
    component SHIFT is
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
    
    component ANDs is
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
    
    component ADD is
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
    
    component ORs is
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
    
    component JUMP is
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
    
    component bloqUC is
        port(       
            c_ac :      in std_logic;
            sel_ula:    in std_logic_vector(2 downto 0);
            c_PC:       in std_logic;
            sel_PC:     in std_logic;
            sel_mux :   in std_logic;
            c_rem :     in std_logic;
            c_rdm  :    in std_logic;
            bloqueios : in std_logic;
            r_notW :    in std_logic;
            c_ri :      in std_logic;
            
            out_c_ac :      out std_logic;
            out_sel_ula:    out std_logic_vector(2 downto 0);
            out_c_PC:       out std_logic;
            out_sel_PC:     out std_logic;
            out_sel_mux :   out std_logic;
            out_c_rem :     out std_logic;
            out_c_rdm  :    out std_logic;
            out_bloqueios : out std_logic;
            out_r_notW :    out std_logic;
            out_c_ri :      out std_logic;
            
            p :         in std_logic
        );
    end component;
    
    component HLT is
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
    
    signal ss      :      std_logic_vector(3 downto 0);
    
    signal or_c_ac :      std_logic;
    signal or_sel_ula:    std_logic_vector(2 downto 0);
    signal or_c_PC:       std_logic;
    signal or_sel_PC:     std_logic;
    signal or_sel_mux :   std_logic;
    signal or_c_rem :     std_logic;
    signal or_c_rdm  :    std_logic;
    signal or_bloqueios : std_logic;
    signal or_r_notW :    std_logic;
    signal or_c_ri :      std_logic;
    
    signal shift_c_ac :      std_logic;
    signal shift_sel_ula:    std_logic_vector(2 downto 0);
    signal shift_c_PC:       std_logic;
    signal shift_sel_PC:     std_logic;
    signal shift_sel_mux :   std_logic;
    signal shift_c_rem :     std_logic;
    signal shift_c_rdm  :    std_logic;
    signal shift_bloqueios : std_logic;
    signal shift_r_notW :    std_logic;
    signal shift_c_ri :      std_logic;
    
    signal nop_c_ac :      std_logic;
    signal nop_sel_ula:    std_logic_vector(2 downto 0);
    signal nop_c_PC:       std_logic;
    signal nop_sel_PC:     std_logic;
    signal nop_sel_mux :   std_logic;
    signal nop_c_rem :     std_logic;
    signal nop_c_rdm  :    std_logic;
    signal nop_bloqueios : std_logic;
    signal nop_r_notW :    std_logic;
    signal nop_c_ri :      std_logic;
    
    signal sta_c_ac :      std_logic;
    signal sta_sel_ula:    std_logic_vector(2 downto 0);
    signal sta_c_PC:       std_logic;
    signal sta_sel_PC:     std_logic;
    signal sta_sel_mux :   std_logic;
    signal sta_c_rem :     std_logic;
    signal sta_c_rdm  :    std_logic;
    signal sta_bloqueios : std_logic;
    signal sta_r_notW :    std_logic;
    signal sta_c_ri :      std_logic;
    
    signal lda_c_ac :      std_logic;
    signal lda_sel_ula:    std_logic_vector(2 downto 0);
    signal lda_c_PC:       std_logic;
    signal lda_sel_PC:     std_logic;
    signal lda_sel_mux :   std_logic;
    signal lda_c_rem :     std_logic;
    signal lda_c_rdm  :    std_logic;
    signal lda_bloqueios : std_logic;
    signal lda_r_notW :    std_logic;
    signal lda_c_ri :      std_logic;
    
    signal add_c_ac :      std_logic;
    signal add_sel_ula:    std_logic_vector(2 downto 0);
    signal add_c_PC:       std_logic;
    signal add_sel_PC:     std_logic;
    signal add_sel_mux :   std_logic;
    signal add_c_rem :     std_logic;
    signal add_c_rdm  :    std_logic;
    signal add_bloqueios : std_logic;
    signal add_r_notW :    std_logic;
    signal add_c_ri :      std_logic;
    
    signal and_c_ac :      std_logic;
    signal and_sel_ula:    std_logic_vector(2 downto 0);
    signal and_c_PC:       std_logic;
    signal and_sel_PC:     std_logic;
    signal and_sel_mux :   std_logic;
    signal and_c_rem :     std_logic;
    signal and_c_rdm  :    std_logic;
    signal and_bloqueios : std_logic;
    signal and_r_notW :    std_logic;
    signal and_c_ri :      std_logic;
    
    signal not_c_ac :      std_logic;
    signal not_sel_ula:    std_logic_vector(2 downto 0);
    signal not_c_PC:       std_logic;
    signal not_sel_PC:     std_logic;
    signal not_sel_mux :   std_logic;
    signal not_c_rem :     std_logic;
    signal not_c_rdm  :    std_logic;
    signal not_bloqueios : std_logic;
    signal not_r_notW :    std_logic;
    signal not_c_ri :      std_logic;
    
    signal jmp_c_ac :      std_logic;
    signal jmp_sel_ula:    std_logic_vector(2 downto 0);
    signal jmp_c_PC:       std_logic;
    signal jmp_sel_PC:     std_logic;
    signal jmp_sel_mux :   std_logic;
    signal jmp_c_rem :     std_logic;
    signal jmp_c_rdm  :    std_logic;
    signal jmp_bloqueios : std_logic;
    signal jmp_r_notW :    std_logic;
    signal jmp_c_ri :      std_logic;
    
    signal jn_c_ac :      std_logic;
    signal jn_sel_ula:    std_logic_vector(2 downto 0);
    signal jn_c_PC:       std_logic;
    signal jn_sel_PC:     std_logic;
    signal jn_sel_mux :   std_logic;
    signal jn_c_rem :     std_logic;
    signal jn_c_rdm  :    std_logic;
    signal jn_bloqueios : std_logic;
    signal jn_r_notW :    std_logic;
    signal jn_c_ri :      std_logic;
    
    signal jz_c_ac :      std_logic;
    signal jz_sel_ula:    std_logic_vector(2 downto 0);
    signal jz_c_PC:       std_logic;
    signal jz_sel_PC:     std_logic;
    signal jz_sel_mux :   std_logic;
    signal jz_c_rem :     std_logic;
    signal jz_c_rdm  :    std_logic;
    signal jz_bloqueios : std_logic;
    signal jz_r_notW :    std_logic;
    signal jz_c_ri :      std_logic;
    
    signal hlt_c_ac :      std_logic;
    signal hlt_sel_ula:    std_logic_vector(2 downto 0);
    signal hlt_c_PC:       std_logic;
    signal hlt_sel_PC:     std_logic;
    signal hlt_sel_mux :   std_logic;
    signal hlt_c_rem :     std_logic;
    signal hlt_c_rdm  :    std_logic;
    signal hlt_bloqueios : std_logic;
    signal hlt_r_notW :    std_logic;
    signal hlt_c_ri :      std_logic;
    
    signal p_n      :      std_logic;
    signal p_z      :      std_logic;
    
    
    begin
    
    contador: Contador_9
        port map(cl,clk,'1',ss);
        
    HLTs : HLT
        port map(ss,hlt_c_ac,hlt_sel_ula,hlt_c_PC,hlt_sel_PC,hlt_sel_mux,hlt_c_rem,hlt_c_rdm,hlt_bloqueios,hlt_r_notW,hlt_c_ri);
        
    NOPs : nop
        port map(ss,nop_c_ac,nop_sel_ula,nop_c_PC,nop_sel_PC,nop_sel_mux,nop_c_rem,nop_c_rdm,bloqueios,nop_r_notW,nop_c_ri);
        
    LDAs : lda
        port map(ss,lda_c_ac,lda_sel_ula,lda_c_PC,lda_sel_PC,lda_sel_mux,lda_c_rem,lda_c_rdm,lda_bloqueios,lda_r_notW,lda_c_ri);
        
    STAs : STA
        port map(ss,sta_c_ac,sta_sel_ula,sta_c_PC,sta_sel_PC,sta_sel_mux,sta_c_rem,sta_c_rdm,sta_bloqueios,sta_r_notW,sta_c_ri);
        
    NOTss : NOTs
        port map(ss,not_c_ac,not_sel_ula,not_c_PC,not_sel_PC,not_sel_mux,not_c_rem,not_c_rdm,not_bloqueios,not_r_notW,not_c_ri);
        
    SHIFTs : SHIFT
        port map(ss,shift_c_ac,shift_sel_ula,shift_c_PC,shift_sel_PC,shift_sel_mux,shift_c_rem,shift_c_rdm,shift_bloqueios,shift_r_notW,shift_c_ri);
        
    ANDss : ANDs
        port map(ss,and_c_ac,and_sel_ula,and_c_PC,and_sel_PC,and_sel_mux,and_c_rem,and_c_rdm,and_bloqueios,and_r_notW,and_c_ri);
        
    ADDs : ADD
        port map(ss,add_c_ac,add_sel_ula,add_c_PC,add_sel_PC,add_sel_mux,add_c_rem,add_c_rdm,add_bloqueios,add_r_notW,add_c_ri);
        
    ORss : ORs
        port map(ss,or_c_ac,or_sel_ula,or_c_PC,or_sel_PC,or_sel_mux,or_c_rem,or_c_rdm,or_bloqueios,or_r_notW,or_c_ri);
        
    JUMPs : JUMP
        port map(ss,jmp_c_ac,jmp_sel_ula,jmp_c_PC,jmp_sel_PC,jmp_sel_mux,jmp_c_rem,jmp_c_rdm,jmp_bloqueios,jmp_r_notW,jmp_c_ri);
        
    JNs : JUMP
        port map(ss,jn_c_ac,jn_sel_ula,jn_c_PC,jn_sel_PC,jn_sel_mux,jn_c_rem,jn_c_rdm,jn_bloqueios,jn_r_notW,jn_c_ri);
        
    JZs : JUMP
        port map(ss,jz_c_ac,jz_sel_ula,jz_c_PC,jz_sel_PC,jz_sel_mux,jz_c_rem,jz_c_rdm,jz_bloqueios,jz_r_notW,jz_c_ri);
        
    p_n <= inst(8) and nz(0);
    p_z <= inst(9) and nz(1);
        
        
    BLOCK_NOP : bloqUC
        port map(nop_c_ac,nop_sel_ula,nop_c_PC,nop_sel_PC,nop_sel_mux,nop_c_rem,nop_c_rdm,nop_bloqueios,nop_r_notW,nop_c_ri,
                 c_ac,sel_ula,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri,inst(0));  
        
    BLOCK_STA : bloqUC
        port map(sta_c_ac,sta_sel_ula,sta_c_PC,sta_sel_PC,sta_sel_mux,sta_c_rem,sta_c_rdm,sta_bloqueios,sta_r_notW,sta_c_ri,
                 c_ac,sel_ula,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri,inst(1));  
                 
    BLOCK_LDA : bloqUC
        port map(lda_c_ac,lda_sel_ula,lda_c_PC,lda_sel_PC,lda_sel_mux,lda_c_rem,lda_c_rdm,lda_bloqueios,lda_r_notW,lda_c_ri,
                 c_ac,sel_ula,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri,inst(2));
                 
    BLOCK_ADD : bloqUC
        port map(add_c_ac,add_sel_ula,add_c_PC,add_sel_PC,add_sel_mux,add_c_rem,add_c_rdm,add_bloqueios,add_r_notW,add_c_ri,
                 c_ac,sel_ula,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri,inst(3));
                 
    BLOCK_OR : bloqUC
        port map(or_c_ac,or_sel_ula,or_c_PC,or_sel_PC,or_sel_mux,or_c_rem,or_c_rdm,or_bloqueios,or_r_notW,or_c_ri,
                 c_ac,sel_ula,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri,inst(4));
                 
    BLOCK_AND : bloqUC
        port map(and_c_ac,and_sel_ula,and_c_PC,and_sel_PC,and_sel_mux,and_c_rem,and_c_rdm,and_bloqueios,and_r_notW,and_c_ri,
                 c_ac,sel_ula,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri,inst(5));
                 
    BLOCK_NOT : bloqUC
        port map(not_c_ac,not_sel_ula,not_c_PC,not_sel_PC,not_sel_mux,not_c_rem,not_c_rdm,not_bloqueios,not_r_notW,not_c_ri,
                 c_ac,sel_ula,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri,inst(6));
                 
    BLOCK_JMP : bloqUC
        port map(jmp_c_ac,jmp_sel_ula,jmp_c_PC,jmp_sel_PC,jmp_sel_mux,jmp_c_rem,jmp_c_rdm,jmp_bloqueios,jmp_r_notW,jmp_c_ri,
                 c_ac,sel_ula,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri,inst(7));
                 
    BLOCK_JN : bloqUC
        port map(jn_c_ac,jn_sel_ula,jn_c_PC,jn_sel_PC,jn_sel_mux,jn_c_rem,jn_c_rdm,jn_bloqueios,jn_r_notW,jn_c_ri,
                 c_ac,sel_ula,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri,p_n);
                 
    BLOCK_JZ : bloqUC
        port map(jz_c_ac,jz_sel_ula,jz_c_PC,jz_sel_PC,jz_sel_mux,jz_c_rem,jz_c_rdm,jz_bloqueios,jz_r_notW,jz_c_ri,
                 c_ac,sel_ula,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri,p_z);
                 
    BLOCK_HLT : bloqUC
        port map(hlt_c_ac,hlt_sel_ula,hlt_c_PC,hlt_sel_PC,hlt_sel_mux,hlt_c_rem,hlt_c_rdm,hlt_bloqueios,hlt_r_notW,hlt_c_ri,
                 c_ac,sel_ula,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri,inst(10));
    
end architecture;
