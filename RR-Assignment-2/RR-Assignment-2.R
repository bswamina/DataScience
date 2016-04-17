###
### Reproducible Research - Assignment - 2
###

### Load the necessary libraries

library(R.utils)
library(data.table)
library(ggplot2)
library(gridExtra)

### Define function to download & unzip the Storm Events dataset

setup.dataset <- function(url, dir, file) {
    bz2 <- 'repdata-data-StormData.csv.bz2'
    
    cat('[INFO]: Ready to download from url:', url, '\n')
    
    ### Download
    download.file(url,
                  paste(dir, bz2, sep='/'),
                  mode = 'wb',
                  method = 'curl')
    
    cat('[INFO]: Ready to unzip file:', bz2, '\n')
    
    ### Unzip
    if (file.exists(paste(dir, bz2, sep='/'))) {
        bunzip2(paste(dir, bz2, sep='/'),
                paste(dir, file, sep='/'),
                remove = FALSE)
    }
    
    cat('[INFO]: Download and setup completed\n')
}

### Initialize global variables

url <- 'https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2'
dir <- '~/Downloads/DATA'
file <- 'repdata-data-StormData.csv'
csv.file <- paste(dir, file, sep='/')

### Download and unzip the dataset in a directory

if (!file.exists(csv.file)) {
    setup.dataset(url, dir, file)
}

if (!file.exists(csv.file) || file.info(csv.file)$size <= 0) {
    stop(paste("ERROR: CSV file", csv.file, "not valid"))
}

### Load the dataset in a data.table

data <- fread(csv.file)
dim(data)
str(data)

### Create the minimalistic fatalities & injuries datasets to show the events that are
### most harmful to the population health

### Create a fatalities data.table where we pick events with FATALITIES > 0

fatalities.data <- data[FATALITIES > 0,
                        .(TOT.FATALITIES = sum(FATALITIES)),
                        by = .(EVTYPE)][order(-TOT.FATALITIES)]
dim(fatalities.data)
str(fatalities.data)
head(fatalities.data)
tail(fatalities.data)
fatalities.data[1:20]

### Plot the top 10 Fatalities by Event type

ggplot(data = fatalities.data[1:10],
       aes(x = reorder(EVTYPE, TOT.FATALITIES),
           y = TOT.FATALITIES, fill = EVTYPE)) +
    geom_bar(stat = 'identity') +
    labs(x = 'Event Type', y = 'Total Fatalities') +
    ggtitle('Top 10 Fatalities by Event Type') +
    theme_bw() +
    theme(plot.title = element_text(face = 'bold', size = 10),
          axis.title = element_text(face = 'bold', size = 10)) +
    coord_flip()

### Create a injuries data.table where we pick events with INJURIES > 0

injuries.data <- data[INJURIES > 0,
                      .(TOT.INJURIES = sum(INJURIES)),
                      by = .(EVTYPE)][order(-TOT.INJURIES)]
dim(injuries.data)
str(injuries.data)
head(injuries.data)
tail(injuries.data)
injuries.data[1:20]

### Plot the top 5 Injuries by Event type

ggplot(data = injuries.data[1:5],
       aes(x = reorder(EVTYPE, TOT.INJURIES),
           y = TOT.INJURIES, fill = EVTYPE)) +
    geom_bar(stat = 'identity') +
    labs(x = 'Event Type', y = 'Total Injuries') +
    ggtitle('Top 5 Injuries by Event Type') +
    theme_bw() +
    theme(plot.title = element_text(face = 'bold', size = 10),
          axis.title = element_text(face = 'bold', size = 10)) +
    coord_flip()

### Create the minimalistic propdmg & cropdmg datasets to show the events that have had
### the greatest economic consequences

### The PROPDMGEXP or CROPDMGEXP columns represent a letter to denote the scale in
### 'K' for Thousands, 'M' for Millions, and 'B' for Billions

exp.vec <- c('k', 'K', 'm', 'M', 'b', 'B')

### Normalization funtion to get the estimated damage in a whole amount using columns
### PROPDMG and PROPDMGEXP (or CROPDMG and CROPDMGEXP)

std.exp <- function(val, exp) {
    if (exp %in% c('k', 'K')) {
        ### Thousand
        return (val * 1000)
    } else if (exp %in% c('m', 'M')) {
        ### Million
        return (val * 1000 * 1000)
    } else if (exp %in% c('b', 'B')) {
        ### Billion
        return (val * 1000 * 1000 * 1000)
    }
}

### Create a temporary propdmg data.table for PROPDMG > 0 & PROPDMGEXP %in% exp.vec

propdmg.tmp <- data[PROPDMG > 0 & PROPDMGEXP %in% exp.vec,
                    .(PROPDMG, PROPDMGEXP, EVTYPE)]

### Add a new column to the temporary propdmg data.table that has estimated amount
### using the std.exp function on each row

propdmg.tmp <- propdmg.tmp[, PROPDMGAMT := std.exp(PROPDMG, PROPDMGEXP),
                           by = 1:nrow(propdmg.tmp)]

### Create the final progdmg data.table

propdmg.data <- propdmg.tmp[,
                            .(TOT.PROPDMGAMT = sum(PROPDMGAMT)),
                            by = EVTYPE][order(-TOT.PROPDMGAMT)]
rm(propdmg.tmp)
dim(propdmg.data)
str(propdmg.data)
head(propdmg.data)
tail(propdmg.data)

### Create a temporary cropdmg data.table for CROPDMG > 0 & CROPDMGEXP %in% exp.vec

cropdmg.tmp <- data[CROPDMG > 0 & CROPDMGEXP %in% exp.vec,
                    .(CROPDMG, CROPDMGEXP, EVTYPE)]

### Add a new column to the temporary cropdmg data.table that has estimated amount
### using the std.exp function on each row

cropdmg.tmp <- cropdmg.tmp[, CROPDMGAMT := std.exp(CROPDMG, CROPDMGEXP),
                           by = 1:nrow(cropdmg.tmp)]

### Create the final crogdmg data.table

cropdmg.data <- cropdmg.tmp[,
                            .(TOT.CROPDMGAMT = sum(CROPDMGAMT)),
                            by = EVTYPE][order(-TOT.CROPDMGAMT)]
rm(cropdmg.tmp)
dim(cropdmg.data)
str(cropdmg.data)
head(cropdmg.data)
tail(cropdmg.data)

rm(data)

### Plot the damages to the property and crop as two separate sub-graphs

options(scipen = 10)

p1 <- ggplot(data = propdmg.data[1:10],
             aes(x = reorder(EVTYPE, TOT.PROPDMGAMT),
                 y = TOT.PROPDMGAMT, fill = EVTYPE)) +
             geom_bar(stat = 'identity') +
             labs(x = 'Event Type', y = 'Total Property Damage') +
             ggtitle('Top 10 Property Damages by Event Type') +
             theme_bw() +
             theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
             theme(plot.title = element_text(face = 'bold', size = 10),
                   axis.title = element_text(face = 'bold', size = 10)) +
             coord_flip()

p2 <- ggplot(data = cropdmg.data[1:10],
             aes(x = reorder(EVTYPE, TOT.CROPDMGAMT),
                 y = TOT.CROPDMGAMT, fill = EVTYPE)) +
    geom_bar(stat = 'identity') +
    labs(x = 'Event Type', y = 'Total Crop Damage') +
    ggtitle('Top 10 Crop Damages by Event Type') +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    theme(plot.title = element_text(face = 'bold', size = 10),
          axis.title = element_text(face = 'bold', size = 10)) +
    coord_flip()

grid.arrange(p1, p2, ncol = 2)
