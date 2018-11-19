library ieee;
use ieee.std_logic_1164.all;

entity meio_somador is
    port(
        a  : in std_logic;
        b  : in std_logic;
        te : in std_logic;
        s  : out std_logic;
        ts : out std_logic
    );
end entity;

architecture comp of meio_somador is
   signal st, x1, x2, x3 : std_logic;  
   begin
      st <= a xor b;
      s  <= st xor te;
      ---
      x1 <= a and b;
      x2 <= a and te;
      x3 <= b and te;
      ---
      ts <= (x1 or x2) or x3;

end architecture comp; 