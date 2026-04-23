--=========================================================
-- Testbench for Gated D Latch
--=========================================================
library ieee;
use ieee.std_logic_1164.all;

entity DLatch_tb is
end DLatch_tb;

architecture behavior of DLatch_tb is

    -- DUT component
    component D_Latch
        port (
            D   : in  std_logic;
            Clk : in  std_logic;
            Q   : out std_logic
        );
    end component;

    -- TB signals
    signal D   : std_logic := '0';
    signal Clk : std_logic := '0';
    signal Q   : std_logic;

    constant clk_period : time := 10 ns;

begin

    -- Instantiate DUT
    uut : D_Latch
        port map (
            D   => D,
            Clk => Clk,
            Q   => Q
        );

    ---------------------------------------------------------
    -- Clock generation (50% duty cycle)
    ---------------------------------------------------------
    clk_process : process
    begin
        Clk <= '0';
        wait for clk_period/2;
        Clk <= '1';
        wait for clk_period/2;
    end process;

    ---------------------------------------------------------
    -- Stimulus
    ---------------------------------------------------------
    stim_proc : process
    begin
        -- Start with D=0
        D <= '0';
        wait for 20 ns;

        -- Change D to 1 while clock is toggling
        D <= '1';
        wait for 40 ns;

        -- Change D back to 0
        D <= '0';
        wait for 40 ns;

        -- Change D to 1 again
        D <= '1';
        wait for 40 ns;

        wait;  -- stop simulation
    end process;

end behavior;
