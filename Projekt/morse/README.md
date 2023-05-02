## Členové týmu
- Matěj Výlet (dokumentace)
- Marek Kožiak (programování)

## Teorie



```vhdl
    --------------------------------------------------------
    -- p_mux:
    -- A sequential process that implements a multiplexer for
    -- selecting data for a single digit, a decimal point,
    -- and switches the common anodes of each display.
    --------------------------------------------------------
     p_mux : process (clk) is
  begin

    if (rising_edge(clk)) then
      if (rst = '1') then
        sig_hex <= data0;
        dp      <= dp_vect(0);
        dig     <= "1110";
      else

        case sig_cnt_2bit is

          when "11" =>
            sig_hex <= data3;
            dp      <= dp_vect(3);
            dig     <= "0111";

          when "10" =>
            -- DEFINE ALL OUTPUTS FOR "10" HERE
            sig_hex <= data2;
            dp      <= dp_vect(2);
            dig     <= "1011";

          when "01" =>
            -- DEFINE ALL OUTPUTS FOR "01" HERE
            sig_hex <= data1;
            dp      <= dp_vect(1);
            dig     <= "1101";

          when others =>
            -- DEFINE ALL OUTPUTS FOR "00" HERE
            sig_hex <= data0;
            dp      <= dp_vect(0);
            dig     <= "1110";

        end case;

      end if;
    end if;

  end process p_mux;
```

### Eight-digit driver
