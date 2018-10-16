library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_porta_NOT_8in is
  --
end tb_porta_NOT_8in;

architecture comp of tb_porta_NOT_8in is
   component porta_NOT_8in is
      port(
           a : in std_logic_vector(7 downto 0);
           s : out std_logic_vector(7 downto 0)
      );
   end component;

   signal s1 : std_logic_vector(7 downto 0);
   signal p  : std_logic_vector(7 downto 0);

   begin 

      x : porta_NOT_8in
      port map(s1,p);

      process
         begin
              for i in 0 to 255 loop
                      s1<= std_logic_vector(to_unsigned(i,s1'length));
                      wait for 10 ns;  
              end loop;
              wait;
      end process;
end architecture;