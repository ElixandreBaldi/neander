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
    signal heman : std_logic_vector(11 downto 0);
    begin
        heman <= "110111111000" when b = "0000" else (others=>'Z');
        heman <= "110111111000" when b = "0001" else (others=>'Z');
        heman <= "110111111000" when b = "0010" else (others=>'Z');
        heman <= "110111111000" when b = "0011" else (others=>'Z');
        heman <= "110111111000" when b = "0100" else (others=>'Z');
        heman <= "110111111000" when b = "0101" else (others=>'Z');
        heman <= "110111111000" when b = "0110" else (others=>'Z');

        
        heman <= "110011111000" when b = "0111" else (others=>'Z');
        heman <= "010110110000" when b = "1000" else (others=>'Z');
        heman <= "110111101000" when b = "1001" else (others=>'Z');
        
        c_PC <= heman(11);
        sel_pc <= heman(10);
        sel_mux <= heman(9);
        c_rem <= heman(8);
        r_notW <= heman(7);
        c_rdm <= heman(6);
        bloqueios <= heman(5);
        c_ri <= heman(4);
        c_ac <= heman(3);        
        sel_ula <= heman(2 downto 0);        
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
    signal heman : std_logic_vector(11 downto 0);
    begin
        heman <= "110111111000" when b = "0000" else (others=>'Z');
        heman <= "110111111000" when b = "0001" else (others=>'Z');
        heman <= "110011111000" when b = "0010" else (others=>'Z');
        heman <= "011110111000" when b = "0011" else (others=>'Z');
        heman <= "111011111000" when b = "0100" else (others=>'Z');
        heman <= "111110111000" when b = "0101" else (others=>'Z');
        heman <= "111111110000" when b = "0110" else (others=>'Z');
        
        heman <= "110011111000" when b = "0111" else (others=>'Z');
        heman <= "010110111000" when b = "1000" else (others=>'Z');
        heman <= "110111101000" when b = "1001" else (others=>'Z');
        
        c_PC <= heman(11);
        sel_pc <= heman(10);
        sel_mux <= heman(9);
        c_rem <= heman(8);
        r_notW <= heman(7);
        c_rdm <= heman(6);
        bloqueios <= heman(5);
        c_ri <= heman(4);
        c_ac <= heman(3);        
        sel_ula <= heman(2 downto 0);      
        
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
    signal heman : std_logic_vector(11 downto 0);
    begin
        heman <= "110111111000" when b = "0000" else (others=>'Z');
        heman <= "110111111000" when b = "0001" else (others=>'Z');
        heman <= "110011111000" when b = "0010" else (others=>'Z');
        heman <= "011110111000" when b = "0011" else (others=>'Z');
        heman <= "111011111000" when b = "0100" else (others=>'Z');
        heman <= "111110111000" when b = "0101" else (others=>'Z');
        heman <= "111101011000" when b = "0110" else (others=>'Z');
        
        heman <= "110011111000" when b = "0111" else (others=>'Z');
        heman <= "010110111000" when b = "1000" else (others=>'Z');
        heman <= "110111101000" when b = "1001" else (others=>'Z');
        
        c_PC <= heman(11);
        sel_pc <= heman(10);
        sel_mux <= heman(9);
        c_rem <= heman(8);
        r_notW <= heman(7);
        c_rdm <= heman(6);
        bloqueios <= heman(5);
        c_ri <= heman(4);
        c_ac <= heman(3);        
        sel_ula <= heman(2 downto 0);  
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
    signal heman : std_logic_vector(11 downto 0);
    begin
        heman <= "110111111100" when b = "0000" else (others=>'Z');
        heman <= "110111111100" when b = "0001" else (others=>'Z');
        heman <= "110111111100" when b = "0010" else (others=>'Z');
        heman <= "110111111100" when b = "0011" else (others=>'Z');
        heman <= "110111111100" when b = "0100" else (others=>'Z');
        heman <= "110111111100" when b = "0101" else (others=>'Z');
        heman <= "111111110100" when b = "0110" else (others=>'Z');                       

        heman <= "110011111100" when b = "0111" else (others=>'Z');
        heman <= "010110111100" when b = "1000" else (others=>'Z');
        heman <= "110111101100" when b = "1001" else (others=>'Z');
        
        c_PC <= heman(11);
        sel_pc <= heman(10);
        sel_mux <= heman(9);
        c_rem <= heman(8);
        r_notW <= heman(7);
        c_rdm <= heman(6);
        bloqueios <= heman(5);
        c_ri <= heman(4);
        c_ac <= heman(3);        
        sel_ula <= heman(2 downto 0);  
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
    signal heman : std_logic_vector(11 downto 0);
    begin
        heman <= "110111111101" when b = "0000" else (others=>'Z');
        heman <= "110111111101" when b = "0001" else (others=>'Z');
        heman <= "110111111101" when b = "0010" else (others=>'Z');
        heman <= "110111111101" when b = "0011" else (others=>'Z');
        heman <= "110111111101" when b = "0100" else (others=>'Z');
        heman <= "110111111101" when b = "0101" else (others=>'Z');
        heman <= "111111110101" when b = "0110" else (others=>'Z');                       

        heman <= "110011111101" when b = "0111" else (others=>'Z');
        heman <= "010110111101" when b = "1000" else (others=>'Z');
        heman <= "110111101101" when b = "1001" else (others=>'Z');
        
        c_PC <= heman(11);
        sel_pc <= heman(10);
        sel_mux <= heman(9);
        c_rem <= heman(8);
        r_notW <= heman(7);
        c_rdm <= heman(6);
        bloqueios <= heman(5);
        c_ri <= heman(4);
        c_ac <= heman(3);        
        sel_ula <= heman(2 downto 0);  
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
    signal heman : std_logic_vector(11 downto 0);
    begin
        heman <= "110111111011" when b = "0000" else (others=>'Z');
        heman <= "110111111011" when b = "0001" else (others=>'Z');
        heman <= "110011111011" when b = "0010" else (others=>'Z');
        heman <= "011110111011" when b = "0011" else (others=>'Z');
        heman <= "111011111011" when b = "0100" else (others=>'Z');
        heman <= "111010111011" when b = "0101" else (others=>'Z');
        heman <= "111111110011" when b = "0110" else (others=>'Z');    

        heman <= "110011111011" when b = "0111" else (others=>'Z');
        heman <= "010110111011" when b = "1000" else (others=>'Z');
        heman <= "110111101011" when b = "1001" else (others=>'Z');
        
        c_PC <= heman(11);
        sel_pc <= heman(10);
        sel_mux <= heman(9);
        c_rem <= heman(8);
        r_notW <= heman(7);
        c_rdm <= heman(6);
        bloqueios <= heman(5);
        c_ri <= heman(4);
        c_ac <= heman(3);        
        sel_ula <= heman(2 downto 0);  
	
	
	

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
    signal heman : std_logic_vector(11 downto 0);
    begin        
        
        heman <= "110111111001" when b = "0000" else (others=>'Z');
        heman <= "110111111001" when b = "0001" else (others=>'Z');
        heman <= "110011111001" when b = "0010" else (others=>'Z');
        heman <= "011110111001" when b = "0011" else (others=>'Z');
        heman <= "111011111001" when b = "0100" else (others=>'Z');
        heman <= "111010111001" when b = "0101" else (others=>'Z');
        heman <= "111111110001" when b = "0110" else (others=>'Z');    

        heman <= "110011111001" when b = "0111" else (others=>'Z');
        heman <= "010110111001" when b = "1000" else (others=>'Z');
        heman <= "110111101001" when b = "1001" else (others=>'Z');
        
        c_PC <= heman(11);
        sel_pc <= heman(10);
        sel_mux <= heman(9);
        c_rem <= heman(8);
        r_notW <= heman(7);
        c_rdm <= heman(6);
        bloqueios <= heman(5);
        c_ri <= heman(4);
        c_ac <= heman(3);        
        sel_ula <= heman(2 downto 0);  
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
    signal heman : std_logic_vector(11 downto 0);
    begin        
        heman <= "110111111010" when b = "0000" else (others=>'Z');
        heman <= "110111111010" when b = "0001" else (others=>'Z');
        heman <= "110011111010" when b = "0010" else (others=>'Z');
        heman <= "011110111010" when b = "0011" else (others=>'Z');
        heman <= "111011111010" when b = "0100" else (others=>'Z');
        heman <= "111010111010" when b = "0101" else (others=>'Z');
        heman <= "111111110010" when b = "0110" else (others=>'Z');    

        heman <= "110011111010" when b = "0111" else (others=>'Z');
        heman <= "010110111010" when b = "1000" else (others=>'Z');
        heman <= "110111101010" when b = "1001" else (others=>'Z');
        
        c_PC <= heman(11);
        sel_pc <= heman(10);
        sel_mux <= heman(9);
        c_rem <= heman(8);
        r_notW <= heman(7);
        c_rdm <= heman(6);
        bloqueios <= heman(5);
        c_ri <= heman(4);
        c_ac <= heman(3);        
        sel_ula <= heman(2 downto 0);
	
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity JUMP is
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
end JUMP;

