# Lab 1: Matěj Výlet

### De Morgan's laws

1. Equations of all three versions of logic function f(c,b,a):

   ![Logic function](images/equations.png)
   
   $$f_{\text{ORIG}}(c, b, a)= \bar{b} \cdot a+c \cdot \overline{(b+\bar{a})}$$ 
   $f_{\text{(N)AND}}(c, b, a)= \overline{\overline{(\bar{b} \cdot a)} \cdot \overline{c \cdot (\bar{b} \cdot a)}}$ 
   $f_{\text{(N)OR}}(c, b, a)= \overline{(b+\bar{a})} + \overline{\bar{c} + (b+\bar{a})}$
   

2. Listing of VHDL architecture from design file (`design.vhd`) for all three functions. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture dataflow of gates is
begin
    f_orig_o <= (not(b_i) and a_i) or (c_i and not(b_i or not(a_i)));
    f_nand_o <= not((not(not(b_i) and a_i)) and (not(c_i and(not( b_i) and a_i)))); -- MODIFY THIS FUNCTION
    f_nor_o  <= not(b_i or not(a_i)) or not(not(c_i) or ( b_i or not(a_i)));  -- MODIFY THIS FUNCTION
end architecture dataflow;
```

3. Complete table with logic functions' values:

   | **c** | **b** |**a** | **f_ORIG** | **f_(N)AND** | **f_(N)OR** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 0 | 0 | 0 |
   | 0 | 0 | 1 | 1 | 1 | 1 |
   | 0 | 1 | 0 | 0 | 0 | 0 |
   | 0 | 1 | 1 | 0 | 0 | 0 |
   | 1 | 0 | 0 | 0 | 0 | 0 |
   | 1 | 0 | 1 | 1 | 1 | 1 |
   | 1 | 1 | 0 | 0 | 0 | 0 |
   | 1 | 1 | 1 | 0 | 0 | 0 |

### Distributive laws

1. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![My_figure](https://user-images.githubusercontent.com/124773189/218765304-321538d0-ee5a-4138-8a1e-f67f61131b97.png)


2. Link to your public EDA Playground example:

   [https://www.edaplayground.com/...](https://www.edaplayground.com/...)
