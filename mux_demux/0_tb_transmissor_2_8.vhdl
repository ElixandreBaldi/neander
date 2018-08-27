library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_transmissor_2_8 is
--
end tb_transmissor_2_8;

architecture comp of tb_transmissor_2_8 is

        entity transmissor_2_8 is
	        port(
                a : in  std_logic_vector(7 downto 0);
                b : in  std_logic_vector(7 downto 0);
                x : in  std_logic;
                s : out std_logic_vector(7 downto 0)
	        );
        end transmissor_2_8;

        signal A  : std_logic_vector(7 downto 0);
        signal B  : std_logic_vector(7 downto 0);
        signal X  : std_logic;
        signal S1 : std_logic_vector(7 downto 0);
        signal S2 : std_logic_vector(7 downto 0);
begin
        x0 : transmissor_2_8
        port map(A,B,X,S1,S2);
        
        process
        begin
                 for i in 0 to 1 loop
                    X <= i;                   
                    for i in 0 to 255 loop
                            A <= std_logic_vector(to_unsigned(i,A'length));
                            for i in 0 to 255 loop
                                    B <= std_logic_vector(to_unsigned(i,B'length));
                                    wait for 10 ns;
                            end loop;       
                    end loop;
                wait;
        end process;
end architecture;

