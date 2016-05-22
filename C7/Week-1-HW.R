
### Week 1 Home work asssignment

### Section - 1

### 1. Consider the dataset given by x <- c(0.725,0.429,-0.372 ,0.863).
### What value of mu minimizes sum((x - mu)^2)?

x <- c(0.725,0.429,-0.372 ,0.863)
mu <- mean(x)

### 2. Reconsider the previous question. Suppose that weights were given,
### w <- c(2, 2, 1, 1) so that we wanted to minimize sum(w * (x - mu) ^ 2)
### for mu. What value would we obtain ?

w <- c(2, 2, 1, 1)
mu <- sum(x * w) / sum(w)

### 3. Take the Galton and obtain the regression through the origin slope
### estimate where the centered parental height is the outcome and the
### child's height is the predictor.

library(UsingR)
data(galton)
x <- galton$child
y <- galton$parent
yc <- y - mean(y)
xc <- x - mean(x)
lm(formula=yc ~ xc - 1)

### Section - 2

### 1. Take the Galton dataset and find the mean, standard deviation and
### correlation between the parental and child heights.

y <- galton$child
x <- galton$parent
mean(y)
sd(y)
mean(x)
sd(x)
cor(y, x)

### 2. Center the parent and child variables and verify that the centered
### variable means are 0

yc <- y - mean(y)
xc <- x - mean(x)
mean(yc)
mean(xc)

### 3. Rescale the parent and child variables and verify that the scaled
### variable standard deviations are 1

ys <- y/sd(y)
xs <- x/sd(x)
sd(ys)
sd(xs)

### 4. Normalize the parental and child heights. Verify that the normalized
### variables have mean 0 and standard deviation 1 and take the correlation
### between them

yn <- (y - mean(y)) / sd(y)
xn <- (x - mean(x)) / sd(x)
mean(yn)
sd(yn)
mean(xn)
sd(xn)

### Section - 3

### 1. Install and load the package UsingR and load the father.son data
### with data(father.son). Get the linear regression fit where the son's
### height is the outcome and the father's height is the predictor. Give
### the intercept and the slope, plot the data and overlay the fitted
### regression line

data(father.son)
y <- father.son$sheight
x <- father.son$fheight
lm(formula=y ~ x)
library(ggplot2)
ggplot(father.son, aes(x=fheight, y=sheight)) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE, lwd=2)
