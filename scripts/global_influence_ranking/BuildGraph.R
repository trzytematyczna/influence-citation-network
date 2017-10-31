library(igraph)

BuildGraph <- function(filename = "../../results/TimeSeriesExperiments/results_2017-10-30_23-22-06_unity.csv") {
  globalInfluence <- read.csv(filename)
  g <- graph(directed = TRUE, edges = as.vector(t(globalInfluence[,1:2])))
  g
}
