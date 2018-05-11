library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity P13a is
    Port ( a,b,ci : in  STD_LOGIC;
           s,co : out  STD_LOGIC);
end P13a;

architecture Behavioral of P13a is

begin
s <= ci xor b xor a;
co <= (ci and (b xor a)) or (b and a);

end Behavioral;

