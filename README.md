# Analiza podatkov s programom R, 2015/16

Avtor: Jakov Kav??i??

Mentor: Jano?? Vidali

Repozitorij z gradivi pri predmetu APPR v ??tudijskem letu 2015/16
## Tematika

??e vpra??a?? povpre??nega ??tudenta: "Zakaj ??tudira???", bo najverjetneje odgovoril, da bi rad bolj??o pla??o in bolj??e prilo??nosti za svoje otroke. Zaradi tega sem se odlo??il raziskati mo??no povezavo med ravnijo izobrazbe v dr??avi in povpre??nim razpolo??ljivim dohodkom na ravni dr??av Evropske Unije. Med analizo se bom osredoto??il le na dolo??ene dr??ave, ki naj bi predstavljale ekstreme v ravni izobrazbe.

Vir za mojo analizo je Eurostat:

-http://appsso.eurostat.ec.europa.eu/nui/show.do

-http://appsso.eurostat.ec.europa.eu/nui/submitViewTableAction.do#


## Program

Glavni program in poro??ilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in ??etrti fazi projekta:

* obdelava, uvoz in ??i????enje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Spletni vmesnik

Spletni vmesnik se nahaja v datotekah v mapi `shiny/`. Po??enemo ga tako, da v
RStudiu odpremo datoteko `server.R` ali `ui.R` ter kliknemo na gumb *Run App*.
Alternativno ga lahko po??enemo tudi tako, da po??enemo program `shiny.r`.

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti slede??e pakete za R:

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
