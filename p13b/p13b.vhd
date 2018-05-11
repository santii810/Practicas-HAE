
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity p13b is
    Port (a, b : in std_logic_vector(3 downto 0); 
	       q : out  STD_LOGIC);
end p13b;

architecture Behavioral of p13b is

begin
	--q <= not(a(1) xor b(1)) and (a(2) xor b(2)) and (a(3) xor b(3)) and (a(0) xor b(0));
	q <= '0' when a=b else '1';
end Behavioral;

