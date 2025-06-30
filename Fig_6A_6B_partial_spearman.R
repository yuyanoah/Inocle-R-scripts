# Partial Spearman's correlation

getwd()
setwd("PATH")

# INSTALL
library(psych)

# Input table
table <- read.csv("input.csv",head=1,row.names=1) # Input matrix
# e.g.
#         speciesA  age sex  gene_exp1  gene_exp2  gene_exp3  gene_exp4
# Sample1       10  30    1       100         20          55        70
# Sample2       10  30    1       100         20          55        70
# Sample3       10  30    1       100         20          55        70
# Sample4       10  30    1       100         20          55        70

########## Multiple RUN ###########
# Preparing the number of col
# Number of samples
n=29

# Indicate gene_exp col start and end number
gene_exp_s <- 1
gene_exp_e <- 31467

# Indicate correlation pair 1
cor_pair1 <- 3

# Controlled metadata
cm1 <- 1
cm2 <- 2

# partial correlation
result_c <- c()
result_p <- c()
for (i in gene_exp_s:gene_exp_e){
  out <- partial.r(table, c(cor_pair1, i), c(cm1, cm2), method="spearman")
  result_c <- c(result_c, out[1,2])
  pval<-corr.p(out, n=n, adjust="BH")
  result_p <- c(result_p, pval$ci$p)
}
test<-paste(result_c, result_p)
write.table(test, "partial_cor_result.csv")
#################################

