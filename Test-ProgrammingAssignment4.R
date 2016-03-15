#wd <- file.path ("C:","Users","Wolfi","ProgrammingAssignment3")
wd <- file.path ("D:","Users","wbrandl","coursera","ProgrammingAssignment3")
setwd(wd)
source("best.R")
source("rankhospital.R")
source("rankall.R")
wd <- file.path ("D:","Users","wbrandl","Desktop","coursera","rprog-data-ProgAssignment3-data")

setwd(wd)

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
#debug(rankall)
j <- rankall ("heart attack",20)
j
h <- rankhospital ("TX","heart failure", 4)
h
#debug(best)
best("TX", "heart attack")
#[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
best("TX", "heart failure")
#[1] "FORT DUNCAN MEDICAL CENTER"
best("MD", "heart attack")
#[1] "JOHNS HOPKINS HOSPITAL, THE"
best("MD", "pneumonia")
#[1] "GREATER BALTIMORE MEDICAL CENTER"
best("BB", "heart attack")
#Error in best("BB", "heart attack") : invalid state
best("NY", "hert attack")
#Error in best("NY", "hert attack") : invalid outcome

  