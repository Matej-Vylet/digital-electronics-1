----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2023 11:41:46
-- Design Name: 
-- Module Name: dekoder - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dekoder is
    Port (
     input : in STD_LOGIC_vector(1 downto 0);
     clk : in std_logic;
     rst     : in    std_logic;
     slovo: out std_logic_vector(4 downto 0)
     
     );
end dekoder;

architecture Behavioral of dekoder is
signal sig_en_clk: std_logic;
signal sig_input: std_logic_vector(1 downto 0);
signal sig_slovo : std_logic_vector(4 downto 0);
signal index : natural :=0 ;

begin

  clk_en0 : entity work.clock_enable
    generic map (
      -- FOR SIMULATION, KEEP THIS VALUE TO 4
      -- FOR IMPLEMENTATION, CHANGE THIS VALUE TO 400,000
      -- 4      @ 4 ns
      -- 400000 @ 4 ms
      g_MAX => 4
    )
    port map (
      clk => clk, -- WRITE YOUR CODE HERE
      rst => rst,-- WRITE YOUR CODE HERE
      ce  => sig_en_clk
    );

sig_input<=input;
prevod : process(sig_input, rst) is 

begin
  if(rst = '1') then
    slovo <= "00000";
    index <=0;
 else
    if(index=5) then
        index <=index+1;
    end if;
   
    if(sig_input = "11") then
        sig_slovo(index) <= '1';
        index<= index+1;
    
    elsif (sig_input = "10") then
        sig_slovo(index) <= '0';
        index<= index+1;
    
    else
    slovo<=sig_slovo;
    sig_slovo<="00000";
    index<=0;
        
        
 
     end if;   
   end if;   

end process prevod;

end Behavioral;
