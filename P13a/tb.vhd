
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT P13a
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         ci : IN  std_logic;
         s : OUT  std_logic;
         co : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal ci : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal co : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: P13a PORT MAP (
          a => a,
          b => b,
          ci => ci,
          s => s,
          co => co
        );

  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		a <= '0';
		b <= '1';
		ci <= '0';
		wait for 10 ns;		
		
		a <= '1';
		b <= '1';
		ci <= '0';
		wait for 10 ns;	
		
		a <= '1';
		b <= '0';
		ci <= '1';
		wait for 10 ns;	
		
		a <= '0';
		b <= '0';
		ci <= '1';
		wait for 10 ns;	

      wait;
   end process;

END;
