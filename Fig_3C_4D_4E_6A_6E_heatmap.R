getwd()
setwd("PATH")

install.packages("pheatmap")
library(pheatmap)

library(pals)
pal.bands(alphabet, alphabet2, cols25, glasbey, kelly, polychrome, 
          stepped, tol, watlington,
          show.names=FALSE)

# Libraries
# Input data
data<-read.csv("table.csv", header = T, row.names = 1)

# simple heatmap
pheatmap(data, fontsize_row = 5, fontsize_col = 5,
         cluster_rows = F,
         cluster_cols = F,
         clustering_distance_rows="euclidean",
         clustering_distance_cols="euclidean",
         clustering_method="ward.D2",
         color=colorRampPalette(c("white", "red"))(50)

)
