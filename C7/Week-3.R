
###

n <- 100
x <- rnorm(n)
x2 <- rnorm(n)
x3 <- rnorm(n)
## Generate the data
y <- 1 + x + x2 + x3 + rnorm(n, sd = .1)
## Get the residuals having removed X2 and X3 from X1 and Y
ey <- resid(lm(y ~ x2 + x3))
ex <- resid(lm(x ~ x2 + x3))
## Fit regression through the origin with the residuals
sum(ey * ex) / sum(ex ^ 2)
## Double check with lm
coef(lm(ey ~ ex - 1))

### --------------------------------------------------------

data(swiss)
library(ggplot2)
library(GGally)
my_fn <- function(data, mapping, method='loess', ...){
    p <- ggplot(data = data, mapping = mapping) + 
        geom_point() + 
        geom_smooth(method = method, ...)
    p
}
ggpairs(swiss, lower = list(continuous = my_fn))

summary(lm(Fertility ~ . , data = swiss))$coefficients

summary(lm(Fertility ~ Agriculture, data = swiss))$coefficients

###

n <- 100
x2 <- 1 : n
x1 <- .01 * x2 + runif(n, -.1, .1)
y = -x1 + x2 + rnorm(n, sd = .01)
summary(lm(y ~ x1))$coef
summary(lm(y ~ x1 + x2))$coef

dat = data.frame(y = y, x1 = x1, x2 = x2, ey = resid(lm(y ~ x2)), ex1 = resid(lm(x1 ~ x2)))
ggplot(dat, aes(y = y, x = x1, colour = x2)) +
    geom_point(colour="grey50", size = 5) +
    geom_smooth(method = lm, se = FALSE, colour = "black") +
    geom_point(size = 4)

ggplot(dat, aes(y = ey, x = ex1, colour = x2)) +
    geom_point(colour="grey50", size = 5) +
    geom_smooth(method = lm, se = FALSE, colour = "black") +
    geom_point(size = 4)

### --------------------------------------------------------

data(InsectSprays)
ggplot(data = InsectSprays, aes(y = count, x = spray, fill  = spray)) +
    geom_violin(colour = "black", size = 2) +
    xlab("Type of spray") + ylab("Insect count")

summary(lm(count ~ spray, data = InsectSprays))$coef

### To exclude the intercept so all factor variables are included

summary(lm(count ~ spray - 1, data = InsectSprays))$coef

### --------------------------------------------------------

par(mfrow = c(2, 2))
fit <- lm(Fertility ~ . , data = swiss)
plot(fit)

###

n <- 100
x <- rnorm(n)
y <- x + rnorm(n, sd = .3)
plot(c(-3, 6), c(-3, 6), type = "n", frame = FALSE, xlab = "X", ylab = "Y")
abline(lm(y ~ x), lwd = 2)
points(x, y, cex = 2, bg = "lightblue", col = "black", pch = 21)
points(0, 0, cex = 2, bg = "darkorange", col = "black", pch = 21)
points(0, 5, cex = 2, bg = "darkorange", col = "black", pch = 21)
points(5, 5, cex = 2, bg = "darkorange", col = "black", pch = 21)
points(5, 0, cex = 2, bg = "darkorange", col = "black", pch = 21)
