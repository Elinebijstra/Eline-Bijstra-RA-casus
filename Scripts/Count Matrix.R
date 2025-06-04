# COUNT MATRIX
# Benodigde packages downloaden 
install.packages(c("readr", "dplyr"))

# Rsamtools en Rsubread zijn Bioconductor packages:
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
