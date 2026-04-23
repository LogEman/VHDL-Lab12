--=========================================================
-- Testbench for Master-Slave D Flip-Flop
--=========================================================
library ieee;
use ieee.std_logic_1164.all;

entity MS_DFF_tb is
end MS_DFF_tb;

architecture behavior of MS_DFF_tb is

    component Master_Slave
        port (
            D   : in  std_logic;
            Clk : in  std_logic;
            Q   : out std_logic
        );
    end component;

    signal D   : std_logic := '0';
    signal Clk : std_logic := '0';
    signal Q   : std_logic;

    constant clk_period : time := 20 ns;

begin

    -- UUT instantiation
    uut : Master_Slave
        port map (
            D   => D,
            Clk => Clk,
            Q   => Q
        );

    ---------------------------------------------------------
    -- Clock: 50 MHz equivalent (for sim only)
    ---------------------------------------------------------
    clk_process : process
    begin
        Clk <= '0';
        wait for clk_period/2;
        Clk <= '1';
        wait for clk_period/2;
    end process;

    ---------------------------------------------------------
    -- Stimulus: change D around clock edges
    ---------------------------------------------------------
    stim_proc : process
    begin
        -- 1) Start with D = 0
        D <= '0';
        wait for 3 * clk_period;

        -- 2) Set D = 1 before a rising edge
        D <= '1';
        wait for 3 * clk_period;

        -- 3) Change D back to 0 (between edges)
        D <= '0';
        wait for 3 * clk_period;

        -- 4) Set D = 1 again
        D <= '1';
        wait for 3 * clk_period;

        wait;  -- end simulation
    end process;

end behavior;
