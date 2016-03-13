wd <- file.path ("C:","Users","Wolfi","ProgrammingAssignment3")
setwd(wd)
source("HospitalFunction.R")
wd <- file.path ("C:","Users","Wolfi","Desktop","coursera","week-4","ProgAssignment3")

setwd(wd)

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
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

  