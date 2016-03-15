rankhospital <- function(state, death, num = "best") {
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
  df_state_group <- group[[1]]
  ordered_df_state_group <- df_state_group[ order(df_state_group[,n],df_state_group[,2],na.last=NA),]
  number_of_hospital_in_state <- length(ordered_df_state_group[,n])
  if (num > number_of_hospital_in_state | num <= 0 ) {
    hospital <- NA
    return (hospital)
  }
  if (num == "best") {
    rank <- 1
  }
  else if (num == "worst") {
    rank <- number_of_hospital_in_state
  }
  else {
    rank <- num
  }
  hospital <- ordered_df_state_group[[2]][[rank]]
}