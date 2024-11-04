library(tidyverse)

car_crash <- read.csv(choose.files())

# Selecione as variáveis data, tipo_de_ocorrencia, automovel, bicicleta, onibus, caminhao, moto, trator, outros e total.

car_crash %>% 
    select(data,tipo_de_ocorrencia,automovel,bicicleta,onibus,caminhao,moto,outros)

# Selecione todas as variáveis que contenham a palavra feridos.

car_crash %>% 
    select(contains("feridos")) %>% 
    head()

# Selecione todas as variáveis numéricas.
car_crash %>% 
    select(where(is.numeric))

# Selecione todas as variáveis lógicas.
car_crash %>% 
    select(where(is.logical))

# Selecione todas as variáveis que terminem com a letra o.
car_crash %>% 
    select(ends_with("o")) %>% 
    head()

# Selecione todas as variáveis que iniciem com a letra t.

car_crash %>% 
    select(starts_with("t")) %>% 
    head()

#Filtre as observações com pelo menos 5 carros E 3 motos envolvidos no acidente.
car_crash %>% 
    filter(automovel >= 5 & moto >= 3) 

#Filtre as observações com pelo menos 5 carros OU 3 motos envolvidos no acidente.
car_crash %>% 
    filter(automovel >= 5 | moto >= 3) 


#Filtre as observações com vítimas.
car_crash$tipo_de_ocorrencia %>% table()
car_crash$tipo_de_ocorrencia <- tolower(car_crash$tipo_de_ocorrencia)

car_crash %>% 
    filter(str_detect(car_crash$tipo_de_ocorrencia,"com v(í|i)tima"))


#Filtre as observações com pelo menos 5 carros OU 
#3 motos envolvidos no acidente E que ocorreram em alguma das seguintes operadoras: 
#“Autopista Regis Bittencourt”, “Autopista Litoral Sul”, “Via Sul”.

car_crash$lugar_acidente %>% table()

car_crash %>% 
    filter(automovel >= 5 | moto >= 3) %>% 
    filter(lugar_acidente == "Autopista Regis Bittencourt" | 
               lugar_acidente == "Autopista Litoral Sul" | 
               lugar_acidente == "Via Sul")


