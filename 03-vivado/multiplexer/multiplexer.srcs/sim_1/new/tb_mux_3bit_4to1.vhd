----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.02.2023 12:22:53
-- Design Name: 
-- Module Name: tb_mux_3bit_4to1 - Behavioral
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

entity tb_mux_3bit_4to1 is
--  Port ( );
end tb_mux_3bit_4to1;

architecture testbench of tb_mux_3bit_4to1 is
       signal s_a           :  std_logic_vector(3 - 1 downto 0);
       signal s_b           :  std_logic_vector(3 - 1 downto 0);
       signal s_c           :  std_logic_vector(3 - 1 downto 0);
       signal s_d           :  std_logic_vector(3 - 1 downto 0);
       signal s_e           :  std_logic_vector(3 - 1 downto 0);
       signal s_sel         :  std_logic_vector(2 - 1 downto 0);
       signal  s_f_o          :  std_logic_vector(3 - 1 downto 0);
begin

 uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
        port map(
            a_i           => s_a,
            b_i           => s_b,
            c_i           => s_c,
            d_i           => s_d,
            e_i            => s_e,
            f_o           => s_f_o,
            sel_i         => s_sel           
        );
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case
        s_a <= "000"; 
        s_b <= "001"; 
        s_c <= "010"; 
        s_d <= "011";  
        s_sel <= "10";   
        wait for 100 ns;
        -- Expected output
        assert (s_f_o = "010") 
                
        -- If false, then report an error
        report "Sel 10, c 010" severity error;
        
        s_a <= "001"; 
        s_b <= "010"; 
        s_c <= "011"; 
        s_d <= "100";  
        s_sel <= "11";   
        wait for 100 ns;
        -- Expected output
        assert (s_f_o = "100") 
                
        -- If false, then report an error
        report "Sel 11, d 100" severity error;
        

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end testbench;
