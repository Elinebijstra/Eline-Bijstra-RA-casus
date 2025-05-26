# Eline-Bijstra-RA-casus

## 📁 Inhoud/structuur

- `data/raw/` – fictionele datasets voor de analyse van spreuk effectiviteit, gevaar en welke spreuken het beste samengaan met verschillende types staf.  
- `data/processed` - verwerkte datasets gegenereerd met scripts 
- `scripts/` – scripts om prachtige onzin te genereren
- `resultaten/` - grafieken en tabellen
- `bronnen/` - gebruikte bronnen 
- `README.md` - het document om de tekst hier te genereren
- `assets/` - overige documenten voor de opmaak van deze pagina
- `data_stewardship/` - Voor de competentie beheren ga je aantonen dat je projectgegevens kunt beheren met behulp van GitHub. In deze folder kan je hulpvragen terugvinden om je op gang te helpen met de uitleg van data stewardship. 

---

## Introductie

Reumatoïde artritis (RA) is een chronische auto-immuunziekte die voornamelijk de kleine gewrichten aantast, zoals die in de handen, voeten, knieën en polsen. De ziekte wordt gekarakteriseerd door ontsteking van het synoviale weefsel (Hall et al., 2024). Chronische en herhaalde ontstekingen van de synoviale gewrichten kunnen leiden tot vervorming en vernietiging van kraakbeen en bot, wat uiteindelijk kan resulteren in invaliditeit bij de patiënten (Li et al., 2014).
Hoewel er effectieve therapieën beschikbaar zijn die de toestand van RA-patiënten kunnen verbeteren, is er momenteel geen genezing voor de ziekte (S El-Gabalawy, 2002). De ziektemechanismen van RA zijn gedeeltelijk bekend, maar de genregulatie blijft complex. Transcriptomics en meta-analyses spelen een belangrijke rol in het identificeren van genen die mogelijk bijdragen aan een vroegere diagnose en betere behandelingsopties (Afroz et al., 2017).
Dit onderzoek heeft als doel om met behulp van R transcriptomics data te analyseren en te identificeren welke genen differentieel tot expressie komen bij reumatoïde artritis (RA) in vergelijking met een controlegroep. Daarnaast wordt onderzocht welke biologische pathways betrokken zijn bij de ziekte via Gene Ontology analyse.

De literatuur die ik heb geraadpleegd, is beschikbaar in de [bronnenmap](literatuur)


## Methoden

De data is verstrekt door de Afdeling Magische Wetshandhaving en Ollivanders Wandwinkel Archieven. 

De ruwe data van spreuken is eerst bewerkt voor analyse met behulp van [scripts/01_clean_spell_data.R](scripts/01_clean_spell_data.R). Vervolgens zijn de spreuken geanalyseerd op kracht en nauwkeurigheid met [scripts/02_spell_analysis.R](scripts/02_spell_analysis.R).

## 📊 Resultaten

Om inzicht te krijgen in eigenschappen van de te gebruiken spreuken is er een overzicht gemaakt, te vinden in [deze tabel](resultaten/top_10_spells.csv). Onvergeeflijke vloeken zijn niet meegenomen in dit overzicht. 

Om een afweging te maken welke spreuken het meest effectief zijn, is er onderzocht of er een verband te vinden is tussen kracht en accuraatheid. In [het resultaat hiervan](resultaten/spell_power_vs_accuracy.png) is te zien dat er een negatieve daling lijkt te zijn in kracht als de accuraatheid toeneemt. Een uitschieter is de onvergeeflijke vloek *Avada Kedavra*, met zowel hoge kracht als accuraatheid. 
## Conclusie

Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 
