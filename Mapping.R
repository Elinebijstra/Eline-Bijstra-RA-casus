# MAPPING
# De working directory instellen
setwd("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA")
# getwd toont de huidige working directory
getwd()

# De functie unzip gebruiken om de gezipte data uit te pakken
unzip("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/Data_RA_raw.zip", exdir = "RA_data") 

# Packages downloaden 
install.packages('BiocManager')

# Package Rsubread downloaden 
BiocManager::install('Rsubread')
library(Rsubread)

# Informatie over het package bekijken
browseVignettes('Rsubread')

# Kijken of de file echt bestaat voordat hij geindexeerd wordt 
file.exists("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/GCF_000001405.40_GRCh38.p14_genomic.fna")

# Het humane referentie genoom indexeren 
buildindex(
  basename = "ref_human",
  reference = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/GCF_000001405.40_GRCh38.p14_genomic.fna"),
  memory = 4000,
  indexSplit = TRUE)

# De verkregen reuma data mappen tegen het humane genoom
align.contr1 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human",  
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785819_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785819_2_subset40k.fastq"),
  output_file = "contr1.BAM",
  input_format = "FASTQ")

align.contr2 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785820_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785820_2_subset40k.fastq"),
  output_file = "contr2.BAM",
  input_format = "FASTQ")

align.contr3 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785828_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785828_2_subset40k.fastq"),
  output_file = "contr3.BAM",
  input_format = "FASTQ")

align.contr4 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785831_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785831_2_subset40k.fastq"),
  output_file = "contr4.BAM",
  input_format = "FASTQ")

align.ra5 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785979_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785979_2_subset40k.fastq"),
  output_file = "ra5.BAM",
  input_format = "FASTQ")

align.ra6 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785980_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785980_2_subset40k.fastq"),
  output_file = "ra6.BAM",
  input_format = "FASTQ")

align.ra7 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785986_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785986_2_subset40k.fastq"),
  output_file = "ra7.BAM",
  input_format = "FASTQ")

align.ra8 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785988_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Raw/RA_data/Data_RA_raw/SRR4785988_2_subset40k.fastq"),
  output_file = "ra8.BAM",
  input_format = "FASTQ")


# Laad Rsamtools voor sorteren en indexeren
install.packages('GenomicRanges')
library(Rsamtools)

# Bestandsnamen van de RA samples
Samples <- c('contr1', 'contr2', 'contr3', 'contr4', 'ra5', 'ra6','ra7', 'ra8')

# Kijken of het bestand bestaat
file.exists("contr1.BAM")

# Sorteer elk BAM-bestand
lapply(Samples, function(s) {
  sortBam(file = paste0(s, ".BAM"), destination = paste0(s, ".sorted"))})

