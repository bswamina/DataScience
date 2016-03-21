###
### Cut the GDP ranking into 5 separate quantile groups. Make a table
### versus Income.Group. How many countries are Lower middle income
### but among the 38 nations with highest GDP ?
###

library(dplyr)

### Create a smaller table by selecting Income.Group and X.1 

tbl <- select(gdp.edu, Income.Group, X.1)

### Cut the GDP ranking into 5 separate quantile groups. 

table(tbl[,1], cut(tbl[,2], 5))

### Result:
###                        (0.811,38.8] (38.8,76.6] (76.6,114] (114,152] (152,190]
###                                   0           0          0         0         0
###   High income: nonOECD            4           5          8         4         2
###   High income: OECD              18          10          1         1         0
###   Lower middle income             5          13         12         8        16
###   Low income                      0           1          9        16        11
###   Upper middle income            11           9          8         8         9
