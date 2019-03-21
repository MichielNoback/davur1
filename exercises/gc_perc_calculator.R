GC.perc <- function(seq, strict = TRUE) {
    if (is.na(seq)) {
        return(NA)
    }
    if (length(seq) == 0) {
        return(0)
    }
    seq.split <- strsplit(seq, "")[[1]]
    gc.count <- 0
    anom.count <- 0
    for (n in seq.split) {
        if (length(grep("[GATUCgatuc]", n)) > 0) {
            if (n == "G" || n == "C") {
                gc.count <- gc.count + 1
            }
        } else {
            if (strict) {
                stop(paste("Illegal character", n))
            } else {
                anom.count <- anom.count + 1   
            }
        }
    }
    ##return perc
    ##print(gc.count)
    if (anom.count > 0) {
        anom.perc <- anom.count / nchar(seq) * 100
        warning(paste("Non-DNA characters have percentage of", anom.perc))
    }
    return(gc.count / nchar(seq) * 100)
}