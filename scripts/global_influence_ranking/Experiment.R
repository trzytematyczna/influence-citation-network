source("BuildGraph.R")
source("BuildPageRankGraph.R")
source("EMA.R")
source("EMAWeights.R")
source("LoadTimeSeries.R")
source("VisualizeGraph.R")

Experiment <- function(influenceFile = "../../results/TimeSeriesExperiments/results_2017-10-30_23-22-06_unity.csv",
                       dirTimeSeries ="../../data/MicrosoftAcademic/TimeSeries/") {
  g <- BuildGraph(influenceFile)
  for (vid in V(g)) {
    # Get all out-going neighbors
    adjacents <- neighbors(g, vid, mode="out")
    ema <- 0
    for (aid in adjacents) {
      ts <- LoadTimeSeries(V(g)[vid]$name, V(g)[aid]$name, dirTimeSeries)
      ema <- ema + EMA(ts)
    }
    V(g)[vid]$ema <- ema / length(adjacents)
    V(g)[vid]$neighbours <- length(adjacents)
  }
  V(g)[is.na(V(g)$ema)]$ema <- 0
  gpr <- BuildPageRankGraph(V(g)$name)
  VisualizeGraph(g, gpr)
  gpr
}