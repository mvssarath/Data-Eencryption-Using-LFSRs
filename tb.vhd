LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    COMPONENT Dataencrypt_decrypt
    PORT(
         plain_text : IN  std_logic_vector(7 downto 0);
         switch : IN  std_logic;
         load : IN  std_logic;
         clk : IN  std_logic;
         cipher_text : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal plain_text : std_logic_vector(7 downto 0) := (others => '0');
   signal switch : std_logic := '0';
   signal load : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal cipher_text : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Dataencrypt_decrypt PORT MAP (
          plain_text => plain_text,
          switch => switch,
          load => load,
          clk => clk,
          cipher_text => cipher_text
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
  --    wait for 100 ns;	

    --  wait for clk_period*10;
     
	   plain_text<="00110100";
		
      -- insert stimulus here 

      wait for 50 ns;
   end process;

END;
