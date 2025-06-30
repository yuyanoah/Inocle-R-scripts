# Fisher’s exact test

setwd("PATH")
table <- read.csv("input.csv",header=T, row.names = 1)

len<-nrow(table)
len
mx<-matrix(unlist(c(table[1,])), nrow = 2, byrow = T)
mx

results_list <- c()
for (j in 1:len){
  mx<-matrix(unlist(c(table[j,])), nrow = 2, byrow = T)
  res<-fisher.test(mx)
  results_list <- c(results_list, res$p.value)
}
results_list
write.table(results_list, "Fisher-exact-test.csv", sep=",")
