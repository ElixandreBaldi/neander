library ieee;
use ieee.std_logic_1164.all;

entity porta_OR_2in is
    port(
        a : in std_logic;
        b : in std_logic; 
        s : out std_logic
    );
end entity;

architecture comp of porta_OR_2in is
    begin
        s <= a or b;
end architecture comp;