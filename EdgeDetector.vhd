
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity EdgeDetector is
Port ( 
	db_in : in STD_LOGIC;
	clk : in STD_LOGIC;
	LFSR_enable : out STD_LOGIC);
end EdgeDetector;

architecture Behavioral of EdgeDetector is
component d_ff is
port(
D : in std_logic;
clk: in std_logic;
Q : out std_logic);
end component;
signal s1,s2,s3: std_logic;
begin
D1: d_ff port map(db_in,clk,s1);
D2: d_ff port map(s1,clk,s2);
s3<= not(s2);
LFSR_enable<=s1 and s3;


end Behavioral;

