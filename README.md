# Analiza podatkov s programom R, 2015/16

Avtor: Jakov Kavčič

Mentor: Janoš Vidali

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2015/16
## Tematika

Če vprašaš povprečnega študenta: "Zakaj študiraš?", bo najverjetneje odgovoril, da bi rad boljšo plačo in boljše priložnosti za svoje otroke. Zaradi tega sem se odločil raziskati možno povezavo med ravnijo izobrazbe v državi in povprečnim razpoložljivim dohodkom gospodinjstev na ravni držav Evropske Unije. Med analizo se bom osredotočil le na določene države, ki naj bi predstavljale ekstreme v ravni izobrazbe.

Vir za mojo analizo je Eurostat:

 - [Povprečni razpoložljivi dohodek na gospodinjstvo](http://appsso.eurostat.ec.europa.eu/nui/show.do?query=BOOKMARK_DS-053408_QID_6B4112F1_UID_-3F171EB0&layout=TIME,C,X,0;GEO,L,Y,0;HHTYP,L,Z,0;INDIC_IL,L,Z,1;UNIT,L,Z,2;INDICATORS,C,Z,3;&zSelection=DS-053408INDIC_IL,MED_E;DS-053408HHTYP,TOTAL;DS-053408INDICATORS,OBS_FLAG;DS-053408UNIT,EUR;&rankName1=HHTYP_1_2_-1_2&rankName2=TIME_1_0_0_0&rankName3=INDIC-IL_1_2_-1_2&rankName4=UNIT_1_2_-1_2&rankName5=GEO_1_2_0_1&rankName6=INDICATORS_1_2_-1_2&sortC=ASC_-1_FIRST&rStp=&cStp=&rDCh=&cDCh=&rDM=true&cDM=true&footnes=false&empty=false&wai=false&time_mode=NONE&time_most_recent=false&lang=EN&cfo=%23%23%23%2C%23%23%23.%23%23%23)
  - [Procent populacije z določeno izobrazbo](http://appsso.eurostat.ec.europa.eu/nui/show.do?query=BOOKMARK_DS-591613_QID_-3FAA6024_UID_-3F171EB0&layout=TIME,C,X,0;GEO,L,Y,0;SEX,L,Z,0;AGE,L,Z,1;UNIT,L,Z,2;ISCED11,L,Z,3;INDICATORS,C,Z,4;&zSelection=DS-591613SEX,T;DS-591613UNIT,PC;DS-591613INDICATORS,OBS_FLAG;DS-591613ISCED11,ED0-2;DS-591613AGE,Y15-64;&rankName1=TIME_1_0_0_0&rankName2=ISCED11_1_2_-1_2&rankName3=UNIT_1_2_-1_2&rankName4=GEO_1_2_0_1&rankName5=AGE_1_2_-1_2&rankName6=INDICATORS_1_2_-1_2&rankName7=SEX_1_2_-1_2&sortC=ASC_-1_FIRST&rStp=&cStp=&rDCh=&cDCh=&rDM=true&cDM=true&footnes=false&empty=false&wai=false&time_mode=NONE&time_most_recent=false&lang=EN&cfo=%23%23%23%2C%23%23%23.%23%23%23)

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Spletni vmesnik

Spletni vmesnik se nahaja v datotekah v mapi `shiny/`. Poženemo ga tako, da v
RStudiu odpremo datoteko `server.R` ali `ui.R` ter kliknemo na gumb *Run App*.
Alternativno ga lahko poženemo tudi tako, da poženemo program `shiny.r`.

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poro??ila
* `rmarkdown` - za prevajanje poro??ila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgo????evalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `httr` - za pobiranje spletnih strani
* `XML` - za branje spletnih strani
* `extrafont` - za pravilen prikaz ??umnikov (neobvezno)
