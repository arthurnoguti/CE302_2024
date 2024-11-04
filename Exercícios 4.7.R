library(tidyverse)

car_crash <- read.csv(choose.files())
#Utilizando o banco de dados car_crash formate a coluna data em uma data (dd-mm-yyyy);
car_crash$data <- as.Date(car_crash$data, 
                      format = "%d/%m/%Y")


#Utilizando o banco de dados car_crash formate a coluna horario para o horário do acidente (hh:mm:ss)
car_crash$horario <- hms(car_crash$horario)

#Qual o mês com maior quantidade de acidentes?
car_crash %>% 
    group_by(month(data)) %>% 
    summarise(total = n()) %>% 
    arrange(desc(total))

car_crash %>% 
    group_by(month(data)) %>% 
    summarise(total = n()) %>% 
    slice_max(total)

    
#Qual ano ocorreram mais acidentes?
car_crash %>% 
    group_by(year(data)) %>% 
    summarise(total = n()) %>% 
    slice_max(total)

#Qual horário acontecem menos acidentes?
car_crash %>% 
    group_by(hour(horario)) %>% 
    summarise(total = n()) %>% 
    arrange(total)

car_crash %>% 
    group_by(hour(horario)) %>% 
    summarise(total = n()) %>% 
    slice_min(total)

#Qual a média, desvio padrão, mediana, Q1 e Q3 para a quantidade de indivíduos classificados como levemente feridos por mês/ano?
    
car_crash %>% 
    group_by(month(data)) %>% 
    summarise(media = mean(levemente_feridos, na.rm = TRUE),
              desvio = sd(levemente_feridos, na.rm = TRUE),
              mediana = median(levemente_feridos, na.rm = TRUE),
              Q1 = quantile(levemente_feridos, probs = 0.25, na.rm = TRUE),
              Q3 = quantile(levemente_feridos, probs = 0.75, na.rm = TRUE))

car_crash %>% 
    group_by(year(data)) %>% 
    summarise(media = mean(levemente_feridos, na.rm = TRUE),
              desvio = sd(levemente_feridos, na.rm = TRUE),
              mediana = median(levemente_feridos, na.rm = TRUE),
              Q1 = quantile(levemente_feridos, probs = 0.25, na.rm = TRUE),
              Q3 = quantile(levemente_feridos, probs = 0.75, na.rm = TRUE))

#Quantos acidentes com vítimas fatais aconteceram, por mês/ano, em mediana entre as 6:00am e 11:59am.
car_crash %>%
    filter(between(horario, hms("6:00:00"), hms("11:59:00")) &
               mortos > 0) %>%
    group_by(month(data)) %>%
    summarise(mediana = median(mortos))

car_crash %>%
    filter(between(horario, hms("6:00:00"), hms("11:59:00")) &
               mortos > 0) %>%
    group_by(year(data)) %>%
    summarise(mediana = median(mortos))

car_crash %>%
    filter(between(horario, hms("6:00:00"), hms("11:59:00")) &
               mortos > 0) %>%
    group_by(data) %>%
    summarise(mediana = median(mortos))
