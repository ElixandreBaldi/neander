library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
    port(
        S : in std_logic;
        A : in std_logic;
        B : in std_logic;
        X : out std_logic
    );
end mux2x1;

architecture comp of mux2x1 is
begin
    X <= A when (S = '0') else B;
end comp;