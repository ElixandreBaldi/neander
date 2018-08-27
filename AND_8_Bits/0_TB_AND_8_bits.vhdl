library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_porta_AND_8in is
--
end tb_porta_AND_8in;

architecture comp of tb_porta_AND_8in is
        component porta_AND_8in is
                port(
                a : in std_logic_vector(7 downto 0);
                b : in std_logic_vector(7 downto 0);
                s : out std_logic_vector(7 downto 0)
                );
        end component;

        signal s1 : std_logic_vector(7 downto 0);
        signal s2 : std_logic_vector(7 downto 0);
        signal p  : std_logic_vector(7 downto 0);
begin
        x0 : porta_AND_8in
        port map(s1,s2,p);
        
        process
        begin
                for i in 0 to 255 loop
                        s1<= std_logic_vector(to_unsigned(i,s1'length));
                        for i in 0 to 255 loop
                                s2<= std_logic_vector(to_unsigned(i,s2'length));
                                wait for 10 ns;
                        end loop;       
                end loop;
                wait;
        end process;
end architecture;