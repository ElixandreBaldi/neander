library ieee;
use ieee.std_logic_1164.all;

entity decod_ula is
	port(
        sel :  in std_logic_vector(2 downto 0);
        p_  :  in std_logic_vector(7 downto 0)
	);
end decod_ula;

architecture comp of decod_ula is
    begin
        p_(0) <= sel(0)       and (not sel(1))   and (not sel(2));
        p_(1) <= sel(0)       and (not sel(1))   and sel(2);
        p_(2) <= (not sel(0)) and (not sel(1))   and sel(2);
        p_(3) <= (not sel(0)) and  sel(1)        and (not sel(2));
        p_(4) <= (not sel(0)) and sel(1))        and sel(2);
        p_(5) <= (not sel(0)) and (not sel(1))   and (not sel(2));

end architecture;