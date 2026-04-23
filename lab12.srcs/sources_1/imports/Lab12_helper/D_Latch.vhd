-- A gated RS latch described the hard way
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY D_Latch IS
    PORT ( Clk, D: IN STD_LOGIC;
           Q         : OUT STD_LOGIC); -- keep on changing the D switch. The output will change only at the +ve cycle of the clock
END D_Latch ;

ARCHITECTURE Structural OF D_Latch IS
  SIGNAL R_g, S_g, Qa, Qb : STD_LOGIC ;
  Signal R, S: STD_LOGIC;
  ATTRIBUTE keep : boolean;
  ATTRIBUTE keep of R_g, S_g, Qa, Qb, R,S: SIGNAL IS true;
BEGIN

R <= NOT D;

S_g <= NOT (D AND Clk);
R_g <= NOT (R AND CLK);

Qa <= NOT (S_g AND Qb);
Qb <= NOT (R_g AND Qa);

Q <= Qa;

END Structural;