#---------------------------------------------------------------------
#it would be fairly boring to type in all those URLs ourselves! 
#The good news is that it’s very easy to get R to generate them all 
#for us. Let’s look at how to explain to R how to construct these URLs.
#First, let’s tell R which year and month we would like to retrieve data for:
#---------------------------------------------------------------------

setwd('~/Projects/datascience/')

## R SCRIPT:

allURLs <- NULL

for ( year in (2010:2016)) {
  for (month in(1:12)) {
      if ((year == 2016) && (month > 2)) { 
        next 
      } 
      theURL <- "http://stats.grok.se/json/en/"
      theURL <- paste0(theURL, year)
      if (month < 10) { 
        theURL <- paste0(theURL, "0") 
      } 
      theURL <- paste0(theURL, month) 
      theURL <- paste0(theURL, "/Friday")
      
      #print(theURL)
      allURLs <- c(allURLs, theURL)
  }
}
## END OF SCRIPT

allURLs