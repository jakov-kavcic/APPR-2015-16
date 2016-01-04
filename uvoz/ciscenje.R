source("lib/libraries.r", 
       echo = FALSE,
       verbose = FALSE,
       encoding = "UTF-8")

source("uvoz/xml+.R", 
       echo = FALSE,
       verbose = FALSE,
       encoding = "UTF-8")

source("uvoz/uvoz.R", 
       echo = FALSE,
       verbose = FALSE,
       encoding = "UTF-8")

tabela <- c(1,1,1,1,1) 
tabela <- t(tabela) %>% data.frame() 
names(tabela) <- c("Drzava","Leto","Izobrazba","Procent","Dohodek")
for (i in drzave) {
  for (l in leta){
      c <- c(i,l,"prim" ,edu_1[i,l],income_prim[l,i])
      d <- c(i,l,"sec" ,edu_2[i,l],income_sec[l,i])
      e <- c(i,l,"ter" ,edu_3[i,l],income_ter[l,i])
      tabela <- rbind(tabela,c,d,e)
    }
}
tabela <- tabela[2:901,]
row.names(tabela) <- c(1:900)

attach(tabela)

leto <- factor(leto, levels = leta, ordered = TRUE)
izobrazba <- factor(izobrazba, levels = c("prim","sec","ter"),ordered = TRUE)

detach(tabela)

income_ <- income
income <- t(c(1,1,1)) %>% data.frame()
names(income) <- c("Drzava","Leto","Dohodek")
for (i in drzave) {
  for (l in leta){
    c <- c(i,l,income_[i,l])
    income <- rbind(income,c)
  }
}
income <- income[2:901,]
row.names(income) <- c(1:900)
