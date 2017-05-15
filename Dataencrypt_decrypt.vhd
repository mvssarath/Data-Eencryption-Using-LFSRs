library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dataencrypt_decrypt is
port(
			plain_text: in std_logic_vector(7 downto 0);
			switch,load: in std_logic;
			clk: in std_logic;
			cipher_text: out std_logic_vector(7 downto 0));
end Dataencrypt_decrypt;

architecture Behavioral of Dataencrypt_decrypt is
component debouncer is
port(
		inp : in std_logic;
		clk : in std_logic;
		opt : out std_logic);
		
end component;
component EdgeDetector is
Port ( 
	db_in : in STD_LOGIC;
	clk : in STD_LOGIC;
	LFSR_enable : out STD_LOGIC);
end component;
component LFSR is
    Port ( din : in  STD_LOGIC_VECTOR (7 downto 0);
           l_init : in  STD_LOGIC;
           en : in  STD_LOGIC;
           LFSR_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal LFSR_sig : std_logic_vector(7 downto 0);
signal opt,LFSR_enable : STD_LOGIC;
begin
D1: debouncer port map(switch,clk,opt);
E1: EdgeDetector port map(opt,clk,LFSR_enable);
L1: LFSR port map(plain_text,load,LFSR_enable,LFSR_sig);
cipher_text<=LFSR_sig xor plain_text;

end Behavioral;

