library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_somador_8_bits is
   ---
end tb_somador_8_bits;

architecture comp of tb_somador_8_bits is
   component somador_8_bits is
      port(
         a  : in std_logic_vector(7 downto 0);
         b  : in std_logic_vector(7 downto 0);
         te : in std_logic;
         s  : out std_logic_vector(7 downto 0);
         ts : out std_logic
      );
   end component;

   signal s1 : std_logic_vector(7 downto 0);
   signal s2 : std_logic_vector(7 downto 0);
   signal p  : std_logic_vector(7 downto 0);
   signal ts : std_logic;
begin
   x0 : somador_8_bits
   port map(s1,s2,'1',p,ts);
   
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