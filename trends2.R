## R SCRIPT:
##calculates and prints the Future Orientation Index for each counrty in 2012
allFileNames <- list.files("Trends")

allFOIs <- NULL

for (filename in allFileNames) {
  fullFilename <- paste0("Trends/", filename)
  
  trendsData <- read.csv(fullFilename, skip=4, nrow=476-5)
  trendsData$Year <- substring(trendsData$Week, first=1, last=4)
  trendsData$Year <- as.numeric(trendsData$Year)
  trendsData2012 <- subset(trendsData, Year == 2012)
  foi <- sum(trendsData2012$X2013) / sum(trendsData2012$X2011)
  
  # extract thecountry code from the filename
  country <- substring(filename, first=1, last=2)   
  
  # add another column ‘Country’ which contains the country code
  foiRow <- data.frame(Country=country, FOI=foi) 
  
  allFOIs <- rbind(allFOIs, foiRow)
}
## END OF SCRIPT