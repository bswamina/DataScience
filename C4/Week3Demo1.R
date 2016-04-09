set.seed(1234)
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
par(mar = c(0, 0, 0, 0))
plot(x, y, col = 'blue', pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

### -------------------------------------------------

data.frame <- data.frame(x = x, y = y)
dist(data.frame)

### -------------------------------------------------

dist <- dist(data.frame)
print(dist, digits = 1)
hclust <- hclust(dist)
plot(hclust)

### -------------------------------------------------

source('~/Projects/DataScience/C4/myplclust.R')
myplclust(hclust, lab = rep(1:3, each = 4), lab.col = rep(1:3, each = 4))

### -------------------------------------------------

heatmap(as.matrix(dist))
