library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_uc is
end entity;

architecture comp of tb_uc is
    
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
                signal  c_ac,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri : std_logic; 
                signal   sel_ula : std_logic_vector(2 downto 0);
                signal    nz    : std_logic_vector(1 downto 0);
                signal inst : std_logic_vector(11 downto 0):="000000000000";
                signal  clk, cl : std_logic:= '0';
        
    begin
        decode : UC
        port map(inst,clk,cl,nz,c_ac,sel_ula,c_PC,sel_PC,sel_mux,c_rem,c_rdm,bloqueios,r_notW,c_ri);
    
        clock: process
        begin
            clk <= not(clk);
            wait for 10 ns;
        end process;
    
        lokura: process
        begin
            wait for 40 ns;
            cl <= not(cl);
            wait for 50000 ns;            
        end process;
end architecture;
