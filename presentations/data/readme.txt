Tijd series, twee groepen met 4 tijdspunten. Informatie: http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE46051

Sample informatie (kan handig zijn) in R:

library(GEOquery)
GSE46051 <- getGEO('GSE46051')
View(GSE46051[[1]])

R: sample factor

data <- read.table(...)
samples <- colnames(data[4:ncol(data)])
sample.fac <- factor(gsub("_R[0-9]", "", samples))