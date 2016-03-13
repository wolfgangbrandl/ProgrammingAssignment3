best <- function(state, death) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  ou <- c("heart attack","heart failure","pneumonia")
  
  st <- factor(outcome$State)
  if (!(state %in% st)) stop ("invalid state")
  if (!(death %in% ou)) stop ("invalid outcome")
  if (death == "heart attack") n <- c(11)
  else if (death == "heart failure") n <- c(17)
  else if (death == "pneumonia") n <- c(23)
  group_state <- split(outcome,st)
  group <- group_state[state]
  group[[1]][[n]] <- as.numeric(group[[1]][[n]])
  hospitalname <- group[[1]][[2]][which(group[[1]][[n]]==min(group[[1]][[n]],na.rm=TRUE))]
  shospitalname<-sort(hospitalname)
  shospitalname[1]
}
