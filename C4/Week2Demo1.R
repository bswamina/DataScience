###

library(lattice)
library(datasets)

###

xyplot(Ozone ~ Wind, data = airquality)

head(airquality)

### Convert the Month column to a factor variable
airquality <- transform(airquality, Month = factor(Month))

xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))

### Print

p <- xyplot(Ozone ~ Wind, data = airquality)
print(p)

### --------------------------------------------------------------

set.seed(100)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f*x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c('G1', 'G2'))
xyplot(y ~ x | f, layout = c(2, 1))

xyplot(y ~ x | f, panel = function(x, y, ...) {
    panel.xyplot(x, y, ...)
    panel.abline(h = median(y), lty = 2)
    panel.lmline(x, y, col = 2)
})
