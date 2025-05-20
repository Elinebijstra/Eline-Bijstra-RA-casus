# De working directory zetten
setwd("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA")
# getwd toont de huidige working directory
getwd()

# Vervang de bestandsnaam hieronder met je eigen zip-bestand
unzip("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Data_RA_raw.zip", exdir = "RA_data") 
#Hiermee worden de bestanden uitgepakt in een submap 'ethanol_data'

# Packages downloaden 
install.packages('BiocManager')
a
# Package Rsubread downloaden 
BiocManager::install('Rsubread')
library(Rsubread)

# Informatie over het package bekijken
browseVignettes('Rsubread')

file.exists("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/GCF_000001405.40_GRCh38.p14_genomic.fna")


# BEN HIERRRRRRRR
# Het referentie genoom indexeren 
buildindex(
  basename = "ref_human",
  reference = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/GCF_000001405.40_GRCh38.p14_genomic.fna"),
  memory = 4000,
  indexSplit = TRUE)