LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY d_ff IS
PORT ( D: IN STD_LOGIC ;
		  clk : IN STD_LOGIC ;
		  Q : OUT STD_LOGIC) ;
END d_ff ;
ARCHITECTURE beh OF d_ff IS
BEGIN
PROCESS ( clk )
BEGIN
IF clk'EVENT AND clk = '1' THEN
Q <= D ;
END IF ;
END PROCESS;
end beh;