#MaAsLin2 input

rm(list=ls())
getwd()
setwd("PATH")

##### Install of MaAsLin2 #####
#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("Maaslin2")
###############################

#Load MaAsLin2 package into the R environment
library(Maaslin2)

input_data = read.table(file="input.tsv", header = TRUE, sep = "\t", row.names = 1, stringsAsFactors = FALSE)
input_metadata = read.table(file = "metadata.tsv", header = TRUE, sep = "\t", row.names = 1, stringsAsFactors = FALSE)

#Running MaAsLin2
fit_data = Maaslin2(
    input_data, 
    input_metadata, 
    output = "Inocle_oral_CRC",
    fixed_effects = c("group"), # metadata for correlation analysis
    random_effects = c("age", "sex"), # cofounder
    )
