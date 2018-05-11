
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity p13d is
    Port ( reset,alfa,E : in  STD_LOGIC;
           q0,q1,q2 : out  STD_LOGIC);
end p13d;

architecture Behavioral of p13d is

begin
process(reset,E)
variable temp : unsigned (2 downto 0);
begin
if(alfa = '0') then 
	temp:= "000";
	
	elsif(reset = '1') then
	temp := "000"
	
	elsif(falling_edge 
	if(reset = '1')
		q0 <= '0';
		q1 <= '0';
		q2 <= '0';
	elsif(alfa = '1') then 
end Behavioral;

