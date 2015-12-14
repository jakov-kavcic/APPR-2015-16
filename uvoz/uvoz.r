# 2. faza: Uvoz podatkov
library("XML")
# Funkcija, ki uvozi podatke iz datoteke druzine.csv

#url <- "http://appsso.eurostat.ec.europa.eu/nui/show.do?query=BOOKMARK_DS-591613_QID_-3FAA6024_UID_-3F171EB0&layout=TIME,C,X,0;GEO,L,Y,0;SEX,L,Z,0;AGE,L,Z,1;UNIT,L,Z,2;ISCED11,L,Z,3;INDICATORS,C,Z,4;&zSelection=DS-591613SEX,T;DS-591613UNIT,PC;DS-591613INDICATORS,OBS_FLAG;DS-591613ISCED11,ED0-2;DS-591613AGE,Y15-64;&rankName1=TIME_1_0_0_0&rankName2=ISCED11_1_2_-1_2&rankName3=UNIT_1_2_-1_2&rankName4=GEO_1_2_0_1&rankName5=AGE_1_2_-1_2&rankName6=INDICATORS_1_2_-1_2&rankName7=SEX_1_2_-1_2&sortC=ASC_-1_FIRST&rStp=&cStp=&rDCh=&cDCh=&rDM=true&cDM=true&footnes=false&empty=false&wai=false&time_mode=NONE&time_most_recent=false&lang=EN&cfo=%23%23%23%2C%23%23%23.%23%23%23"
#uvozi.edu <- function() {
#  return(readHTMLTable("show.do"))
#}

uvozi <- function(a) {
  return(read.delim(a,
                    header = TRUE,
                    row.names = 1,
                    na.strings = ":",
                    as.is = TRUE))
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


#funkciji za čiščenje
###
imena <- function(ime){
  pos <-  regexpr(",",ime)-1;
  pos_ <- regexpr("\\(",ime)-1;
  if(pos_>0) pos <- pos_; #zaradi neznanega razloga to deluje na tabeli income vendar ne na edu
  d <- substr(ime,start=0,stop=pos);
  return(d)
}
imena<- Vectorize(imena)
###

###
ciscenje <- function(t){
t <- t[7:36,]
names(t) <- c("2005","2006","2007","2008","2009","2010","2011","2012","2013","2014")
row.names(t) <- imena(row.names(t))
return(t)
}
###

#Čiščenje
income <- ciscenje(income)
edu_1 <- ciscenje(edu_1)
edu_2 <- ciscenje(edu_2)
edu_3 <- ciscenje(edu_3)

#Zapišem tabele
write.csv(income,file="podatki/income.csv")
write.csv(edu_1,file="podatki/edu_1.csv")
write.csv(edu_2,file="podatki/edu_2.csv")
write.csv(edu_3,file="podatki/edu_3.csv")

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.