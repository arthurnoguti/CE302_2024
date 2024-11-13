library(tidyverse)
#Crie uma função que calcule os n primeiros números da sequência de Fibonacci. 
#A sequência de Fibonacci começa com 0 e 1, e os números subsequentes são a 
#soma dos dois anteriores (0, 1, 1, 2, 3, 5, 8, …).

fibo <- function(x){
    f <- c(0,1)
    i <- 1
    while (i <= x) {
        k <- f[i]+f[i+1]
        f <- c(f,k)
        i <- i+1
    }
    return(f[c(-length(f),-length(f)+1 )])
}

fibo(1)
fibo(3)
fibo(5)
fibo(10)

#Crie uma função que verifique se um número n é primo.

primo <- function(x){
    x
}


#Calcule o 1o. e 2o. Quartil para todas as variáveis numéricas de mtcars. 
#Se uma variável não for numérica retorne NA. Lembre-se cyl, vs e am são categóricas, e não numéricas.
