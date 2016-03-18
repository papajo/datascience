#google trends sunglasses uk
trendsData <- read.csv("report.csv", # the file we want to read in
                       skip=4,      # skip the first 4 lines
                       nrow=582-5)  # read in 582-5 lines of data
# (R assumes the first line had
# column names on it)

head(trendsData)

#To work out the Future Orientation Index for 2012, 
#we only need to look at what people were searching for in 2012.

#To get the year which the week started in, we can use “substring” to get the 
#first four characters of the text in the Week column. 

trendsData$Year <- substring(trendsData$Week, first=1, last=4)
trendsData$Year <- as.numeric(trendsData$Year)

#Now, we just want the rows in which the year is 2012 - subset
trendsData2012 <- subset(trendsData, Year == 2012)
#Our last task is to calculate the Future Orientation Index for 2012. This is the volume of searches for the next year, “2013”, 
#divided by the volume of searches for the previous year, “2011”

#First let's ’s work out the total volume of searches for “2013” in 2012.
sum(trendsData2012$X2013)
#In the same way, we can work out the total volume of searches for “2011” in 2012:
sum(trendsData2012$X2011)
#In the same way, we can work out the total volume of searches for “2011” in 2012:
sum(trendsData2012$X2013) / sum(trendsData2012$X2011)

mySubstring <- substring("FutureLearn", first=6, last=8)

##
allFileNames <- list.files('Trends')
#extract country codes
substring(allFileNames, first=1, last=2)
