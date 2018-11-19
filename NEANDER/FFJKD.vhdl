library ieee;
use ieee.std_logic_1164.all;

entity FFJKD is
    port(
        J     : in  std_logic; 
        clock : in  std_logic;
        PR    : in  std_logic;
        CL    : in  std_logic;
        Q     : out std_logic;
        nQ    : out std_logic
    );
end entity;

architecture compa of FFJKD is
    signal A : std_logic_vector(3 downto 0);
    signal B : std_logic_vector(3 downto 0);

begin 
    A(0) <= not(J and clock and B(3));
    A(1) <= not(A(0) and PR and B(1));
    A(2) <= not(A(1) and not(clock));
    A(3) <= not(A(2) and PR and B(3));

    B(0) <= not(not(J) and clock and A(3));
    B(1) <= not(B(0) and CL and A(1));
    B(2) <= not(B(1) and not(clock));
    B(3) <= not(B(2) and CL and A(3));

    Q <= A(3);
    nQ <= B(3);
end architecture;
