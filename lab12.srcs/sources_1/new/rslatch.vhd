-- Gated RS Latch (Structural Description)
--=========================================================
library ieee;
use ieee.std_logic_1164.all;

entity RSLatch is
    port (
    Clk : in std_logic;
    R : in std_logic;
    S : in std_logic;
    Q : out std_logic
    );
end RSLatch;

architecture Structural of RSLatch is
    -- Internal signals
    signal R_g : std_logic;
    signal S_g : std_logic;
    signal Qa : std_logic;
    signal Qb : std_logic;
    -- Keep attribute preserves internal nodes
    attribute keep : boolean;
    attribute keep of R_g, S_g, Qa, Qb : signal is true;
    begin
    -- Clock-gated inputs
    R_g <= R and Clk;
    S_g <= S and Clk;
    -- Cross-coupled NOR latch
    Qa <= not (R_g or Qb);
    Qb <= not (S_g or Qa);
    -- Output
    Q <= Qa;
end Structural;