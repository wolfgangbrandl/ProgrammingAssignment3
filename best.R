best <- function(state, death) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  ## Create factor variable to check for input
  ou <- c("heart attack","heart failure","pneumonia")
  ## Change State to factor to split afterwards
  st <- factor(outcome$State)
  ## check input
  if (!(state %in% st)) stop ("invalid state")
  if (!(death %in% ou)) stop ("invalid outcome")
  ## Set the attribute for the death rate name too long for me
  if (death == "heart attack") n <- c(11)
  else if (death == "heart failure") n <- c(17)
  else if (death == "pneumonia") n <- c(23)
  ## group dataset into groups of states
  group_state <- split(outcome,st)
  ## get the group for input state
  group <- group_state[state]
  ## set the specified death rate from chr to numeric
  group[[1]][[n]] <- as.numeric(group[[1]][[n]])
  ## get a vector of hospital with the lowest death rate
  hospitalname <- group[[1]][[2]][which(group[[1]][[n]]==min(group[[1]][[n]],na.rm=TRUE))]
  ## sort vector
  shospitalname<-sort(hospitalname)
  ## return alphabetical first hospital name
  shospitalname[1]
}
