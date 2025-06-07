# STATISTIEK EN ANALYSE

# Bestand inladen
Grote_counts <- read.csv("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Data/Processed/bewerkt_countmatrix.csv", row.names = 1)

# Afronden naar integers (afronden naar hele getallen)
Grote_counts_int <- round(Grote_counts)

# We maken een tabel waarin staat welke monsters reuma (RA) zijn en welke controle
treatment_RA <- c(rep("control",4), rep("RA",4))
treatment_table_RA <- data.frame(treatment = factor(treatment_RA))
rownames(treatment_table_RA) <- c("contr1", "contr2", "contr3", "contr4", "ra5", "ra6", "ra7", "ra8")

# Packages downloaden en laden 
BiocManager::install(c("DESeq2", "KEGGREST"))

library(DESeq2)
library(KEGGREST)

# DESeqDataSet aanmaken
dds <- DESeqDataSetFromMatrix(countData = Grote_counts_int,
                              colData = treatment_table_RA,
                              design = ~ treatment)

# Analyse uitvoeren
dds <- DESeq(dds)
resultaten <- results(dds)

# Resultaten opslaan
write.table(resultaten, 
            file = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Resultaten/ResultatenWC3.csv", 
            row.names = TRUE, 
            col.names = TRUE)

# Aantal significant opgereguleerde genen (verdubbeling of meer)
sum(resultaten$padj < 0.05 & resultaten$log2FoldChange > 1, na.rm = TRUE)
# Het aantal genen dat significant omhoog zijn gereguleerd zijn 2085 genen

# Aantal significant neerreguleerde genen (halvering of minder)
sum(resultaten$padj < 0.05 & resultaten$log2FoldChange < -1, na.rm = TRUE)
# Het aantal genen dat significant omlaag zijn gereguleerd zijn 2487

# Sorteer de resultaten op log2FoldChange van hoog naar laag (meest opgereguleerde genen bovenaan)
hoogste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = TRUE), ]

# Sorteer de resultaten op log2FoldChange van laag naar hoog (meest neerreguleerde genen bovenaan)
laagste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = FALSE), ]

# Sorteer de resultaten op padj van laag naar hoog (meest significante genen bovenaan)
laagste_p_waarde <- resultaten[order(resultaten$padj, decreasing = FALSE), ]

# Bekijken welke genen het belangrijkst zijn volgens de analyse
head(laagste_p_waarde)

# Controleer of het pakket EnhancedVolcano is geïnstalleerd, zo niet dan installeer het
if (!requireNamespace("EnhancedVolcano", quietly = TRUE)) {
  BiocManager::install("EnhancedVolcano")}

# Laad het pakket zodat je de functies kunt gebruiken
library(EnhancedVolcano)

# Maak een volcano plot van je resultaten
EnhancedVolcano(resultaten,
                lab = rownames(resultaten),  # Labels (genenamen) op de punten in de plot
                x = 'log2FoldChange',         # X-as: de log2 fold change van genexpressie
                y = 'padj')                   # Y-as: de aangepaste p-waarde (padj)

# Met een iets andere opmaak
# Alternatieve plot zonder p-waarde cutoff (alle genen zichtbaar)
EnhancedVolcano(resultaten,
                lab = rownames(resultaten),
                x = 'log2FoldChange',
                y = 'padj',
                pCutoff = 0)

# De plot opslaan
dev.copy(png, filename = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Resultaten/VolcanoplotWC.png", 
         width = 8,   
         height = 10, 
         units = 'in',    
         res = 500)
dev.off()


# Package installeren en inladen
if (!requireNamespace("pathview", quietly = TRUE)) {
  BiocManager::install("pathview")}

library(pathview)

# Maak een named vector van de log2FoldChange
gene_vector <- resultaten$log2FoldChange
names(gene_vector) <- rownames(resultaten)

# Visualiseer de KEGG pathway (hier een voorbeeld: Cytokine signaling)
pathview(
  gene.data = gene_vector,
  pathway.id = "hsa04658",   # Kies een pathway die relevant is voor RA (de Th1 en Th2 cell differentiatie) 
  species = "hsa",           # hsa = Homo sapiens
  gene.idtype = "SYMBOL",    # Jij hebt gen-symbolen zoals 'ANKRD30BL'
  limit = list(gene = 5)     # Kleurbereik van -5 tot +5 log2FC
)



# GO-seq analyse
# Installatie van de packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("goseq", "org.Hs.eg.db", "GO.db", "clusterProfiler", "biomaRt"))

# Laden van libraries
library(goseq)
library(org.Hs.eg.db)
library(GO.db)
library(clusterProfiler)
library(biomaRt)
library(dplyr)
library(ggplot2)

