library ieee;
use IEEE.STD_LOGIC_1164.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT p13b
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: p13b PORT MAP (
          a => a,
          b => b,
          q => q
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		a <= "0000";
		b <= "0000";
		wait for 10 ns;	
		a <= "0010";
		b <= "0000";
		wait for 10 ns;	
		a <= "0100";
		b <= "0000";
		wait for 10 ns;	
		a <= "0110";
		b <= "0110";




      wait;
   end process;

END;
