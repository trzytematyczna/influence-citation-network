library(dplyr)

source("FindMaxLag.R")
source("GrangerTest.R")

Influence <- function(d1, d2, epsilon=1e-5) {
  # Find maximal lag
  maxLag <- FindMaxLag(d1, d2)
  # Initiaize empty influence tables
  influenceAB <-data.frame(matrix(ncol = 2, nrow = 0))
  # Recalculate Grander Casuality for all valid lags
  for (lag in seq(maxLag, 1, -1)) {
    result <- GrangerTest(d1, d2, lag)
    if (!is.null(result)) {
      influenceAB <- rbind(influenceAB, result)
    }
  }
  # Find optimal solution in results
  if (nrow(influenceAB) == 0) {
    return(NULL)
  } 
  influenceAB <- arrange(influenceAB, pvalue)[1, ]
  if (influenceAB$pvalue < epsilon) {
    return(influenceAB)
  }
  return(NULL)
}