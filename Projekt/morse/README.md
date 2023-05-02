## Členové týmu
- Matěj Výlet (dokumentace)
- Marek Kožiak (programování)

## Teorie

Naprogramujte vysílač a přijímač morseova kódu.

Projekt jsme si rozdělili na několik dílčích modulů: 
- přijímání a vysílíní samotného signálu
- překlad signálu do morseovy abecedy
- překlad morseovy abecedy do obyčejné abecedy

Vstupní signál je nejpre čten buď ze vstupního pinu, nebo je zadáván ručne tlačítkem. Tento signál je poté přeložen do jednotné podoby morseova kódu a poté je přeložen do obyčejné abecedy. 

# Jednotlivé moduly

Schéma celého zapojení
![schema](https://user-images.githubusercontent.com/124773189/235723351-94655544-c47d-464f-babc-84ac22e9b81e.png)


- Reciever

  Je to jednoduchý vstupní modul, který pouze čte hodnoty na vstupu.
 ```vhdl
  process(input)
    begin
        if (input = '1') then
            signal_morse_code <= '1';
        else
            signal_morse_code <= '0';
        end if;
    end process;
   ```
- Reader_t
```vhdl
process_read : process (clk) is
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                signal_count_HIGH <= 0;
                signal_count_LOW <= 0;
            else if (sig_en_10ms = '1') then
                if (signal_morse_code  = '1') then
                    signal_count_HIGH <= signal_count_HIGH + 1;
                else 
                    signal_count_LOW <= signal_count_LOW + 1;
                end if;
            end if;
            end if;
        end if;
    

        if (signal_morse_code = '0') then
            if (signal_count_HIGH > 0) then
                if (signal_count_HIGH < 20) then 
                    morse_code_symbol <= '0';
                    signal_count_HIGH <= 0;
                else 
                    morse_code_symbol <= '1';
                    signal_count_HIGH <= 0;
                end if;
            end if;   
                signal_count_HIGH <= 0;
                signal_count_LOW <= 0;
         end if;
        
    end process;
    
    process_idle : process (signal_count_LOW)
    begin
        if (signal_count_LOW > 100) then
            input_idle <= '1';
        else
            input_idle <= '0';
        end if;    
    end process;
   ```
  Tento modul čte data, která přicházejí z tlačítka používané uživatalem a rozpoznává, jestli je na vstupu čárka nebo tečka.
  ![testbench reciever](https://user-images.githubusercontent.com/124773189/235714979-1fd64dcf-fe9d-457f-9590-126826809882.png)
  
- Reader_r
  
  Stejně jako předchozí modul rozpoznává čárku nebo tečku na vstupu. Tento vstup však pochází z datového pinu. Jelikož ani jeden z nás pořádně neví, co dělá, je možné, že tento modul je zbytečný.
  
- Clock_enable

  Vstupem je hodinový signál desky a výstupem je zpomalený signál, který lze použít k časování.
 
 ```vhdl
  p_clk_enable : process (clk) is
  begin

    if rising_edge(clk) then              -- Synchronous process
      if (rst = '1') then                 -- High-active reset
        sig_cnt <= 0;                     -- Clear local counter
        ce      <= '0';                   -- Set output to low

      -- Test number of clock periods
      elsif (sig_cnt >= (g_MAX - 1)) then
        sig_cnt <= 0;                     -- Clear local counter
        ce      <= '1';                   -- Generate clock enable pulse
      else
        sig_cnt <= sig_cnt + 1;
        ce      <= '0';
      end if;
    end if;

  end process p_clk_enable;
  ```
- Translater_t

  Pomocí tohoto modulu se převádí písmena abecedy do binární reprezentace morseovy abecedy

- Transmitter
  
  Převádí stisknutí tlačítka na digitální impuls.
  
Tento projekt není ani z daleka dokončen, ale nebylo na něm stráveno málo hodin. Myslím, že hlavní příčina tohoto nezdaru je, že ani jeden jsme plně nepochopili podstatu programování v jazyce VHDL, tudíž jsme naráželi na pro nás nečekané a nepochopitelné překážky. Jednou takovou překážkou ku příkladu byl jev, při kterém nebylo možno změnit hodnotu v signálu ani po prokazatelně vykonaném přiřazovacím příkazu. Jsem si jistý, že tento problém má docela jednoduché řešení, ale nebyl jsem ho schopný najít. Takových problémů bylo však více.
  
## Návod k obsluze

Vzhedem k tomu, že není projekt dokončen, neuvádíme ani návod k obsluze, ani instruktážní video.









