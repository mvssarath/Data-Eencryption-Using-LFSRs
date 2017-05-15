library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LFSR is
    Port ( din : in  STD_LOGIC_VECTOR (7 downto 0);
           l_init : in  STD_LOGIC;
           en : in  STD_LOGIC;
           LFSR_out : out  STD_LOGIC_VECTOR (7 downto 0));
end LFSR;

architecture beh of LFSR is

signal LFSR_sig : std_logic_vector(7 downto 0);
begin
LFSR_out <= LFSR_sig;

process (EN,l_init)
begin

if l_init = '1' then
		LFSR_sig<=din;

else if en = '1'  and l_init = '0' then

		LFSR_sig(0) <= LFSR_sig(1);
		LFSR_sig(1) <= LFSR_sig(2);
		LFSR_sig(2) <= LFSR_sig(3);
		LFSR_sig(3) <= LFSR_sig(4) xnor LFSR_sig(0);
		LFSR_sig(4) <= LFSR_sig(5) xnor LFSR_sig(0);
		LFSR_sig(5) <= LFSR_sig(6) xnor LFSR_sig(0);
		LFSR_sig(6) <= LFSR_sig(7);
		LFSR_sig(7) <= LFSR_sig(0);
		
		end if;
		
end if;
end process;
end beh;