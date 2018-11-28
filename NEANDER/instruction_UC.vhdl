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
        sel_pc <= '1';
        sel_mux <= '0';
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
        c_rdm <= ((not b(2)) and ((not b(3) and (not b(0))) or (b(3) and (not b(1))))) or ((not b(3) and b(2)) and (b(0) or (not b(1))));
        bloqueios <= '1';
        c_ri <= b(3) or (not((b(1)))) or (not(b(0))) or (not(b(2)));
        c_ac <= b(3) or (not(b(2))) or b(1) or b(0);
        sel_ula <= "000";
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity STA is
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
end STA;

architecture comp of STA is
    begin
        c_PC <= b(3) or ((not b(1)) and b(2)) or ((not b(0)) and (not b(2)) and (not b(3))) or ( (not b(3)) and b(1) and b(0));
        sel_pc <= '1';
        sel_mux <= b(1);
        c_rem <= b(3) or b(2) or b(0);
        r_notW <= b(1) or (b(0) and (not b(3)));
        c_rdm <= b(3) or ((not b(0)) and (not b(2)) and (not b(3))) or ((not b(1)) and b(2)) or (b(2) and b(0) and (not b(3)));
        bloqueios <= b(0) or b(1);
        c_ri <= (not b(2)) or (not b(0)) or ((not b(1)) and b(2));
        c_ac <= '1';
        sel_ula <= "000";
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity NOTs is
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
end NOTs;

architecture comp of NOTs is
    begin
        c_PC<=((not(b(1)) or (b(0)) or (b(2))));
	sel_pc<='1';
	sel_mux<='0';
	c_rem<=((not(b(0))) or (b(1)) or (b(2)) or (b(3)));
	r_notW<='1';
	c_rdm<=((not(b(1))) or (b(0)) or (b(2)));
	bloqueios<='1';
	c_ri<=((not(b(0))) or (not(b(1))) or (b(2)));
	c_ac<=((b(0)) or (b(1)) or (b(2)) or (b(3)));
	sel_ula(2)<=((not(b(3)) and not(b(2)) and not(b(1)) and not(b(0))));
	sel_ula(1)<='0';
	sel_ula(0)<='0';
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity SHIFT is
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
end SHIFT;

architecture comp of SHIFT is
    begin
        c_PC<=((not(b(1)) or (b(0)) or (b(2))));
	sel_pc<='1';
	sel_mux<='0';
	c_rem<=((not(b(0))) or (b(1)) or (b(2)) or (b(3)));
	r_notW<='1';
	c_rdm<=((not(b(1))) or (b(0)) or (b(2)));
	bloqueios<='1';
	c_ri<=((not(b(0))) or (not(b(1))) or (b(2)));
	c_ac<=((b(0)) or (b(1)) or (b(2)) or (b(3)));
	sel_ula(2)<=((not(b(3)) and not(b(2)) and not(b(1)) and not(b(0))));
	sel_ula(1)<='0';
    sel_ula(0)<=((not(b(3)) and not(b(2)) and not(b(1)) and not(b(0))));
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity ANDs is
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
end ANDs;

architecture comp of ANDs is
    begin
    c_pc<= b(3) or (b(1) xnor b(0)) or (b(2) xnor b(0));
	sel_PC<='1';
	sel_mux<= (not b(3)) and (not b(2)) and b(1) and (not b(0));
	c_rem<= b(3) or ((b(2) xor b(0)) or (b(2) and b(1)));
	r_notW<='1';
	c_rdm<= b(3) or (b(2) xnor b(0)) or (b(2) and (not b(1)));
	bloqueios<='1';
	c_ri<= b(3) or (not b(2)) or (not b(1)) or (not b(0));
	c_ac<=b(3) or (not b(2)) or b(1) or b(0);
	sel_ula(2)<='0';
	sel_ula(1)<=((not b(3)) and b(2)) and ((not b(1)) and (not b(0)));
	sel_ula(0)<=((not b(3)) and b(2)) and ((not b(1)) and (not b(0)));
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity ADD is
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
end ADD;

architecture comp of ADD is
    begin        
    c_pc<= b(3) or (b(1) xnor b(0)) or (b(2) xnor b(0));
	sel_PC<='1';
	sel_mux<= (not b(3)) and (not b(2)) and b(1) and (not b(0));
	c_rem<= b(3) or ((b(2) xor b(0)) or (b(2) and b(1)));
	r_notW<='1';
	c_rdm<= b(3) or (b(2) xnor b(0)) or (b(2) and (not b(1)));
	bloqueios<='1';
	c_ri<= b(3) or (not b(2)) or (not b(1)) or (not b(0));
	c_ac<=b(3) or (not b(2)) or b(1) or b(0);
	sel_ula(2)<='0';
	sel_ula(1)<='0';
	sel_ula(0)<=((not b(3)) and b(2)) and ((not b(1)) and (not b(0)));
end architecture;


library ieee;
use ieee.std_logic_1164.all;

entity ORs is
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
end ORs;

architecture comp of ORs is
    begin        
    c_pc<= b(3) or (b(1) xnor b(0)) or (b(2) xnor b(0));
	sel_PC<='1';
	sel_mux<= (not b(3)) and (not b(2)) and b(1) and (not b(0));
	c_rem<= b(3) or ((b(2) xor b(0)) or (b(2) and b(1)));
	r_notW<='1';
	c_rdm<= b(3) or (b(2) xnor b(0)) or (b(2) and (not b(1)));
	bloqueios<='1';
	c_ri<= b(3) or (not b(2)) or (not b(1)) or (not b(0));
	c_ac<=b(3) or (not b(2)) or b(1) or b(0);
	sel_ula(2)<='0';
	sel_ula(1)<=((not b(3)) and b(2)) and ((not b(1)) and (not b(0)));
	sel_ula(0)<='0';
	
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity ORs is
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
end ORs;

architecture comp of ORs is
    begin        
    c_pc<= b(3) or (b(1) xnor b(0)) or (b(2) xnor b(0));
	sel_PC<='1';
	sel_mux<= (not b(3)) and (not b(2)) and b(1) and (not b(0));
	c_rem<= b(3) or ((b(2) xor b(0)) or (b(2) and b(1)));
	r_notW<='1';
	c_rdm<= b(3) or (b(2) xnor b(0)) or (b(2) and (not b(1)));
	bloqueios<='1';
	c_ri<= b(3) or (not b(2)) or (not b(1)) or (not b(0));
	c_ac<=b(3) or (not b(2)) or b(1) or b(0);
	sel_ula(2)<='0';
	sel_ula(1)<=((not b(3)) and b(2)) and ((not b(1)) and (not b(0)));
	sel_ula(0)<='0';
	
end architecture;
