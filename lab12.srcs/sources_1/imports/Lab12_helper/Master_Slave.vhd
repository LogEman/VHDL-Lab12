----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/25/2021 09:18:15 PM
-- Design Name: 
-- Module Name: Master_Slave - Behavioral
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

entity Master_Slave is
    Port ( D : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC);
end Master_Slave;

architecture Behavioral of Master_Slave is
signal Q_m: STD_LOGIC;
signal inv_Clk: STD_LOGIC;

component D_Latch IS
    PORT ( Clk, D: IN STD_LOGIC;
           Q         : OUT STD_LOGIC); -- keep on changing the D switch. The output will change only at the +ve cycle of the clock
END component;

begin

inv_Clk <= not Clk;

Master: D_Latch port map(
    Clk => Clk,
    D => D,
    Q => Q_m
    );
  
Slave: D_Latch port map(
    Clk => inv_Clk,
    D => Q_m,
    Q => Q
    );
    
end Behavioral;
