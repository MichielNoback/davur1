
labeler <- function(l1Counter = 0, l2Counter = 1, letterIndex = 1) {
    getSectionLabel <- function(increaseLevel1 = T) {
        if (increaseLevel1){
            l1Counter <<- l1Counter + 1
            l2Counter <<- 1
        } 
        sLabel <- paste("Section ", l1Counter, ".", sep="")
        sLabel
    }
    getExerciseLabel <- function(increaseLevel2 = T) {
        eLabel <- paste("Exercise ", l1Counter, ".", l2Counter, ".", sep="")
        if (increaseLevel2) l2Counter <<- l2Counter + 1
        eLabel
    }
    getLetterLabel <- function(reset = F) {
        if(reset) letterIndex <<- 1
        else letterIndex <<- letterIndex + 1
        paste("(", letters[letterIndex], ")", sep="")
    }
    
    list(getSection = getSectionLabel,
         getExercise = getExerciseLabel,
         getLetter = getLetterLabel)
}
#labelMaker <- labeler()
