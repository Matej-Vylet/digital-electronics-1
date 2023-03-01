------------------------------------------------------------
--
-- Testbench for 7-segment display decoder.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado v2020.2
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all; -- Definition of "to_unsigned"

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_top is
-- Entity of testbench is always empty
end entity tb_top;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_top is

  -- Testbench local signals
 
  signal sig_SW   : std_logic_vector(3 downto 0);
  signal sig_LED   : std_logic_vector(7 downto 0);

begin

  -- Connecting testbench signals with decoder entity
  -- (Unit Under Test)
  uut_top : entity work.top
    port map (
      SW => sig_SW,
      LED  => sig_LED
      BTCN => sig_BTCN
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";

    sig_blank <= '0';    -- Normal operation
    sig_hex   <= "0011"; -- Some default value
    wait for 50 ns;

    sig_blank <= '1';    -- Blank display
    wait for 150 ns;
    sig_blank <= '0';    -- Normal operation
    wait for 15 ns;

    -- Loop for all hex values
    for ii in 0 to 15 loop

      -- Convert ii decimal value to 4-bit wide binary
      -- s_hex <= std_logic_vector(to_unsigned(ii, s_hex'length));
      sig_hex <= std_logic_vector(to_unsigned(ii, 4));
      wait for 50 ns;

    end loop;

    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;
