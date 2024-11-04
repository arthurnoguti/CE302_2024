library(tidyverse)

#Utilizando os dados disponíveis em words crie RegEx capaz de encontrar palavras que:
data("words")
words %>% str()    
#Comece com “y”.
words[str_starts(words,"y")]

#Não comece com “y”.
words[!(str_starts(words,"y"))]

#Termine com “x”.
words[str_ends(words,"x")]

#Tenham exatamente três letras.

words[str_length(words) == 3]
#Tenham sete letras ou mais.
words[str_length(words) >= 7]

#Contenham um par vogal-consoante.

words[str_count(words, "[aeiou][^aeiou]") == 1]

#Contenham pelo menos dois pares vogal-consoante consecutivos.
words[str_count(words, "[aeiou][^aeiou][aeiou][^aeiou]")>= 1]


#Para cada um dos desafios a seguir, tente resolvê-los usando tanto uma única expressão regular quanto uma combinação de várias chamadas de str_detect():
    
#Encontre todas as palavras que começam ou terminam com “x”.

words[str_starts(words, "x") | str_ends(words, "x")]

#Encontre todas as palavras que começam com uma vogal e terminam com uma consoante.
words[str_starts(words, "[aeiou]") & str_ends(words, "[^aeiou]")]

#Existem palavras que contêm pelo menos uma de cada vogal diferente?

words[str_detect(words, ".*a.*e.*i.*o.*u.*")] #não
    
#Em `colors()` existem diversos modificadores de cores como light e dark. Crie um banco contendo o nome da cor original e o nome sem o modificador.

cor <- colors()
# light, dark
t_cor <- tibble( cor_original = cor) 

t_cor <- t_cor %>% 
    mutate(cor_pura = str_remove(cor_original, "light|dark"))
