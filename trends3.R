#Do Richer countries google for more information about the future?

gdpPerCap <- read.csv("rawdata_2004.txt",
                      sep="\t",    # columns are separated with tabs
                      header=F,    # no column names are given,
                      row.names=1) # row names (numbers) are in the 
                                   # 1st column.
head(gdpPerCap)
#tidyup
names(gdpPerCap) <- c("Country", "GDP_PC")
#check
head(gdpPerCap)
#
str(gdpPerCap)
#
gdpPerCap$GDP_PC <- substring(gdpPerCap$GDP_PC, first=2)
#
head(gdpPerCap)
#
gdpPerCap$GDP_PC <- sub(pattern=",", # find "," (comma)
                        replacement="",              # replace it with "" (nothing)
                        x=gdpPerCap$GDP_PC)          # in the GDP_PC column
#
head(gdpPerCap)
#
gdpPerCap$GDP_PC <- as.numeric(gdpPerCap$GDP_PC)
#
head(gdpPerCap)
#
str(gdpPerCap)
#
head(allFOIs)
#
install.packages("countrycode")
library(countrycode)
#
gdpPerCap$Country <- countrycode(gdpPerCap$Country,  # change this data
                                 origin="country.name",  # from a name
                                 destination="iso2c")    # to a 2-char code
#
head(gdpPerCap)
#merge 2 tables
foiGDP <- merge(allFOIs, gdpPerCap)
#
head(foiGDP)
#So are they correlated? Let’s plot them. Load the “ggplot2” library we used for plotting before

library(ggplot2)
#we’ll use “geom_point()” to make a “scatterplot” of the Future Orientation Index against GDP per capita, so that we plot one point for each country.

ggplot(data=foiGDP,   # Make a plot using our FOI and GDP data
       aes(x=FOI ,       # with FOI on the x-axis
           y=GDP_PC)) +  # and GDP_PC on the y-axis
  geom_point()      # Plot each of the points
#Does the graph suggest there might be a correlation?
#It does look like countries with higher Future Orientation Indices may also have higher GDP per capita values. We can do a very simple check of whether there is statistical evidence for this relationship by running a “correlation test”.
#R is great at statistics, so this is very simple. Just use the command “cor.test”, and name the two columns you would like to compare:
  
  cor.test(foiGDP$FOI, foiGDP$GDP_PC)

#We see that the “cor” value is quite close to 1, 
#which means that there’s quite a strong relationship. 
#We can also see that the “p-value” is less than 0.05. 
#We would therefore normally call this relationship “statistically significant”.
#http://www.cookbook-r.com/Graphs/index.html





