library ieee;
use ieee.std_logic_1164.all;

entity bloqUC is
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
end bloqUC;

architecture comp of bloqUC is
       
        signal  s_in  : std_logic_vector(8 downto 0);
        signal  s_out : std_logic_vector(8 downto 0);
      
      begin
       
       s_in(0) <= c_ac;
       s_in(1) <= c_PC;
       s_in(2) <= sel_PC;
       s_in(3) <= sel_mux;
       s_in(4) <= c_rem;
       s_in(5) <= c_rdm;
       s_in(6) <= bloqueios;
       s_in(7) <= r_notW;
       s_in(8) <= c_ri;
       
       s_out <= s_in when p = '1' else ( others => 'Z');
       out_sel_ula <= sel_ula when p = '1' else ( others => 'Z');
       
       out_c_ac      <= s_out(0);
       out_c_PC      <= s_out(1);
       out_sel_PC    <= s_out(2);
       out_sel_mux   <= s_out(3);
       out_c_rem     <= s_out(4);
       out_c_rdm     <= s_out(5);
       out_bloqueios <= s_out(6);
       out_r_notW    <= s_out(7);
       out_c_ri      <= s_out(8);
       
end architecture;
