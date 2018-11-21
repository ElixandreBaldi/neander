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
    begin
        


end architecture;
