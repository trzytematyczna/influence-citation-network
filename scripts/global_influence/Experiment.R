source("CitationRatios.R")
source("ExtractConf.R")
source("Influence.R")

# Historical citations priority functions
source("hcp/Unity.R")
source("hcp/ReverseExp.R")

Experiment <- function(hcp, dir = "../../data/MicrosoftAcademic/TimeSeries") {
  testFiles <- list.files(dir, pattern="*\\.csv")
  filesVisited <- logical(length(testFiles))
  ratios <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("from", "to", "granger_ft", "granger_tf"))
  
  for (idx in 1:length(testFiles)) {
    # Skip if file already visited
    if (filesVisited[idx]) {
      next()
    }
    # Extract conferences name
    testFile <- testFiles[idx]
    names <- ExtractConf(testFile)
    
    secondFile <- paste(names[2], names[1], sep="-")
    idx2 <- which(grepl(paste("^", secondFile, sep=""), testFiles))
    testFile2 <- testFiles[idx2]
    
    filesVisited[c(idx, idx2)] <- TRUE
    
    data <- read.csv(paste(dir, testFile, sep="/"))
    data2 <- read.csv(paste(dir, testFile2, sep="/"))
    
    if (nrow(data) == 0 || nrow(data2) == 0) {
      next()
    }
    # Process first file
    ratio1 <- CitationRatios(hcp, data)
    ratio2 <- CitationRatios(hcp, data2)
    
    infAB <- Influence(ratio1, ratio2)
    infBA <- Influence(ratio2, ratio1)
    
    cat(sprintf("Influence A->B: %d; B->A: %d",infAB, infBA))
    
    #ratios <- rbind(ratios, data.frame(names[1], names[2], ratio, ratio))
    #return(ratios)
  }
  ratios
}