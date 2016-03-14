setwd('~/Projects/datascience/')
library(RCurl)
install.packages("RJSONIO")
library("RJSONIO")
library("ggplot2")
rawData <- getURL("http://stats.grok.se/json/en/201510/Friday")

parsedData <- fromJSON(rawData)

parsedData$daily_views

#We want one column with the date, and one column with the views.
#In parsedData$daily_views, the dates are actually the “names” of the data points. 
#We can get the names out like this:

names(parsedData$daily_views)

#Now we want to put the names in one column, 
#and the views data in another

data.frame(Date=names(parsedData$daily_views),  # get the names
           Views=parsedData$daily_views)  # get the data points

#better yet
viewsData <- data.frame(Date=names(parsedData$daily_views),  # get the names
           Views=parsedData$daily_views,  # get the data points
           row.names=NULL)  # tell R to stop using the dates as names

viewsData

#We can get the Date column back out like this:
  
  viewsData$Date
# and the Views column back out like this:
  
  viewsData$Views
#You can get the third row of the table out like this:
  
  viewsData[3,]

#dates are in the wrong order. To sort this out, we have to tell R that this column contains dates:
  
  viewsData$Date <- as.Date(viewsData$Date)

#order all the rows according to the order of the dates.

order(viewsData$Date)

#Re-order the rows in the order specified by the order function, so that the first date is first, the second date is second, and so on.

viewsData[order(viewsData$Date),]

#This now looks a bit better… So let’s replace the old “viewsData” with this new table

viewsData <- viewsData[order(viewsData$Date),]

#Let’s have a look:
  
  viewsData

#The row numbers being in a strange order can be distracting, so let’s reset them!
  
  row.names(viewsData) <- NULL

#Looks better…

viewsData

#Here’s how to plot a line graph of our data with ggplot2:
  
  ggplot(data=viewsData,  # Make a plot using our views data
         aes(x=Date,  # with Date on the x-axis
             y=Views,  # and Views on the y-axis
             group=1)) +  # Use all the data as one data series
  geom_line()  # and draw a line of this data

#There are some clear peaks…
#Given that we’re looking at the page about “Friday”, 
#what might this be due to?