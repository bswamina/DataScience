###
### Question - 1
###
### Have total emissions from PM2.5 decreased in the United States from 1999
### to 2008? Using the base plotting system, make a plot showing the total
### PM2.5 emission from all sources for each of the years 1999, 2002, 2005,
### and 2008.
###

### Load libraries - data.table and ggplot2

library(data.table)
library(ggplot2)

### Initialize variable(s)

nei.rds <- "~/Downloads/DATA/summarySCC_PM25.rds"
scc.rds <- "~/Downloads/DATA/Source_Classification_Code.rds"

### Load the data tables NEI and SCC

NEI <- data.table(readRDS(nei.rds))
SCC <- data.table(readRDS(scc.rds))

### Set the option so large numbers are not displayed in scientific notation

options(scipen = 10)

### Create a data table with total emission by year

q1 <- NEI[, .(totalPM2.5 = sum(Emissions)), by = year]

### Plot the graph using ggplot2

ggplot(data = q1, aes(x = year, y = totalPM2.5)) +
    geom_bar(fill = 'lightskyblue', width = 0.8, stat = 'identity') +
    scale_x_continuous(breaks = q1[,year]) +
    labs(x = 'Year', y = 'Total PM2.5') +
    ggtitle('Total Emissions in the U.S') +
    theme_bw() +
    theme(plot.title = element_text(face = 'bold', size = 10),
          axis.title = element_text(face = 'bold', size = 10))

### Save the plot to a PNG file

ggsave("~/Downloads/plot1.png", width = 6, height = 6, dpi = 100)

### Clean the environment

rm(q1)
rm(nei.rds, scc.rds)
rm(SCC, NEI)
