###
### Question - 6
###
### Compare emissions from motor vehicle sources in Baltimore City
### with emissions from motor vehicle sources in Los Angeles County,
### California (fips == "06037"). Which city has seen greater changes
### over time in motor vehicle emissions?
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

### Create a data table with total emission from motor vehicles (type == 'ON-ROAD')
### for Baltimore (fips == 24510) & Los Angeles (fips == '06037') by fips & year

q6 <- NEI[type == 'ON-ROAD' & (fips == '24510' | fips == '06037'),
          .(totalPM2.5 = sum(Emissions)),
          by = c('fips', 'year')]

### Plot the graph using ggplot2

ggplot(q6, aes(x = year, y = totalPM2.5,
               col = factor(fips, labels = c('Los Angeles', 'Baltimore')))) +
    geom_line(lwd = 1) +
    geom_point(size = 3) +
    scale_x_continuous(breaks = q6[,year]) +
    labs(x = 'Year', y = 'Total PM2.5', color = 'Cities') +
    ggtitle('Total Emissions from Motor Vehicles - Los Angeles vs Baltimore') +
    theme_bw() +
    theme(plot.title = element_text(face = 'bold', size = 10),
          axis.title = element_text(face = 'bold', size = 10))

### Save the plot to a PNG file

ggsave("~/Downloads/plot6.png", width = 6, height = 6, dpi = 100)

### Clean the environment

rm(q6)
rm(nei.rds, scc.rds)
rm(SCC, NEI)
