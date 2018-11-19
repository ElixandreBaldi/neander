library ieee;
use ieee.std_logic_1164.all;

entity decod_ula is
	port(
        sel :  in std_logic_vector(2 downto 0);
        p  :  out std_logic_vector(5 downto 0)
	);
end decod_ula;

architecture comp of decod_ula is
    begin
        p(0) <= sel(2)       and (not sel(1))   and (not sel(0));
        p(1) <= sel(2)       and (not sel(1))   and      sel(0);
        p(2) <= (not sel(2)) and (not sel(1))   and      sel(0);
        p(3) <= (not sel(2)) and      sel(1)    and (not sel(0));
        p(4) <= (not sel(2)) and sel(1)         and      sel(0);
        p(5) <= (not sel(2)) and (not sel(1))   and (not sel(0));
end architecture;