library ieee;
use ieee.std_logic_1164.all;

entity ULA is
	port(
        cy      : in std_logic_vector(7 downto 0);
        cx      : in std_logic_vector(7 downto 0);

        sel     : in std_logic_vector(2 downto 0);
               : out std_logic;
          
        n       : out std_logic;
        z       : out std_logic;

        clock   : in std_logic;
        clear   : in std_logic;

        cargaAC : out std_logic
      
	);
end ULA;

architecture comp of ULA is
        component CC_NZ is
                port(
                E   :  in  std_logic_vector(7 downto 0);
                N   :  out std_logic;
                Z   :  out std_logic
                );
        end component;

        component decod_ula is
                port(
                sel :  in std_logic_vector(2 downto 0);
                p_  :  in std_logic_vector(7 downto 0)
                );
        end component;

        begin

    
end architecture;








