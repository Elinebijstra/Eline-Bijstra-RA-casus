# COUNT MATRIX
# Benodigde packages downloaden (readr = version '2.1.5') (dplyr = version '1.1.4')
install.packages(c("readr", "dplyr"))

# Rsamtools en Rsubread zijn Bioconductor packages:
# (BiocManager = version '1.30.25')
# (Rsamtools = version '2.24.0')
# (Rsubread = version '2.22.1')
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("Rsamtools", "Rsubread"))

# Benodigde packages laden 
library(readr)
library(dplyr)
library(Rsamtools)
library(Rsubread)

# Feature counts uitvoeren 
# Met feature counts tellen we het aantal uitgelijnde reads per gen door de BAM-bestanden te vergelijken met de genannotaties uit het GTF-bestand
# Het GTF bestand is afkomstig van NCBI en hiervoor is het GRCh37.p13 genoom gebruikt
allsamples <- c("contr1.sorted.bam", "contr2.sorted.bam", "contr3.sorted.bam", "contr4.sorted.bam", "ra5.sorted.bam", "ra6.sorted.bam", "ra7.sorted.bam", "ra8.sorted.bam")

count_matrix <- featureCounts(
  files = allsamples,
  annot.ext = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/GCF_000001405.25_GRCh37.p13_genomic.gtf",
  isPairedEnd = TRUE,            
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE)


# De grote verkregen count matrix inladen
Grote_count_matrix <- read.delim(
  "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Processed/count_matrix.txt",
  row.names = 1)

# Structuur en eerste regels bekijken
str(Grote_count_matrix)
head(Grote_count_matrix)

# Kolomnamen instellen aangepast aan de samples
colnames(Grote_count_matrix) <- c("contr1", "contr2", "contr3", "contr4", "ra5", "ra6", "ra7", "ra8")

# Opslaan als CSV bestand voor vervolg analyses
write.csv(Grote_count_matrix, "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Processed/bewerkt_countmatrix.csv")

# Eerste paar regels bekijken
head(Grote_count_matrix)
