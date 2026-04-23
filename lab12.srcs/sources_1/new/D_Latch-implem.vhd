----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2026 10:50:57 AM
-- Design Name: 
-- Module Name: D_Latch-implem - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity D_Latch_implem is
    PORT ( Clk, D: IN STD_LOGIC;
           Q         : OUT STD_LOGIC);
end D_Latch_implem;

architecture Behavioral of D_Latch_implem is

    signal D   : std_logic;
    signal Clk : std_logic;
    signal Q   : std_logic;
    
begin


end Behavioral;
