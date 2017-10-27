Experiment <- function(hcp, dir = "../../data/MicrosoftAcademic/TimeSeries") {
  testFiles <- list.files(dir, pattern="*\\.csv", full.names=TRUE)
  
  for (testFile in testFiles) {
    cat(sprintf("Processing file: %s\n", testFile))
    data <- read.csv(testFile)
    
    return(data)
  }
  
}