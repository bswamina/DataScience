###
### What is the average GDP ranking for the “High income: OECD” and 
### “High income: nonOECD” group ?
###

library(dplyr)

### What is the average GDP ranking for the “High income: OECD” group ?

g1 <- gdp.edu %>% filter(Income.Group == 'High income: OECD') %>% select(X.1)
sapply(g1, mean)

### Result: 32.96667

### What is the average GDP for “High income: nonOECD” group ?

g2 <- gdp.edu %>% filter(Income.Group == 'High income: nonOECD') %>% select(X.1)
sapply(g2, mean)

### Result: 91.91304
