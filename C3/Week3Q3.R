###
### Load the Gross Domestic Product data for the 190 ranked countries
### in this data set:
###
### https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
###
### Load the educational data from this data set:
###
### https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
###
### Match the data based on the country shortcode. How many of the IDs match?
### Sort the data frame in descending order by GDP rank (so United States is
### last). What is the 13th country in the resulting data frame ?
###

library(dplyr)

### Tip: Always take a peek at the data file to see if we have header and if
### we need to skip any lines

### Load the Gross Domestic Product data for the 190 ranked countries

gdp <- read.csv("~/Downloads/GDP.csv", skip = 4, nrows = 190)

### Load the educational data set

edu <- read.csv("~/Downloads/EDU.csv")

### Match the data based on the country shortcode

gdp.edu <- merge(gdp, edu, by.x="X", by.y="CountryCode")

### How many of the IDs match ?

nrow(gdp.edu)

### Result: [1] 189

### Sort the data frame in descending order by GDP rank

gdp.edu2 <- arrange(gdp.edu, desc(X.1))

### What is the 13th country in the resulting data frame ?

select(gdp.edu2, Short.Name)[13, ]

### Result: [1] St. Kitts and Nevis
