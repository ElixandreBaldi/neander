library ieee;
use ieee.std_logic_1164.all;

entity ULA is
	port(
        cy      : in std_logic_vector(7 downto 0);
        cx      : in std_logic_vector(7 downto 0);

        sel     : in  std_logic_vector(2 downto 0);
        s       : out std_logic_vector(7 downto 0);
          
        nz      : out std_logic_vector(1 downto 0);

        clock   : in std_logic;
        clear   : in std_logic;

        cargaAC : in std_logic
	);
end ULA;

architecture comp of ULA is
        component CC_NZ is
                port(
                E   :  in  std_logic_vector(7 downto 0);
                NZ  :  out std_logic_vector(1 downto 0)
                );
        end component;

        component decod_ula is
                port(
                sel :  in std_logic_vector(2 downto 0);
                p  :  out std_logic_vector(5 downto 0)
                );
        end component;

        component AND_8_bit is
                port(
                        a : in std_logic_vector(7 downto 0);
                        b : in std_logic_vector(7 downto 0);
                        sand : out std_logic_vector(7 downto 0)
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

        component adder_8_bit is
                port(
                        a : in std_logic_vector(7 downto 0);
                        b : in std_logic_vector(7 downto 0);
                        te :in std_logic;
                        s : out std_logic_vector(7 downto 0);
                        ts : out std_logic
                );
        end component;

        component REG_2_bits is
            port(
                clk : in  std_logic;
                cl  : in  std_logic;
                pr  : in  std_logic;
                c   : in  std_logic;
                b   : in  std_logic_vector(1 downto 0);
                s   : out std_logic_vector(1 downto 0)
            );
        end component;
    

        signal p  : std_logic_vector(5 downto 0);
        signal s_not : std_logic_vector(7 downto 0);
        signal s_shift : std_logic_vector(7 downto 0);
        signal s_add : std_logic_vector(7 downto 0);
        signal s_or : std_logic_vector(7 downto 0);
        signal s_and : std_logic_vector(7 downto 0);
        signal ts_add : std_logic;
        signal ss : std_logic_vector(7 downto 0);
        signal scc_nz : std_logic_vector(1 downto 0);               

        begin
            
                --seletor
                sel2 : decod_ula
                port map (sel,p);

                --blocks
                block_not : block_8_bits
                port map(s_not,p(0),ss);

                block_shift : block_8_bits
                port map(s_shift,p(1),ss);

                block_add : block_8_bits
                port map(s_add,p(2),ss);

                block_or : block_8_bits
                port map(s_or,p(3),ss);

                block_and : block_8_bits
                port map(s_and,p(4),ss);

                block_load : block_8_bits
                port map(cx,p(5),ss);
                
                s <= ss;

                --components
                not2: porta_NOT_8in
                port map(cy,s_not);

                shift: shiftL_8_bits
                port map(cy , s_shift);

                add2: adder_8_bit
                port map(cx,cy,'0',s_add,ts_add);

                or2: porta_OR_8in
                port map(cx ,cy ,s_or);

                and2: AND_8_bit
                port map(cx ,cy ,s_and);

                cc: CC_NZ
                port map(ss , scc_nz);

                regs: REG_2_bits
                port map(clock, clear, '1', cargaAC, scc_nz, nz);      
end architecture;
