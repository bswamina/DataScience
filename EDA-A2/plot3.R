###
### Question - 3
###
### Of the four types of sources indicated by the type (point, nonpoint,
### onroad, nonroad) variable, which of these four sources have seen
### decreases in emissions from 1999–2008 for Baltimore City? Which have
### seen increases in emissions from 1999–2008? Use the ggplot2 plotting
### system to make a plot answer this question.
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

### Create a data table with total emission for Baltimore (fips == 24510) by type & year

q3 <- NEI[fips == '24510',
          .(totalPM2.5 = sum(Emissions)),
          by = c('type', 'year')]

### Plot the graph using ggplot2

ggplot(q3, aes(x = year, y = totalPM2.5, col = type)) +
    geom_line(lwd = 1) +
    geom_point(size = 3) +
    scale_x_continuous(breaks = q3[,year]) +
    labs(x = 'Year', y = 'Total PM2.5') +
    ggtitle('Four Types of Emissions in Baltimore, U.S') +
    theme_bw() +
    theme(plot.title = element_text(face = 'bold', size = 10),
          axis.title = element_text(face = 'bold', size = 10))

### Save the plot to a PNG file

ggsave("~/Downloads/plot3.png", width = 6, height = 6, dpi = 100)

### Clean the environment

rm(q3)
rm(nei.rds, scc.rds)
rm(SCC, NEI)
