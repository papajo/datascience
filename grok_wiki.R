setwd('~/Projects/datascience/')
library(RCurl)
install.packages("RJSONIO")
library("RJSONIO")
rawData <- getURL("http://stats.grok.se/json/en/201510/Friday")

parsedData <- fromJSON(rawData)

parsedData$daily_views


