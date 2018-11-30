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
      begin
       
       out_c_ac      <= c_ac      when p = '1' else ('Z');
       out_sel_ula   <= sel_ula   when p = '1' else (others => 'Z');
       out_c_PC      <= c_PC      when p = '1' else ('Z');
       out_sel_PC    <= sel_PC    when p = '1' else ('Z');
       out_sel_mux   <= sel_mux   when p = '1' else ('Z');
       out_c_rem     <= c_rem     when p = '1' else ('Z');
       out_c_rdm     <= c_rdm     when p = '1' else ('Z');
       out_bloqueios <= bloqueios when p = '1' else ('Z');
       out_r_notW    <= r_notW    when p = '1' else ('Z');
       out_c_ri      <= c_ri      when p = '1' else ('Z');
        
end architecture;
