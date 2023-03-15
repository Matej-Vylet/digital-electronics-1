# Lab 6: Matěj Výlet

### Bidirectional counter

1. Listing of VHDL code of the completed process `p_cnt_up_down`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
p_cnt_up_down : process (clk) is
  begin

    if rising_edge(clk) then
      if (rst = '1') then           -- Synchronous reset
        sig_cnt <= (others => '0'); -- Clear all bits
      elsif (en = '1') then         -- Test if counter is enabled
        if (cnt_up = '1') then
        -- TEST COUNTER DIRECTION HERE
        sig_cnt <= sig_cnt + 1;
        else
        sig_cnt <= sig_cnt - 1;
        end if;
      end if;
    end if;

  end process p_cnt_up_down;
```

2. Screenshot with simulated time waveforms. Test: (a) reset, (b) counter direction, (c) enable. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![Simulated time waveforms](https://user-images.githubusercontent.com/124773189/225330205-3c80fd65-b4eb-429f-a91d-0900e09c85c0.png)



### Two counters

1. Image of the top layer structure including both counters, ie a 4-bit bidirectional counter from *Part 4* and a 12-bit counter with a 10 ms time base from *Experiments on your own*. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

![counter](https://user-images.githubusercontent.com/124773189/225352099-0eb535e8-75a6-4e20-80dc-7467a29597f7.jpg)
