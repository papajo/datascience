## R SCRIPT:

library(RCurl)
library(RJSONIO)

allViewsData <- NULL

for (theURL in allURLs) { 
  
  cat("Downloading data from", theURL, "\n") 
  
  rawData <- getURL(theURL)
  parsedData <- fromJSON(rawData)
  viewsData <- data.frame(Date=names(parsedData$daily_views),
                          Views=parsedData$daily_views,
                          row.names=NULL)
  
  allViewsData <- rbind(allViewsData, viewsData) #bind all of the rows of data we download into one big table
  #print(viewsData) 
} 

str(allViewsData)
# Set the values in the Date column as dates:
allViewsData$Date <- as.Date(allViewsData$Date)
# put the rows in date order
allViewsData <- allViewsData[order(allViewsData$Date),]
#
allViewsData
# remove all the rows labelled NA. 
#To do this, we tell R to keep all the rows where Date isn’t NA.
allViewsData <- subset(allViewsData, !is.na(Date))
# fix the row numbers
row.names(allViewsData) <- NULL
#Plot graph
library(ggplot2)
#
ggplot(data=allViewsData, aes(x=Date, y=Views, group=1)) + geom_line()


## END OF SCRIPT