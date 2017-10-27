GrangerTest <- function(d1, d2, lag) {
  tryCatch({
    result<-grangertest(d1 ~ d2, order = lag)
    data.frame(lag=lag, pvalue=result[2, 4])
  }, error=function(e) {
    return(NULL)
  })
}