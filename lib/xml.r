# Uvoz s spletne strani
source("lib/libraries.r", 
       echo = FALSE,
       verbose = FALSE,
       encoding = "UTF-8")

ime <- "wt2$wtWorkspaceMode$wt1$wtCountersInput"
uvozi.tabela <- function() {
  url.tabela <- "http://www.pordata.pt/en/DB/Europe/Search+Environment/Table/5692615"
  doc.tabela <- htmlTreeParse("http://www.pordata.pt/en/DB/Europe/Search+Environment/Table/5692615)", asText=TRUE, useInternalNodes=TRUE)
  
  tabela <- readHTMLTable(doc.tabela, which=2,
      colClasses = c("character", rep("FormattedNumber", 5), rep("character", 3)),
                          elFun = function(x) {
                            s <- gsub("[*]", "", xmlValue(x))
                            return(ifelse(s %in% c("", "-"), NA, s))
                          })
  
# Imena stolpcev matrike dobimo iz celic (<th>) glave (prve vrstice) prve tabele
  colnames(tabela) <- gsub("\n", " ", colnames(tabela))
  
# Če ni zaznano pravo kodiranje znakov, ga nastavimo ročno
  Encoding(colnames(tabela)) <- "UTF-8"
  
# Prvi stolpec vzamemo za imena in ga nato odstranimo
  rownames(tabela) <- tabela[,1]
  tabela <- tabela[-1]
  
# Podatke iz matrike spravimo v razpredelnico
  return(tabela)
}
