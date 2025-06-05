# Eline-Bijstra-RA-casus

## 📁 Inhoud/structuur

- `data/raw/` – bevat originele ruwe data zoals verkregen van de bron.   
- `data/processed` - verwerkte datasets gegenereerd met scripts.
- `scripts/` – scripts voor het verwerken van data van transcriptomics-analyses bij reumatoïde artritis (RA).
- `resultaten/` - uitvoer van analyses, zoals grafieken, plots en tabellen. 
- `literatuur/` - gebruikte referenties en literatuur voor het onderzoek.  
- `README.md` - het document om de tekst hier te genereren.
- `assets/` - overige documenten voor de opmaak van deze pagina.
- `data_stewardship/` - Voor de competentie beheren ga je aantonen dat je projectgegevens kunt beheren met behulp van GitHub. In deze folder kan je hulpvragen terugvinden om je op gang te helpen met de uitleg van data stewardship. 

---

## Introductie

Reumatoïde artritis (RA) is een chronische auto-immuunziekte die voornamelijk de kleine gewrichten aantast, zoals die in de handen, voeten, knieën en polsen. De ziekte wordt gekarakteriseerd door ontsteking van het synoviale weefsel (Hall et al., 2024). Chronische en herhaalde ontstekingen van de synoviale gewrichten kunnen leiden tot vervorming en vernietiging van kraakbeen en bot, wat uiteindelijk kan resulteren in invaliditeit bij de patiënten (Li et al., 2014).
Hoewel er effectieve therapieën beschikbaar zijn die de toestand van RA-patiënten kunnen verbeteren, is er momenteel geen genezing voor de ziekte (S El-Gabalawy, 2002). De ziektemechanismen van RA zijn gedeeltelijk bekend, maar de genregulatie blijft complex. Transcriptomics en meta-analyses spelen een belangrijke rol in het identificeren van genen die mogelijk bijdragen aan een vroegere diagnose en betere behandelingsopties (Afroz et al., 2017).
Dit onderzoek heeft als doel om met behulp van R transcriptomics data te analyseren en te identificeren welke genen differentieel tot expressie komen bij reumatoïde artritis (RA) in vergelijking met een controlegroep. Daarnaast wordt onderzocht welke biologische pathways betrokken zijn bij de ziekte via Gene Ontology analyse.

De literatuur die ik heb geraadpleegd, is beschikbaar in de [bronnenmap](literatuur)


## Methoden

Voor dit onderzoek zijn synoviumbiopten (gewrichtsslijnvlies) gebruikt van 8 personen: 4 met reumatoïde artritis (RA) en 4 zonder RA. De RA-patiënten hadden een bevestigde diagnose van >12 maanden en testten positief op ACPA. De controle personen waren ACPA negatief. De data is afkomstig uit een eerder gepubliceerd onderzoek van Platzer et al. (2019).

De voorbereiding en voorbewerking van de ruwe reumatoïde artritis data werden uitgevoerd in [Scripts/Mapping.R](Scripts/Mapping.R) Hierbij is het humane genoom (NCBI RefSeq: GCF_000001405.40) gebruikt als referentie. Vervolgens is op basis van BAM-bestanden een count matrix gegenereerd met [Scripts/Count_Matrix.R](Scripts/Count_Matrix.R) hier is het referentiegenoom met accession number GCF_000001405.25-RS_2024_09 gebruikt. Tot slot zijn op de gegenereerde count matrix statistische analyses uitgevoerd, waaronder een differentiële genexpressie analyse zoals DESeq2 en een GO-Seq analyse, zoals beschreven in [Scripts/Statistiek_en_Analyse.R](Scripts/Statistiek_en_Analyse.R).


## 📊 Resultaten

Om inzicht te krijgen in eigenschappen van de te gebruiken spreuken is er een overzicht gemaakt, te vinden in [deze tabel](resultaten/top_10_spells.csv). Onvergeeflijke vloeken zijn niet meegenomen in dit overzicht. 

Om een afweging te maken welke spreuken het meest effectief zijn, is er onderzocht of er een verband te vinden is tussen kracht en accuraatheid. In [het resultaat hiervan](resultaten/spell_power_vs_accuracy.png) is te zien dat er een negatieve daling lijkt te zijn in kracht als de accuraatheid toeneemt. Een uitschieter is de onvergeeflijke vloek *Avada Kedavra*, met zowel hoge kracht als accuraatheid. 
## Conclusie

Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 
