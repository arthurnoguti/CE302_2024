library(tidyverse)
require(nycflights13)

#Para vôos com atraso superior a 24 horas em flights, verifique as condições climáticas em weather. 
#Há algum padrão? Quais os meses do ano em que você encontra os maiores atrasos?

full_join(flights, weather,  by = c("origin", "year", "month", "day", "hour")) %>% 
    filter(dep_delay >= 24 | arr_delay >= 24)



#Encontre os 20 destinos mais comuns e identifique seu aeroporto. 
#Qual a temperatura média (mensal) em Celcius desses lugares? E a precipiração média, em cm?

flights$dest %>% 
    table() %>% 
    sort()
view(airports)
full_join(flights, weather,  by = c("origin", "year", "month", "day", "hour")) %>% 
    left_join(., airports, by = c("dest" = "faa")) %>% 
    group_by(dest, name) %>% 
    summarise(total = n(),
              temp_media = (mean(temp)-32)/1.8,
              precip_media = (mean(precip)*2.54)) %>% 
    na.omit() %>% 
    arrange(desc(total)) %>% 
    head(20)

#Inclua uma coluna com a cia aérea na tabela planes. 
#Quantas companhias áreas voaram cada avião naquele ano?
    
t1 <- full_join(planes, flights[,c("carrier","tailnum")], by = "tailnum") %>% 
    left_join(. , airlines, by = "carrier") %>% 
    group_by(tailnum , name) %>% 
    summarise(n = n()) 

t1 <- t1[,-3]

t1 %>% 
    group_by(tailnum) %>% 
    summarise(total = n()) %>% 
    arrange(desc(total)) %>% 
    na.omit()


#Inclua a latitude e longitude de cada origem destino na tabela flights.
left_join(flights, airports[,c("faa","lat","lon")], by = c("origin" = "faa")) %>% 
    left_join(., airports[,c("faa","lat","lon")], by = c("dest" = "faa"), suffix = c(".origin", ".dest"))


