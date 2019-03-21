setwd("~/Dropbox/courses/ILST_minor_Thema11_intro_R/public/exercises/data/")

## load data
vcf <- read.table(
    "Minor.vcf",
    comment.char = "#",
    sep = "\t",
    stringsAsFactors = F)
names(vcf) <- c("chrom", "position", "ID", "reference.nuc",
                "alternative.nuc", "quality", "filter",
                "info", "format", "Sample1")
str(vcf)

## define splitter function
vcfSplitter <- function(x) {
    ## strsplit returns a list!
    strsplit(x["Sample1"], ":")[[1]]
}

## perform actual split
#vcf[, 11:24] <- t(apply(vcf[1:5, ], 1, FUN = vcfSplitter))  
vcf.e <- cbind(vcf, t(apply(vcf, 1, FUN = vcfSplitter)) )
head(vcf.e, n = 3)

###these examples from http://stackoverflow.com/questions/7069076/split-column-at-delimiter-in-data-frame
##OF:
vcf <- within(vcf, SAMPLE1<-data.frame(do.call('rbind', strsplit(as.character(Sample1), ':'))))
## OF vcf.c <- cbind(data.frame(do.call('rbind', strsplit(as.character(vcf$Sample1),':')))
head(vcf)

##OF:
library(reshape)
df = transform(vcf, SAMPLE1 = colsplit(Sample1, split = ":",
                                      names = strsplit(vcf$format[1], ":")[[1]]))
head(df)

##OF!!
df2 <- cbind(vcf, read.table(text = vcf$Sample1, sep = ":"))
head(df2)

## create new column names
new.col.names <- strsplit(vcf$format[1], ":")
names(vcf.e)[11:24] <- new.col.names[[1]]
head(vcf.e, n = 3)

