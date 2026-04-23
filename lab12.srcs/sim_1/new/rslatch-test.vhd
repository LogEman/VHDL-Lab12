LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY RSLatch_tb IS
END RSLatch_tb;
ARCHITECTURE behavior OF RSLatch_tb IS
COMPONENT RSLatch
PORT(Clk,R,S : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END COMPONENT RSLatch;
signal S : std_logic := '0';
signal R : std_logic := '0';
signal Clk : std_logic := '0';
signal Q : std_logic;
constant clk_period : time := 10 ns;
BEGIN
uut: RSLatch PORT MAP (Clk => Clk,
R=>R,
S=>S,
Q=>Q);
-- Clock process definitions( clock with 50% duty cycle is generated here.
clk_process :process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process;
rslatch_proc :process
begin
s <= '0';
r <= '1';
wait for 20ns;
s <= '1';
r <= '0';
wait for 20ns;
s <= '0';
r <= '0';
wait for 20ns;
s <= '1';
r <= '1';
wait for 20ns;
end process;
END;