

housing <- read.csv("~/Downloads/ss06hid.csv")
names <- names(housing)
splits <- strsplit(names, "wgtp")

### -------------------------------------------

gdp <- read.csv("~/Downloads/GDP.csv", header=F, skip=5, nrows=190)
nums <- as.numeric(gsub(pattern=",", replacement="", gdp$V5))
mean(nums, na.rm=T)

### -------------------------------------------

library(dplyr)
edu <- read.csv("~/Downloads/EDU.csv")
gdp.edu <- merge(gdp, edu, by.x="V1", by.y="CountryCode")
fiscal.year <- grepl("fiscal year end", gdp.edu$Special.Notes, ignore.case=T)
gdp.edu.1 <- gdp.edu[fiscal.year, ]
june.end <- grepl("june", gdp.edu.1$Special.Notes, ignore.case=T)
gdp.edu.2 <- gdp.edu.1[june.end, ]

### -------------------------------------------

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
logl <- grepl("2012", sampleTimes)
sampleTimes.1 <- sampleTimes[logl]
mon <- weekdays(sampleTimes.1) == "Monday"
sampleTimes.1[mon]
