library ieee;
use ieee.std_logic_1164.all;

entity REG_2_bits is
    port(
        clk : in  std_logic;
        cl  : in  std_logic;
        pr  : in  std_logic;
        c   : in  std_logic;
        b   : in  std_logic_vector(1 downto 0);
        s   : out std_logic_vector(1 downto 0)
    );
end REG_2_bits;

architecture comp of REG_2_bits is
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
    
    signal m  : std_logic_vector(1 downto 0);
    signal ss : std_logic_vector(1 downto 0);
    signal nq : std_logic_vector(1 downto 0);

begin
    x0 : mux2x1
    port map(c, b(0), ss(0), m(0));
    x1 : mux2x1
    port map(c, b(1), ss(1), m(1));
  

    y0 : FFJKD
    port map(m(0), clk, pr, cl, ss(0), nq(0));
    s(0) <= ss(0);
    y1 : FFJKD
    port map(m(1), clk, pr, cl, ss(1), nq(1));
    s(1) <= ss(1);
   
end comp;
