----------------------------------------------------------
--
-- Template for 4-digit 7-segment display driver testbench.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado v2020.2, EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
----------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for testbench
----------------------------------------------------------

entity tb_dekoder is
  -- Entity of testbench is always empty
end entity tb_dekoder;

----------------------------------------------------------
-- Architecture body for testbench
----------------------------------------------------------

architecture testbench of tb_dekoder is

  -- Testbench local constants
  constant c_CLK_100MHZ_PERIOD : time := 10 ns;

  -- Testench local signals
  signal sig_clk_100mhz : std_logic;
  signal sig_rst        : std_logic;
  signal sig_input      : std_logic_vector(1 downto 0);
  signal sig_slovo      : std_logic_vector(4 downto 0);

begin

  -- Connecting testbench signals with dekoder
  -- entity (Unit Under Test)
  uut_dekoder : entity work.dekoder
    port map (
      clk     => sig_clk_100mhz,
      rst     => sig_rst,
      input   =>sig_input,
      slovo   => sig_slovo
    );

  --------------------------------------------------------
  -- Clock generation process
  --------------------------------------------------------
  p_clk_gen : process is
  begin

    while now < 400 ns loop -- 40 periods of 100MHz clock

      sig_clk_100mhz <= '0';
      wait for c_CLK_100MHZ_PERIOD / 2;
      sig_clk_100mhz <= '1';
      wait for c_CLK_100MHZ_PERIOD / 2;

    end loop;
    wait;

  end process p_clk_gen;

  --------------------------------------------------------
  -- Reset generation process
  --------------------------------------------------------
  p_reset_gen : process is
  begin

    sig_rst <= '0';
    wait for 50 ns;
    sig_rst <= '1';
    wait for 60 ns;
    sig_rst <= '0';
    -- WRITE YOUR CODE HERE AND ACTIVATE RESET FOR A WHILE

    wait;

  end process p_reset_gen;

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";

    -- WRITE YOUR CODE HERE AND TEST INPUT VALUE
    -- Display "3.142"
    sig_input <= "00";
    wait for 20 ns;
    sig_input <= "01";
    wait for 20 ns;    
    sig_input <= "01";   
    wait for 20 ns;
    sig_input <= "11";
    wait for 20 ns;    
    sig_input <= "10";
    wait for 20 ns;    
    sig_input <= "10";
    wait for 20 ns;    
    sig_input <= "11";
    wait for 20 ns;
    sig_input <= "00";
    wait for 20 ns;    
    sig_input <= "11";
    wait for 20 ns;    
    sig_input <= "10";
    wait for 20 ns;    
    sig_input <= "11";
    wait for 20 ns;  
    sig_input <= "10";
    wait for 20 ns;  
    sig_input <= "11";
    wait for 20 ns;  
    sig_input <= "00";
    wait for 20 ns;  
    sig_input <= "11";
    wait for 20 ns;  
    sig_input <= "10";
    wait for 20 ns;  
    
    sig_input <= "00";
    wait for 20 ns;    
    sig_input <= "00";         

    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;
