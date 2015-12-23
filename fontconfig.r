# Pred uporabo namestite paket extrafont, potem pa izvedite
#   library(extrafont)
#   font_import() # vpraša za potrditev, traja nekaj minut
#   loadfonts()
# Slednja ukaza izvedite samo enkrat in ju ne vključujte v program!

library("extrafont",quietly = TRUE)
loadfonts(device = "pdf", quiet = TRUE)
# font_import(paths = NULL, recursive = TRUE, prompt = FALSE,
#             pattern = NULL )
# loadfonts()

# Prosim, da uporabljate eno od sledečih vrednosti za parameter family:
# * "Arial"
# * "Arial Black"
# * "Comic Sans MS"
# * "Courier New"
# * "Georgia"
# * "Impact"
# * "Trebuchet MS"
# * "Times New Roman"
# * "Verdana"
pdf.options(family = "Times New Roman")
