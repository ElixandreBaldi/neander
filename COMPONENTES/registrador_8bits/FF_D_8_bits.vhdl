library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FF_D_8_bits is
    port(
        d  : in std_logic_vector(7 downto 0);
        pr  : in std_logic;
        cl : in std_logic;
        clk  : in std_logic;        
        q : out std_logic_vector(7 downto 0);
        qn : out std_logic_vector(7 downto 0)
    );
end entity;


architecture comp of FF_D_8_bits is    
    
    component FF_D is
	    port(
            clk : in  std_logic;
            D : in  std_logic;            
            PR: in  std_logic;
            CL: in  std_logic;        
            Q : out std_logic;
            Qn : out std_logic
	    );
    end component;          
    
begin
    x0 : FF_D
    port map(clk,d(0),pr,cl,q(0),qn(0));
    
    x1 : FF_D
    port map(clk,d(1),pr,cl,q(1),qn(1));
    
    x2 : FF_D
    port map(clk,d(2),pr,cl,q(2),qn(2));
    
    x3 : FF_D
    port map(clk,d(3),pr,cl,q(3),qn(3));
    
    x4 : FF_D
    port map(clk,d(4),pr,cl,q(4),qn(4));
    
    x5 : FF_D
    port map(clk,d(5),pr,cl,q(5),qn(5));
    
    x6 : FF_D
    port map(clk,d(6),pr,cl,q(6),qn(6));
    
    x7 : FF_D
    port map(clk,d(7),pr,cl,q(7),qn(7));                                    

end architecture;

