library ieee;
use ieee.std_logic_1164.all;

entity nop is
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
end nop;


architecture comp of nop is
    begin
        c_PC <= b(3) or b(2) or b(1) or (not (b(0)));
        sel_pc <= '0';
        sel_mux <= '1';
        c_rem <= b(3) or b(2) or b(1) or b(0);
        r_notW <= '1';
        c_rdm <= b(3) or b(2) or b(1) or (not (b(0)));
        bloqueios <= '1';
        c_ri <= b(3) or b(2) or (not (b(1))) or b(0);
        c_ac <= '1';
        sel_ula <= "000";
end architecture;



library ieee;
use ieee.std_logic_1164.all;

entity lda is
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
end lda;


architecture comp of lda is
    begin
        c_PC <= (b(1) and b(0)) or (not(b(2)) and (not(b(0)))) or (b(2) and (not(b(1)))) or b(3);
        sel_pc <= '1';
        sel_mux <= (b(0) xor b(2)) or b(3) or b(1);
        c_rem <= b(3) or b(2) or b(0);
        r_notW <= '1';
        c_rdm <= not(b(0) xor b(2)) or (not(b(1) and b(0))) or b(3);
        bloqueios <= '1';
        c_ri <= b(3) or (not((b(1)))) or (not(b(0))) or (not(b(2)));
        c_ac <= b(3) or (not(b(2))) or b(1) or b(0);
        sel_ula <= "000";
end architecture;
