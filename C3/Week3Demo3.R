aaa <- c(1, 2, 3, 4, 5, 2, 3, 4, 5, 6, 7)

cut(aaa, 3)

quantile(aaa)

### Divide the range of aaa into intervals

cut(aaa, breaks = quantile(aaa))

table(aaa, cut(aaa, breaks = quantile(aaa)))

### Load Hmisc

library(Hmisc)

### Similar to cut(aaa, breaks = quantile(aaa)) - much cleaner

cut2(aaa, g = 4)
