source("lib/libraries.r", 
       echo = FALSE,
       verbose = FALSE,
       encoding = "UTF-8")
source("lib/xml.r", 
       echo = FALSE,
       verbose = FALSE,
       encoding = "UTF-8")

url <- "http://www.pordata.pt/en/DB/Europe/Search+Environment/Table/5692626"

doc.podatki <- html_session(url) %>% read_html(encoding = "UTF-8")

tabela <- doc.podatki %>% html_nodes(xpath="//table") %>% .[[11]] %>% html_table()

leta <- doc.podatki %>% html_nodes(xpath="//table") %>% .[[10]] %>% html_table(fill=TRUE)

drzave_ <- doc.podatki %>% html_nodes(xpath="//table") %>% .[[9]] %>% html_table(fill=TRUE)

tabela[tabela=="x"] <- NA
tabela <- tabela[1:11,]
row.names(tabela) <- leta[1:11,]
names(tabela) <- drzave_[5,1:105]

ciscenje1 <- function(ime){
  pos1 <-  regexpr("Â", ime, ignore.case = FALSE,fixed = FALSE, useBytes = FALSE)+1;
  pos2 <- regexpr("s", ime, ignore.case = FALSE,fixed = FALSE, useBytes = FALSE)+1;
  pos3 <- regexpr("o", ime, ignore.case = FALSE,fixed = FALSE, useBytes = FALSE)+1;
  pos <- max(pos1,pos2,pos3) #zaradi neznanega razloga to deluje na tabeli income vendar ne na edu
  d <- substr(ime,start = pos,stop=nchar(ime));
  return(d)
}

ciscenje1 <- Vectorize(ciscenje1)

tabela <- apply(tabela, 2, . %>% {gsub("[^0-9]", "", .)} %>% as.numeric()) %>% data.frame()


for (i in 1:105) {
  tabela[,i]<-ciscenje1(tabela[,i])
  tabela[,i] <- sapply(tabela[,i], as.numeric)
}

income_edu_all <- tabela
income_prim <- income_edu_all[2:11,5:35]
income_sec <- income_edu_all[2:11,40:70]
income_ter <- income_edu_all[2:11,75:105]


