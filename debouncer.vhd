library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity debouncer is
port(
		inp : in std_logic;
		clk : in std_logic;
		opt : out std_logic);
		
end debouncer;

architecture Behavioral of debouncer is

begin

process(clk,inp)
variable count : integer :=0;

begin

if (rising_edge(clk)) then
		if inp = '1' then
			count := count + 1;
		else 
			count :=0;
		end if;
		if count > 1000000 then
			opt<='1';
		else 
			opt<='0';
		end if;
end if;
end process;
end Behavioral;

