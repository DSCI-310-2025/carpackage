% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarize_data.R
\name{summarize_data}
\alias{summarize_data}
\title{Summarize Data}
\usage{
summarize_data(data)
}
\arguments{
\item{data}{A data frame.}
}
\value{
Prints the summary to console.
}
\description{
This function prints summary statistics for a given data frame.
}
\examples{
df <- data.frame(
  age = c(21, 25, 30),
  score = c(88, 90, 95)
)
summarize_data(df)
}