architecture comp of JUMP is
    signal heman : std_logic_vector(11 downto 0);
    begin        
        heman <= "110111111000" when b = "0000" else (others=>'Z');
        heman <= "110111111000" when b = "0001" else (others=>'Z');
        heman <= "110111111000" when b = "0010" else (others=>'Z');
        heman <= "110111111000" when b = "0011" else (others=>'Z');
        heman <= "110011111000" when b = "0100" else (others=>'Z');
        heman <= "111110111000" when b = "0101" else (others=>'Z');
        heman <= "001111111000" when b = "0110" else (others=>'Z');    

        heman <= "110011111000" when b = "0111" else (others=>'Z');
        heman <= "010110111000" when b = "1000" else (others=>'Z');
        heman <= "110111101000" when b = "1001" else (others=>'Z');
        
        c_PC <= heman(11);
        sel_pc <= heman(10);
        sel_mux <= heman(9);
        c_rem <= heman(8);
        r_notW <= heman(7);
        c_rdm <= heman(6);
        bloqueios <= heman(5);
        c_ri <= heman(4);
        c_ac <= heman(3);        
        sel_ula <= heman(2 downto 0);
	
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity JUMP_c is
	port(
        c: in std_logic;
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
end JUMP_c;

architecture comp of JUMP_c is
    signal heman : std_logic_vector(11 downto 0);
    begin        
        heman <= "110111111000" when b = "0000" else (others=>'Z');
        heman <= "110111111000" when b = "0001" else (others=>'Z');
        heman <= "110111111000" when b = "0010" else (others=>'Z');
        heman <= "110111111000" when b = "0011" else (others=>'Z');
        heman <= "110011111000" when b = "0100" else (others=>'Z');
        
        heman <= "111110111000" when b = "0101" and c = '1' else (others=>'Z');
        heman <= "001111111000" when b = "0110" and c = '1' else (others=>'Z'); 
       
        heman <= "110011111000" when b = "0101" and c = '0' else (others=>'Z');
        heman <= "010011111000" when b = "0110" and c = '0' else (others=>'Z');
     
    
        heman <= "110011111000" when b = "0111" else (others=>'Z');
        heman <= "010110111000" when b = "1000" else (others=>'Z');
        heman <= "110111101000" when b = "1001" else (others=>'Z');
        
        c_PC <= heman(11);
        sel_pc <= heman(10);
        sel_mux <= heman(9);
        c_rem <= heman(8);
        r_notW <= heman(7);
        c_rdm <= heman(6);
        bloqueios <= heman(5);
        c_ri <= heman(4);
        c_ac <= heman(3);        
        sel_ula <= heman(2 downto 0);
	
end architecture;



library ieee;
use ieee.std_logic_1164.all;

entity HLT is
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
end HLT;

architecture comp of HLT is
    begin        
        c_pc <= '1';
        sel_PC <= '0';
        sel_mux<= '0';
        c_rem<= '1';
        r_notW<='1';
        c_rdm<= '1';
        bloqueios<= '1';
        c_ri<= '1';
        c_ac<= '1';
        sel_ula(2)<='0';
        sel_ula(1)<='0';
        sel_ula(0)<='0';
	
end architecture;
