#uvoz GDP percapita podatkov
#vir:http://ec.europa.eu/eurostat/tgm/table.do?tab=table&init=1&language=en&pcode=tec00001&plugin=1
#legenda: http://ec.europa.eu/eurostat/data/database?p_p_id=NavTreeportletprod_WAR_NavTreeportletprod_INSTANCE_nPqeVbPXRmWQ&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_NavTreeportletprod_WAR_NavTreeportletprod_INSTANCE_nPqeVbPXRmWQ_nodeInfoService=true&nodeId=221654
#GDP (gross domestic product) is an indicator for a nation´s economic situation. It reflects the total value of all goods and services 
#produced less the value of goods and services used for intermediate consumption in their production. Expressing GDP in PPS (purchasing
#power standards) eliminates differences in price levels between countries, and calculations on a per head basis allows for the comparison 
#of economies significantly different in absolute size.
home <-  setwd(Sys.getenv("HOME"));
fpath1 <-  file.path(home, "podatki", "GDPpercapita.tsv");
GDPpc <- read.delim(fpath1) 

#uvoz izobrazba 3-8
#vir:

library(XML)
fpath2 <- "http://appsso.eurostat.ec.europa.eu/nui/print.do"
edu <- readHTMLTable(fpath2)

