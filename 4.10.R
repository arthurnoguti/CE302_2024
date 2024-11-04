TB <- read_csv('/home/est/ahn22/Downloads/TB.csv.gz')

# Feito na sala ----
TB1 <- TB %>% 
    pivot_longer(
        cols = -c(1:4), 
        names_to = "chave", 
        values_to = "casos", 
        values_drop_na = TRUE
    )
TB1

TB1 %>% 
    count(chave) 


TB1 %>% filter(chave %in% "new")
TB1  %>%  filter(chave %like% "^new")


TB2 <- TB1 %>% 
    mutate(chave = stringr::str_replace(chave, "newrel", "new_rel"))
TB2

TB3 <- TB2 %>% 
    separate(chave,
             c("new", "type", "sexage"), 
             sep = "_")
TB3

TB4 <- TB3 %>% 
    select(-new, -iso2, -iso3)

TB5 <- TB4 %>% 
    separate(sexage, c("sexo", "idade"), sep = 1)
TB5

# Exercícios ----

#Utilizando os dados de TB5, crie uma tabela em formato wide, 
#com a quantidade de casos por país por ano. Cada ano deve ser chamado “Ano_.
#Utilizando os dados de TB5, crie uma tabela em formato wide, com a quantidade de casos por país, ano, idade e sexo.
#Dica: Utilize o argumento values_fn da função.
#Volte o banco criado em 1 e 2 para o formato long.

TB6 <- TB5 %>% 
    pivot_wider(names_from = year, values_from = casos)

TB6 %>% 
    rename(paste("Ano",select(TB6, starts_with("1")|starts_with("2"))) = select(TB6, starts_with("1")|starts_with("2")))

TB6 %>% 
    select(starts_with("1")|starts_with("2"))

select(TB6, starts_with("1")|starts_with("2"))
