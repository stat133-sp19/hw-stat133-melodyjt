# Description: checks if probability is valid
# Inputs
#   prob: a numeric probability
# Output
#   a logical value
check_prob <- function(prob) {
  if(length(prob) == 1 & prob >= 0 & prob <= 1) {
    return(TRUE)
  } else {
    stop("Invalid prob value")
  }
}

# Description: checks if trials is valid
# Input
#   trial: how many trials
# Output
#   a logical value
check_trials <- function(trials) {
  if((trials >= 0) & (trials %% 1 == 0)) {
    return(TRUE)
  } else {
    stop("Invalid trials value")
  }
}

# Description: checks if success is valid
# Inputs
#   success: a number or vector of successes
#   trial: how many trials
# Output
#   a logical value
check_success <- function(success, trials) {
  if(sum(success > trials) == 0 & is.vector(success) == TRUE & sum(success %% 1 == 0) == length(success)) {
    return(TRUE)
  } else if(max(success) >= trials) {
    stop("Success cannot be greater than trials")
  } else {
    stop("Invalid success value")
  }
}
