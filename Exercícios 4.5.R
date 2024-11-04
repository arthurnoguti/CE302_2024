library(tidyverse)
data(starwars)
starwars

#Qual é o número total de espécies únicas presentes? Qual a frequência de indivíduos por espécie?
starwars$species %>% 
    table() %>% 
    length()

starwars %>% 
    group_by(species) %>% 
    summarise(total = n()) %>% 
    arrange(desc(total)) %>% 
    na.omit()
    
#Calcule a altura média de personagens masculinos e femininos.
starwars %>% 
    group_by(sex) %>% 
    summarise(altura_media = median(height, na.rm = TRUE)) %>% 
    na.omit()


#Qual é a média de idade dos personagens de cada espécie para personagens masculinos?

starwars %>% 
    filter(sex == "male") %>% 
    group_by(species) %>% 
    summarise(idade_media = median(birth_year, na.rm = TRUE))


#Para cada espécie presente na base de dados, identifique o personagem mais velho e sua idade correspondente.

starwars %>% 
    group_by(species) %>% 
    summarise(n = n(),
              idade = max(birth_year),
              personagem = name[which.max(birth_year)]) 

