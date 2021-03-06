% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main_funcs.R
\name{bin_distribution}
\alias{bin_distribution}
\title{bin_distribution function}
\usage{
bin_distribution(trials, prob)
}
\arguments{
\item{trials}{the number of n attempts (integer)}

\item{prob}{the probability of success (integer)}
}
\value{
a dataframe
}
\description{
creates a dataframe with success and probability as columns
}
\examples{
bin_distribution(trials = 5, prob = 0.5)
}
