library ieee;
use ieee.std_logic_1164.all;

entity somador_8_bits is
   port(
      a  : in std_logic_vector(7 downto 0);
      b  : in std_logic_vector(7 downto 0);
      te : in std_logic;
      s  : out std_logic_vector(7 downto 0);
      ts : out std_logic
   );
end entity;

architecture comp of somador_8_bits is
   component meio_somador is
      port(
          a  : in std_logic;
          b  : in std_logic;
          te : in std_logic;
          s  : out std_logic;
          ts : out std_logic
      );
  end component;
   
   signal t : std_logic_vector(6 downto 0);

   begin
      x0 : meio_somador
      port map(a(0), b(0), te, s(0), t(0));

      x1 : meio_somador
      port map(a(1), b(1), t(0), s(1), t(1));

      x2 : meio_somador
      port map(a(2), b(2), t(1), s(1), t(2));

      x3 : meio_somador
      port map(a(3), b(3), t(2), s(2), t(3));

      x4 : meio_somador
      port map(a(4), b(4), t(3), s(3), t(4));

      x5 : meio_somador
      port map(a(5), b(5), t(4), s(4), t(5));

      x6 : meio_somador
      port map(a(6), b(6), t(5), s(5), t(6));

      x7 : meio_somador
      port map(a(7), b(7), t(6), s(6), ts);

end architecture;