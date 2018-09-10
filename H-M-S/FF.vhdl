library ieee;
use ieee.std_logic_1164.all;

entity FF is
	port(
        clk : in std_logic;
        J   : in  std_logic;
        K   : in  std_logic;
        PR  : in  std_logic;
        CL  : in  std_logic;        
        Q   : out std_logic;
        Qn  : out std_logic
	);
end FF;

architecture comp of FF is
    signal sj1: std_logic;
    signal sj2: std_logic;
    signal sj3: std_logic;
    signal sj4: std_logic;
    signal sk1: std_logic;
    signal sk2: std_logic;
    signal sk3: std_logic;
    signal sk4: std_logic;
    begin
        sj1 <= not(J and clk and sk4);
        sj2 <= not(PR and sj1 and sk2);
        sj3 <= not(sj2 and not(clk));
        sj4 <= not(PR and sj3 and sk4);

        sk1 <= not(K and clk and sj4);
        sk2 <= not(sj2 and sk1 and CL);
        sk3 <= not(not(clk) and sk2);
        sk4 <= not(sj4 and sk3 and CL);

        Q <= sj4;
        Qn <= sk4;

end architecture comp;


