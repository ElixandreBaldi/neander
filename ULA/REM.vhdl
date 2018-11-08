library ieee;
use ieee.std_logic_1164.all;

entity REM1 is
    port(
        clk : in  std_logic;
        cl  : in  std_logic;
        pr  : in  std_logic;
        c   : in  std_logic;
        b   : in  std_logic_vector(7 downto 0);
        s   : out std_logic_vector(7 downto 0)
    );
end REM1;

architecture comp of REM1 is
    component mux2x1 is
        port(
            S : in  std_logic;
            A : in  std_logic;
            B : in  std_logic;
            X : out std_logic
        );
    end component;

    component FFJKD is
        port(
            J     : in  std_logic; 
            clock : in  std_logic;
            PR    : in  std_logic;
            CL    : in  std_logic;
            Q     : out std_logic;
            nQ    : out std_logic
        );
    end component;
    
    signal m  : std_logic_vector(7 downto 0);
    signal ss : std_logic_vector(7 downto 0);
    signal nq : std_logic_vector(7 downto 0);

begin
    x0 : mux2x1
    port map(c, b(0), ss(0), m(0));
    x1 : mux2x1
    port map(c, b(1), ss(1), m(1));
    x2 : mux2x1
    port map(c, b(2), ss(2), m(2));
    x3 : mux2x1
    port map(c, b(3), ss(3), m(3));
    x4 : mux2x1
    port map(c, b(4), ss(4), m(4));
    x5 : mux2x1
    port map(c, b(5), ss(5), m(5));
    x6 : mux2x1
    port map(c, b(6), ss(6), m(6));
    x7 : mux2x1
    port map(c, b(7), ss(7), m(7));

    y0 : FFJKD
    port map(m(0), clk, pr, cl, ss(0), nq(0));
    s(0) <= ss(0);
    y1 : FFJKD
    port map(m(1), clk, pr, cl, ss(1), nq(1));
    s(1) <= ss(1);
    y2 : FFJKD
    port map(m(2), clk, pr, cl, ss(2), nq(2));
    s(2) <= ss(2);
    y3 : FFJKD
    port map(m(3), clk, pr, cl, ss(3), nq(3));
    s(3) <= ss(3);
    y4 : FFJKD
    port map(m(4), clk, pr, cl, ss(4), nq(4));
    s(4) <= ss(4);
    y5 : FFJKD
    port map(m(5), clk, pr, cl, ss(5), nq(5));
    s(5) <= ss(5);
    y6 : FFJKD
    port map(m(6), clk, pr, cl, ss(6), nq(6));
    s(6) <= ss(6);
    y7 : FFJKD
    port map(m(7), clk, pr, cl, ss(7), nq(7));
    s(7) <= ss(7);
end comp;