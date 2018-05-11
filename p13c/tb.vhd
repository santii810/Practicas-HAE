------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT p13c
    PORT(
         reset : IN  std_logic;
         D : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal D : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: p13c PORT MAP (
          reset => reset,
          D => D,
          clk => clk,
          Q => Q
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
		reset <= '1';
		D <= '1';
		clk <= '0';
      wait for 10 ns;	
		
		reset <= '1';
		D <= '1';
		clk <= '1';
      wait for 10 ns;
		
		reset <= '1';
		D <= '1';
		clk <= '0';
      wait for 10 ns;
			
		reset <= '1';
		D <= '0';
		clk <= '1';
      wait for 10 ns;
		
		reset <= '1';
		D <= '0';
		clk <= '0';
      wait for 10 ns;
		
		
		
		
  

      wait;
   end process;

END;