# Converteer SYMBOL → ENSEMBL
converted <- bitr(rownames(resultaten),
                  fromType = "SYMBOL",
                  toType   = "ENSEMBL",
                  OrgDb    = org.Hs.eg.db)

# Zorg dat 'resultaten' een data.frame is
resultaten <- as.data.frame(resultaten)

# Voeg een kolom 'symbol' toe met de gen-namen uit de rijen
resultaten$symbol <- rownames(resultaten)

# Voeg ENSEMBL-ID's toe aan je resultaten met een left_join
resultaten <- dplyr::left_join(
  resultaten,            # jouw originele data (nu met 'symbol'-kolom)
  converted,             # de tabel met SYMBOL → ENSEMBL-koppelingen
  by = c("symbol" = "SYMBOL")  # merge op basis van SYMBOL
)

# De genen met padj < 0.05 en |log2FC| > 1 worden als significant gemarkeerd
all_genes <- as.integer(resultaten$padj < 0.05 & abs(resultaten$log2FoldChange) > 1)
names(all_genes) <- resultaten$ENSEMBL

# Even bekijken, en we hebben geen NULL meer
head(names(all_genes)) 

# Verbind met Ensembl en download transcriptlengtes
ensembl <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")

gene_lengths <- getBM(
  attributes = c("ensembl_gene_id", "transcript_length"),
  filters    = "ensembl_gene_id",
  values     = names(all_genes),
  mart       = ensembl)

# Gemiddelde lengte per gen
lengths_avg <- gene_lengths %>%
  group_by(ensembl_gene_id) %>%
  summarise(length = round(mean(transcript_length, na.rm = TRUE)))

# BIAS-data opbouwen
bias.data <- lengths_avg$length
names(bias.data) <- lengths_avg$ensembl_gene_id


# Nu gaan we filteren op genen die in beide datasets voorkomen
gemeenschappelijke_genen <- intersect(names(all_genes), names(bias.data))

# Subset beide objecten
all_genes_filtered <- all_genes[gemeenschappelijke_genen]
bias.data_filtered <- bias.data[gemeenschappelijke_genen]

# Bepaal alleen genen met géén NA in beide vectoren
gemeenschappelijke_genen <- names(all_genes_filtered)[!is.na(all_genes_filtered)]

# Subset beide vectoren
all_genes_clean     <- all_genes_filtered[gemeenschappelijke_genen]
bias.data_clean     <- bias.data_filtered[gemeenschappelijke_genen]

# Het null model voor de GO-analyse berekenen (Pwf)
pwf <- nullp(
  DEgenes   = all_genes_clean,
  genome    = "hg38",
  id        = "ENSEMBL",
  bias.data = bias.data_clean)

# Sla direct de figuur op in een bestand
png("C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Resultaten/pwf_plot.png", width = 800, height = 600)
plotPWF(pwf)
dev.off()


# Gen-ID's (ENSEMBL)
ensembl_ids <- rownames(pwf)

# Haal GO mappings op
gene2go <- AnnotationDbi::select(
  org.Hs.eg.db,
  keys = ensembl_ids,
  keytype = "ENSEMBL",
  columns = c("GO", "ONTOLOGY"))

# Filter alleen GO:BP
gene2go <- gene2go[gene2go$ONTOLOGY == "BP", ]

# Maak gene2cat object
gene2cat <- split(gene2go$GO, gene2go$ENSEMBL)

GO_results <- goseq(
  pwf,
  gene2cat = gene2cat,
  method = "Hypergeometric",
  use_genes_without_cat = TRUE)

head(GO_results)

# De top 10 GO-termen met ggplot2 visualiseren 
GO_Plot <- GO_results %>%
  top_n(10, wt = -over_represented_pvalue) %>%
  mutate(hitsPerc = numDEInCat * 100 / numInCat) %>%
  ggplot(aes(x = hitsPerc,
             y = term,
             colour = over_represented_pvalue,
             size = numDEInCat)) +
  geom_point() +
  expand_limits(x = 0) +
  labs(x = "Hits (%)", y = "GO term", colour = "p value", size = "Count")

GO_Plot

# Sla het op met ggsave
ggsave(filename = "C:/Users/Eline/OneDrive/Documenten/BML Jaar 2 Periode 4/Casus RA/Eline-Bijstra-RA-casus/Resultaten/GO_plot.png",
       plot = GO_Plot,
       width = 8, height = 6, units = "in", dpi = 300)

# GOTERM[[...]] → haalt alle informatie op die bij die GO-ID hoort
GOTERM[[GO_results$category[1]]]