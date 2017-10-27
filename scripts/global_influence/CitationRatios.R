CitationRatios <- function(hcp, confCitations, dir = "../../data/MicrosoftAcademic/TimeSeries") {
  uniqueYears <- unique(confCitations$current_year)
  ratios <- c()
  
  for (year in uniqueYears) {
    periodCitation <- confCitations[confCitations$current_year == year, ]
    periodStart <- # from file
    periodEnd <- year-1;
    # Stretch hcp
    # For each year from  year_cited_papers apply stretched-hcp to selected_cited_papers_in_year_no/all_cited_papers_in_year_no
    # Sum all from current year
    ratios <- c(ratios, sum)
  }
}