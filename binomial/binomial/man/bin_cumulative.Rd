% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/workout3_Zimeng_Zheng.R
\name{bin_cumulative}
\alias{bin_cumulative}
\title{Binomial Cumulative}
\usage{
bin_cumulative(trials, prob)
}
\arguments{
\item{trials}{the number of trials}

\item{prob}{the probability that success occurs}
}
\value{
data frame with both the probability distribution and the cumulative probabilities
}
\description{
function to calculate the cumulative of binomial random variable
}
\examples{
bin_cumulative(trials = 5, prob = 0.5)
}
