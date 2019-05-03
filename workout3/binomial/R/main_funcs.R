source("R/checker_funcs.R")
source("R/aux_funcs.R")

#' @title bin_choose function
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n the number of attempts (integer)
#' @param k the number of successes (integer)
#' @return the number of combinations in which k successes can occur in n trials (integer)
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)

bin_choose <- function(n, k) {
  if(max(k) > n){
    stop("k cannot be greater than n")
  } else{
    combinfunc <- function(vec) {
      combin <- factorial(n) / (factorial(vec) * factorial(n - vec))
      return(combin)
    }
    return(sapply(k, FUN = combinfunc))}
}

#' @title bin_probability function
#' @description calculates the probability of getting k successes in n trials
#' @param success the number of k successes (integer)
#' @param trials the number of n attempts (integer)
#' @param prob the probability of success (integer)
#' @return a numeric probability (numeric)
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)

bin_probability <- function(success, trials, prob) {
  if(!check_success(success, trials)) {
    stop("invalid success value")
  } else if(!check_trials(trials)) {
    stop("invalid trials value")
  } else if(!check_prob(prob)) {
    stop("invalid prob value")
  } else {
    binprob <- bin_choose(trials, success) * prob ^ success * (1 - prob) ^ (trials - success)
    return(binprob)
  }
}

#' @title bin_distribution function
#' @description creates a dataframe with success and probability as columns
#' @param trials the number of n attempts (integer)
#' @param prob the probability of success (integer)
#' @return a dataframe
#' @export
#' @importFrom graphics barplot plot
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution <- function(trials, prob) {
  dis_df <- data.frame(success = 0:trials,
                       probability = bin_probability(0:trials,
                                                     trials,
                                                     prob))
  class(dis_df) <- c("bindis", "data.frame")
  return(dis_df)
}

#' @export
plot.bindis <- function(dis, ...) {
  barplot(dis$probability,
          names.arg = dis$success,
          width = 1,
          xlab = "successes",
          ylab = "probability")
}

#' @title bin_cumulative function
#' @description creates a dataframe with success, probability, and cumulative as columns
#' @param trials the number of n attempts (integer)
#' @param prob the probability of success (integer)
#' @return a dataframe
#' @export
#' @importFrom graphics barplot plot
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)

bin_cumulative <- function(trials, prob) {
  cum_df <- data.frame(success = 0:trials,
                       probability = bin_probability(0:trials,
                                                     trials,
                                                     prob),
                       cumulative = cumsum(bin_probability(0:trials,trials, prob)))
  class(cum_df) <- c("bincum", "data.frame")
  return(cum_df)
}

#' @export
plot.bincum <- function(cum, ...) {
  plot(x = cum$success,
       y = cum$cumulative,
       xlab = "successes",
       ylab = "probability",
       type = "o")
}

#' @title bin_variable function
#' @description describes the given variables
#' @param trials the number of n attempts (integer)
#' @param prob the probability of success (integer)
#' @return a list with named elements and object class "binvar"
#' @export
#' @examples
#' bin_variable(trials = 10, prob = 0.3)

bin_variable <- function(trials, prob) {
  if(!check_trials(trials)) {
    stop("invalid trials")
  } else if(!check_prob(prob)) {
    stop("invalid prob")
  } else{
    elements <- list(trials = trials,
                     prob = prob)
    class(elements) <- "binvar"
    return(elements)
  }
}

#' @export
print.binvar <- function(binvar, ...) {
  cat('"Binomial variable"\n\n')
  cat("Parameters\n")
  cat(paste0("- number of trials: ", binvar$trials), '\n')
  cat(paste0("- prob of success: ", binvar$prob))
}

#' @export
summary.binvar <- function(binvar, ...) {
  summaryelements <- list(trials = binvar$trials,
                          prob = binvar$prob,
                          mean = aux_mean(binvar$trials,
                                          binvar$prob),
                          variance = aux_variance(binvar$trials,
                                                  binvar$prob),
                          mode = aux_mode(binvar$trials,
                                          binvar$prob),
                          skewness = aux_skewness(binvar$trials,
                                                  binvar$prob),
                          kurtosis = aux_kurtosis(binvar$trials,
                                                  binvar$prob)
  )
  class(summaryelements) <- "summary.binvar"
  return(summaryelements)
}

#' @export
print.summary.binvar <- function(binvarsum, ...) {
  cat('"Summary Binomial"\n\n')
  cat("Parameters\n")
  cat(paste0("- number of trials: ", binvarsum$trials), '\n')
  cat(paste0("- prob of success: ", binvarsum$prob), "\n\n")
  cat("Measures\n")
  cat(paste0("- mean    : ", binvarsum$mean), "\n")
  cat(paste0("- variance: ", binvarsum$variance), "\n")
  cat(paste0("- mode    : ", binvarsum$mode), "\n")
  cat(paste0("- skewness: ", binvarsum$skewness), "\n")
  cat(paste0("- kurtosis: ", binvarsum$kurtosis), "\n")
}

#' @title bin_mean function
#' @description computes the mean of the distribution
#' @param trials the number of n attempts (integer)
#' @param prob the probability of success (integer)
#' @return the mean (integer)
#' @export
#' @examples
#' bin_mean(trials = 10, prob = 0.3)

bin_mean <- function(trials, prob) {
  if(!check_trials(trials)) {
    stop("invalid trials")
  } else if(!check_prob(prob)) {
    stop("invalid prob")
  }
  aux_mean(trials, prob)
}

#' @title bin_variance function
#' @description computes the variance of the distribution
#' @param trials the number of n attempts (integer)
#' @param prob the probability of success (integer)
#' @return the variance (integer)
#' @export
#' @examples
#' bin_variance(trials = 10, prob = 0.3)

bin_variance <- function(trials, prob) {
  if(!check_trials(trials)) {
    stop("invalid trials")
  } else if(!check_prob(prob)) {
    stop("invalid prob")
  }
  aux_variance(trials, prob)
}

#' @title bin_mode function
#' @description computes the mode of the distribution
#' @param trials the number of n attempts (integer)
#' @param prob the probability of success (integer)
#' @return the mode (integer)
#' @export
#' @examples
#' bin_mode(trials = 10, prob = 0.3)

bin_mode <- function(trials, prob) {
  if(!check_trials(trials)) {
    stop("invalid trials")
  } else if(!check_prob(prob)) {
    stop("invalid prob")
  }
  aux_mode(trials, prob)
}

#' @title bin_skewness function
#' @description computes the skewness of the distribution
#' @param trials the number of n attempts (integer)
#' @param prob the probability of success (integer)
#' @return the skewness (integer)
#' @export
#' @examples
#' bin_skewness(trials = 10, prob = 0.3)

bin_skewness <- function(trials, prob) {
  if(!check_trials(trials)) {
    stop("invalid trials")
  } else if(!check_prob(prob)) {
    stop("invalid prob")
  }
  aux_skewness(trials, prob)
}

#' @title bin_kurtosis function
#' @description computes the kurtosis of the distribution
#' @param trials the number of n attempts (integer)
#' @param prob the probability of success (integer)
#' @return the kurtosis (integer)
#' @export
#' @examples
#' bin_kurtosis(trials = 10, prob = 0.3)

bin_kurtosis <- function(trials, prob) {
  if(!check_trials(trials)) {
    stop("invalid trials")
  } else if(!check_prob(prob)) {
    stop("invalid prob")
  }
  aux_kurtosis(trials, prob)
}
