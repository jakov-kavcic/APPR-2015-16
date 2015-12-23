# 2. faza: Uvoz podatkov
source("lib/libraries.r", 
      echo = FALSE,
      verbose = FALSE,
      encoding = "UTF-8")
uvozi <- function(a) {
  return(read.delim(a,
      header = TRUE,
      row.names = 1,
      na.strings = ":",
      as.is = TRUE,
      fileEncoding = "UTF-8"))
}


# Zapišimo podatke v razpredelnico income/edu_1/edu_2/edu_3.
i_1 <- "podatki/ilc_di04_1.tsv"
e_1 <- "podatki/edat_lfse_03_1.tsv"
e_2 <- "podatki/edat_lfse_03_3.tsv"
e_3 <- "podatki/edat_lfse_03_4.tsv"
edu_1 <- uvozi(e_1)
edu_2 <- uvozi(e_2)
edu_3 <- uvozi(e_3)
income <- uvozi(i_1)
leta <- c(2005,2006,2007,2008,2009,2010,2011,2012,2013,2014)
imena2 <- c("med 0. in 2. (%)",
           "3. ali 4. (%)",
           "med 5. in 8. (%)",
           "dohodek (eur)")
imena1 <- c("Populacija z izobrazbo \\n na stopnji med 0. in 2. (%)",
            "Populacija z izobrazbo na stopnji 3. iali 4. (%)",
            "Populacija z izobrazbo na stopnji med 5. in 8. (%)",
            "Razpolozljivi dohodek na gospodinjstvo (eur)")
#funkciji za čiščenje
###
imena <- function(ime){
  pos <-  regexpr(",",ime);
  pos_ <- regexpr("\\(",ime);
  if(pos_>0) pos <- pos_; #zaradi neznanega razloga to deluje na tabeli income vendar ne na edu
  d <- substr(ime,start=0,stop=pos-1);
  return(d)
}
imena<- Vectorize(imena)
###

###
ciscenje <- function(t){
t <- t[7:36,]
names(t) <- c(2005,2006,2007,2008,2009,2010,2011,2012,2013,2014)
row.names(t) <- imena(row.names(t))
return(t)
}
###

#Čiščenje
income <- ciscenje(income)

edu_1 <- ciscenje(edu_1)
edu_2 <- ciscenje(edu_2)
edu_3 <- ciscenje(edu_3)

drzave <- row.names(income)

income <- sapply(income,as.numeric)
edu_1 <- sapply(edu_1,as.numeric)
edu_2 <- sapply(edu_2,as.numeric)
edu_3 <- sapply(edu_3,as.numeric)

income <- income*1000
row.names(edu_1) <- drzave
row.names(edu_2) <- drzave
row.names(edu_3) <- drzave
row.names(income) <- drzave

#Funkcija za dobiti podatke od posamezne države
posamezna.drzava <- function(ime){
  a <- edu_1[ime,]
  b <- edu_2[ime,]
  c <- edu_3[ime,]
  d <- income[ime,]
  as<- rbind(a,b,c,d)
  row.names(as) <- imena1
  return(as)
}

#slovenija
slovenija <- posamezna.drzava("Slovenia")
slovenija_ <- slovenija
row.names(slovenija_) <- imena2
#Zapišem tabele

write.csv(income,file="podatki/income.csv")
write.csv(edu_1,file="podatki/edu_1.csv")
write.csv(edu_2,file="podatki/edu_2.csv")
write.csv(edu_3,file="podatki/edu_3.csv")
write.csv(slovenija,file="podatki/slovenija.csv")

#grafi slovenija

graf_si_i <- ggplot(data=data.frame(slovenija[4,]),size=20) + aes(x=leta,y=slovenija[4,]) + geom_point(colour="red")
graf_si_i <- graf_si_i + xlab("leta") + ylab(imena1[4])
graf_si_i <- graf_si_i + scale_x_continuous(breaks=2005:2014) + geom_smooth()

graf_si_edu1 <- ggplot(data=data.frame(slovenija[1,]),size=20) + aes(x=leta,y=slovenija[1,]) + geom_point(colour="red")
graf_si_edu1 <- graf_si_edu1 + xlab("leta") + ylab(imena1[1])
graf_si_edu1 <- graf_si_edu1 + scale_x_continuous(breaks=2005:2014) + geom_smooth()

graf_si_edu2 <- ggplot(data=data.frame(slovenija[2,]),size=20) + aes(x=leta,y=slovenija[2,]) + geom_point(colour="red")
graf_si_edu2 <- graf_si_edu2 + xlab("leta") + ylab(imena1[2])
graf_si_edu2 <- graf_si_edu2 + scale_x_continuous(breaks=2005:2014) + geom_smooth()

graf_si_edu3 <- ggplot(data=data.frame(slovenija[3,]),size=20) + aes(x=leta,y=slovenija[3,]) + geom_point(colour="red")
graf_si_edu3 <- graf_si_edu3 + xlab("leta") + ylab(imena1[3])
graf_si_edu3 <- graf_si_edu3 + scale_x_continuous(breaks=2005:2014) + geom_smooth()

