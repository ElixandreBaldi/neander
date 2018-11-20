library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_decode is
end entity;

architecture comp of tb_decode is
    
        component decod_UC is
            port(        
                p : in  std_logic_vector(7  downto 0);
                s : out std_logic_vector(11 downto 0)
            );
        end component;
        signal entrada : std_logic_vector(7 downto 0):="00000000";
        signal saida   : std_logic_vector(11 downto 0);
    begin
        decode : decod_UC
        port map(entrada,saida);
    
        decode_p: process
        begin
            for i in 0 to 11 loop
                entrada <= std_logic_vector(to_unsigned(i,entrada'length));
                wait for 50 ns;
            end loop;
        end process;
end architecture;
