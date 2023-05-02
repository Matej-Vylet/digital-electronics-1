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

  Tento modul čte data, která přicházejí z tlačítka používané uživatalem a rozpoznává, jestli je na vstupu čárka nebo tečka.
  ![testbench reciever](https://user-images.githubusercontent.com/124773189/235714979-1fd64dcf-fe9d-457f-9590-126826809882.png)
  
- Reader_r
  
  Stejně jako předchozí modul rozpoznává čárku nebo tečku na vstupu. Tento vstup však pochází z datového pinu. Jelikož ani jeden z nás pořádně neví, co dělá, je možné, že tento modul je zbytečný.
  
- Clock_enable

  Vstupem je hodinový signál desky a výstupem je zpomalený signál, který lze použít k časování.
  
- Translater_t

  Pomocí tohoto modulu se převádí písmena abecedy do binární reprezentace morseovy abecedy
  









