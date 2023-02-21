# Lab 2: Matěj Výlet

### 2-bit comparator

1. Karnaugh maps for other two functions of 2-bit comparator:

   Greater than:
   ![K-maps](https://user-images.githubusercontent.com/124773189/220407055-eb5e2687-f83f-4e7a-9049-467c41bf1df2.png)

   

   Less than:
   ![K-maps](https://user-images.githubusercontent.com/124773189/220410732-6f622079-7c78-42a5-ad6d-8099c16686c1.png)

  

2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   $$greater_{\text{SoP}}^{\text{min}}= b_1 \cdot \bar{a}_1 + b_1 \cdot b_0 \cdot \bar{a}_0 + b_0 \cdot \bar{a}_1 \cdot \bar{a}_0 $$ 
   
   $$less_{\text{PoS}}^{\text{min}}= (a_1 + a_0) \cdot (\bar{b}_1 + \bar{b}_0) \cdot (\bar{b}_0 + a_1) \cdot (\bar{b}_1 + a_0) $$ 

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **15**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case
        s_b <= "0001"; -- Such as "0101" if ID = xxxx56
        s_a <= "0101";        -- Such as "0110" if ID = xxxx56
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '1'))
        -- If false, then report an error
        report "Input combination 0001 0101" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Link to your public EDA Playground example:

   [https://www.edaplayground.com/...](https://www.edaplayground.com/x/KZYF)
