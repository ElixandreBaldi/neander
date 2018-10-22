library ieee;
use ieee.std_logic_1164.all;

entity ULA is
	port(
        cy      : in std_logic_vector(7 downto 0);
        cx      : in std_logic_vector(7 downto 0);

        sel     : in  std_logic_vector(2 downto 0);
        s       : out std_logic_vector(7 downto 0);
          
        n       : out std_logic;
        z       : out std_logic;

        clock   : in std_logic;

        sn: out std_logic;
        sz: out std_logic;

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
                p_  :  in std_logic_vector(5 downto 0)
                );
        end component;

        component porta_AND_8in is
                port(
                a : in std_logic_vector(7 downto 0);
                b : in std_logic_vector(7 downto 0);
                s : out std_logic_vector(7 downto 0)
                );
        end component;

        component porta_NOT_8in is
                port(
                a : in std_logic_vector(7 downto 0);
                s : out std_logic_vector(7 downto 0)
                );
        end component;

        component porta_OR_8in is
                port(
                a : in std_logic_vector(7 downto 0);
                b : in std_logic_vector(7 downto 0);
                s : out std_logic_vector(7 downto 0)
                );
        end component;

        component shiftL_8_bits is
                port(
                a : in std_logic_vector(7 downto 0);
                s : out std_logic_vector(7 downto 0)
                );
        end component;

        component block_8_bits is
                port(
                a : in std_logic_vector(7 downto 0);
                p : in std_logic;
                s : out std_logic_vector(7 downto 0)
                );
        end component;

        component somador_8_bits is
                port(
                   a  : in std_logic_vector(7 downto 0);
                   b  : in std_logic_vector(7 downto 0);
                   te : in std_logic;
                   s  : out std_logic_vector(7 downto 0);
                   ts : out std_logic
                );
        end component;

        signal p  : std_logic_vector(5 downto 0);
        signal s_not : std_logic_vector(7 downto 0);
        signal s_shift : std_logic_vector(7 downto 0);
        signal s_add : std_logic_vector(7 downto 0);
        signal s_or : std_logic_vector(7 downto 0);
        signal s_and : std_logic_vector(7 downto 0);
        signal ts_add : std_logic;

        signal cc_n : std_logic;
        signal cc_z : std_logic;

        begin
                --seletor
                sel : decod_ula
                port map (sel,p);

                --blocks
                block_not : block_8_bits
                port map(s_not,p(0),s);

                block_shift : block_8_bits
                port map(s_shift,p(1),s);

                block_add : block_8_bits
                port map(s_add,p(2),s);

                block_or : block_8_bits
                port map(s_or,p(3),s);

                block_and : block_8_bits
                port map(s_and,p(4));

                block_load : block_8_bits
                port map(cy,p(5),s);
                
                --components
                not_ : porta_NOT_8in
                port map(cy,s_not);

                shift_ : shiftL_8_bits
                port map(cy , s_shift);

                add_ : somador_8_bporta_AND_8in
                port map(cx,cy,'1',ts_add);

                or_ : porta_OR_8
                port map(cx ,cy s_or);

                and_ : porta_AND_8in
                port map(cx ,cy ,s_and);

                cc_ : CC_NZ
                port map(s , cc_n , cc_z);

                

             x1 : porta_OR_2in 
             port map(a(1),b(1),s(1));













    
end architecture;








