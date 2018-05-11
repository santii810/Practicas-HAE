
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p13c is
    Port ( reset,D,clk : in  STD_LOGIC;
           Q : out  STD_LOGIC);
	
end p13c;

architecture Behavioral of p13c is
signal lastD  : STD_LOGIC;

begin

	process(clk,reset)
	begin
		if (reset = '0') then
			Q <='1';
		elsif (falling_edge(clk))then
			Q <= not D;
		end if;
	end process;
		
end Behavioral;

