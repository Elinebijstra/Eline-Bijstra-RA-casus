# MAPPING
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

# Kijken of de file echt bestaat voordat hij geindexeerd wordt 
file.exists("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/GCF_000001405.40_GRCh38.p14_genomic.fna")


# Het referentie genoom indexeren 
buildindex(
  basename = "ref_human",
  reference = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/GCF_000001405.40_GRCh38.p14_genomic.fna"),
  memory = 4000,
  indexSplit = TRUE)

# De RA data mappen tegen het humane genoom
align.contr1 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",  
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785819_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785819_2_subset40k.fastq"),
  output_file = "contr1.BAM",
  input_format = "FASTQ")

align.contr2 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785820_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785820_2_subset40k.fastq"),
  output_file = "contr2.BAM",
  input_format = "FASTQ")

align.contr3 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785828_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785828_2_subset40k.fastq"),
  output_file = "contr3.BAM",
  input_format = "FASTQ")

align.contr4 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785831_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785831_2_subset40k.fastq"),
  output_file = "contr4.BAM",
  input_format = "FASTQ")

align.ra5 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785979_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785979_2_subset40k.fastq"),
  output_file = "ra5.BAM",
  input_format = "FASTQ")

align.ra6 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785980_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785980_2_subset40k.fastq"),
  output_file = "ra6.BAM",
  input_format = "FASTQ")

align.ra7 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785986_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785986_2_subset40k.fastq"),
  output_file = "ra7.BAM",
  input_format = "FASTQ")

align.ra8 <- align(
  index = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Ref_Human/ref_human",
  readfile1 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785988_1_subset40k.fastq"),
  readfile2 = normalizePath("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/RA_data/Data_RA_raw/SRR4785988_2_subset40k.fastq"),
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


# COUNT MATRIX
# Benodigde packages laden 
library(readr)
library(dplyr)
library(Rsamtools)
library(Rsubread)

# Feature counts uitvoeren 
allsamples <- c("contr1.sorted.bam", "contr2.sorted.bam", "contr3.sorted.bam", "contr4.sorted.bam", "ra5.sorted.bam", "ra6.sorted.bam", "ra7.sorted.bam", "ra8.sorted.bam")

count_matrix <- featureCounts(
  files = allsamples,
  annot.ext = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/GTF bestand/GCF_000001405.25_GRCh37.p13_genomic.gtf",
  isPairedEnd = TRUE,            
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE)

# Grote count matrix inladen 
Grote_count_matrix <- read.table("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/count_matrix.txt")

# Resultaten bekijken
head(Grote_count_matrix$annotation)
head(Grote_count_matrix$counts)
Grote_count_matrix

# Bekijk eerst de structuur van het object
str(Grote_count_matrix)

# Haal alleen de matrix met tellingen eruit
counts <- Grote_count_matrix$counts

colnames(Grote_count_matrix) <- c("contr1", "contr2", "contr3", "contr4", "ra5", "ra6", "ra7", "ra8")

rownames(Grote_count_matrix) <- counts[, 1]

# Verwijder nu zelf de eerste kolom (GeneID) uit de matrix. Je hebt deze al gebruikt als rij-naam, dus die dubbele informatie mag eruit. Weet je nog hoe dat moet?
# Voer je eigen code in

write.csv(Grote_count_matrix, "bewerkt_countmatrix.csv")

head(Grote_count_matrix)




# STATISTIEK EN ANALYSE
# Een behandelingstabel maken
treatment <- c("contr1", "contr2", "contr3", "contr4", "ra5", "ra6", "ra7", "ra8")
treatment_table <- data.frame(treatment)
rownames(treatment_table) <- c("contr1", "contr2", "contr3", "contr4", "ra5", "ra6", "ra7", "ra8")

# Packages laden en downloaden 
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# Nu de packages installeren
