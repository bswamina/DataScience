###
### Question - 5
###
### How have emissions from motor vehicle sources changed from
### 1999–2008 in Baltimore City?
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
### for Baltimore (fips == 24510) by year

q5 <- NEI[type == 'ON-ROAD' & fips == '24510',
          .(totalPM2.5 = sum(Emissions)),
          by = year]

### Plot the graph using ggplot2

ggplot(data = q5, aes(x = year, y = totalPM2.5)) +
    geom_bar(fill = 'lightskyblue', width = 0.8, stat = 'identity') +
    scale_x_continuous(breaks = q5[,year]) +
    labs(x = 'Year', y = 'Total PM2.5') +
    ggtitle('Total Emissions from Motor Vehicles in Baltimore, U.S') +
    theme_bw() +
    theme(plot.title = element_text(face = 'bold', size = 10),
          axis.title = element_text(face = 'bold', size = 10))

### Save the plot to a PNG file

ggsave("~/Downloads/plot5.png", width = 6, height = 6, dpi = 100)

### Clean the environment

rm(q5)
rm(nei.rds, scc.rds)
rm(SCC, NEI)
