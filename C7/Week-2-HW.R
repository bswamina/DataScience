
### Week 2 Home work

### -------------------------------------------------------------------

### Linear Regression

library(UsingR)

### 1. Fit a linear regression model to the father.son dataset with the
### father as the predictor and the son as the outcome. Give a p-value
### for the slope coefficient and perform the relevant hypothesis test

data(father.son)
fit <- lm(sheight ~ fheight, data=father.son)
sum.coef <- summary(fit)$coef
t.value <- sum.coef[2, 3]
p.value <- sum.coef[2, 4]

### Null hypothesis H0: slope b1 of father's height = 0
### Since p.value is very small, we reject the null hypothesis

### 2. Refer to question 1. Interpret both parameters. Recenter for the
### intercept if necessary

sum.coef

### Produces the following output:
###
###              Estimate Std. Error  t value     Pr(>|t|)
### (Intercept) 33.886604 1.83235382 18.49348 1.604044e-66
### fheight      0.514093 0.02704874 19.00618 1.121268e-69
###
### From the above table at cell [2, 1] with a value 0.514093 indicates
### that for every inch of fathers height, there is a 0.514093 inch change
### in sons height.
### The way to interpret cell [1, 1] with a value of 33.886604 is that for
### a zero inch of fathers height, sons height is almost 34 inches, which
### makes no sense. Hence we center to make it more interpretable

fit <- lm(sheight ~ I(fheight - mean(fheight)), data=father.son)
sum.coef <- summary(fit)$coef
sum.coef

### Produces the following output:
###
###                             Estimate Std. Error   t value     Pr(>|t|)
### (Intercept)                68.684070 0.07421078 925.52689 0.000000e+00
### I(fheight - mean(fheight))  0.514093 0.02704874  19.00618 1.121268e-69
###
### From the above table at cell [2, 1] with a value 0.514093 indicates
### that there is no change to the slope. Shifting or centering has no
### impact on the slope. Scaling will however change the slope estimate.
### The way to interpret cell [1, 1] with a value of 68.684070 is that for
### at the average fathers height, sons height is almost 69 inches

### 3. Refer to question 1. Predict the son's height if the father's height
### is 80 inches. Would you recommend this prediction? Why or why not?

fit <- lm(sheight ~ fheight, data=father.son)
predict(fit, newdata = data.frame(fheight = 80))
summary(father.son)

### Produces the following output:
###
###     fheight         sheight     
### Min.   :59.01   Min.   :58.51  
### 1st Qu.:65.79   1st Qu.:66.93  
### Median :67.77   Median :68.62  
### Mean   :67.69   Mean   :68.68  
### 3rd Qu.:69.60   3rd Qu.:70.47  
### Max.   :75.43   Max.   :78.36

### From the summary, the maximum fathers height thats been observed is
### about 75 inches. 80 is beyond that range and we have no way of
### predicting for that value with confidence

### 4. Load the mtcars dataset. Fit a linear regression with miles per
### gallon as the outcome and horsepower as the predictor. Interpret
### your coefficients, recenter for the intercept if necessary

data(mtcars)
fit <- lm(mpg ~ hp, data = mtcars)
sum.coef <- summary(fit)$coef
sum.coef

### Produces the following output:
###
###                Estimate Std. Error   t value     Pr(>|t|)
### (Intercept) 30.09886054  1.6339210 18.421246 6.642736e-18
### hp          -0.06822828  0.0101193 -6.742389 1.787835e-07
###
### From the above output, for every 1 unit increase in the hp,
### there is approx 0.07 decrease (cell [2,1] value -0.06822828)
### in mpg
### For a hp of zero, the mpg is approx 30 (cell [1,1] value 30.09886054)
### which makes no sense hence we want to center

fit <- lm(mpg ~ I(hp - mean(hp)), data=mtcars)
sum.coef <- summary(fit)$coef
sum.coef

### Produces the following output:
###
###                     Estimate Std. Error   t value     Pr(>|t|)
### (Intercept)      20.09062500  0.6828817 29.420360 1.101810e-23
### I(hp - mean(hp)) -0.06822828  0.0101193 -6.742389 1.787835e-07
###
### From the above output, for an averaged hp car, the mpg is approx
### 20

### 5. Refer to question 4. Overlay the fit onto a scatterplot

library(ggplot2)
ggplot(mtcars, aes(x=hp, y=mpg)) +
    geom_point(cex=3, alpha=0.5) +
    geom_smooth(method='lm', se=FALSE, lwd=2)

### 6. Refer to question 4. Test the hypothesis of no linear relationship
### between horsepower and miles per gallon

fit <- lm(mpg ~ hp, data = mtcars)
sum.coef <- summary(fit)$coef
sum.coef

### Produces the following output:
###
###                Estimate Std. Error   t value     Pr(>|t|)
### (Intercept) 30.09886054  1.6339210 18.421246 6.642736e-18
### hp          -0.06822828  0.0101193 -6.742389 1.787835e-07
###
### The p-value is very less compared to alpha (0.05) and hence we reject
### the null hypothesis

### 7. Refer to question 4. Predict the miles per gallon for a horsepower
### of 111

fit <- lm(mpg ~ hp, data = mtcars)
predict(fit, newdata = data.frame(hp = 111))

### -------------------------------------------------------------------

### Residual

### 1. Fit a linear regression model to the father.son dataset with the
### father as the predictor and the son as the outcome. Plot the son's
### height (horizontal axis) versus the residuals (vertical axis)

data(father.son)
y <- father.son$sheight
x <- father.son$fheight
n <- nrow(father.son)
fit <- lm(y ~ x)
e <- resid(fit)
plot(x, e,  
     xlab = "Father's Height", 
     ylab = "Residuals", 
     bg = "lightblue", 
     col = "black", cex = 2, pch = 21, frame = FALSE)
abline(h = 0, lwd = 2)
for (i in 1 : n) 
    lines(c(x[i], x[i]), c(e[i], 0), col = "red" , lwd = 2)

### 2. Refer to question 1. Directly estimate the residual variance and
### compare this estimate to the output of lm

sum(resid(fit)^2) / (n - 2) ### Manual
summary(fit)$sigma^2 ### Using R's built-in

### 3. Refer to question 1. Give the R squared for this model

yhat <- predict(fit)
ybar <- mean(y)
sum((yhat - ybar)^2)/sum((y - ybar)^2) ### Manually
summary(fit)$r.squared ### Using R's built-n

### 4. Load the mtcars dataset. Fit a linear regression with miles per
### gallon as the outcome and horsepower as the predictor. Plot horsepower
### versus the residuals

data(mtcars)
y <- mtcars$mpg
x <- mtcars$hp
n <- nrow(mtcars)
fit <- lm(y ~ x)
e <- resid(fit)
plot(x, e,  
     xlab = "Horsepower", 
     ylab = "Residuals", 
     bg = "lightblue", 
     col = "black", cex = 2, pch = 21, frame = FALSE)
abline(h = 0, lwd = 2)
for (i in 1 : n) 
    lines(c(x[i], x[i]), c(e[i], 0), col = "red" , lwd = 2)

### 5. Refer to question 4. Directly estimate the residual variance and
### compare this estimate to the output of lm

summary(fit)$sigma^2 ### Using R's built-in

### -------------------------------------------------------------------

### Inference

### 1. Test whether the slope coefficient for the father.son data is
### different from zero (father as predictor, son as outcome)

data(father.son)
y <- father.son$sheight
x <- father.son$fheight
fit <- lm(y ~ x)
sum.tbl <- summary(fit)$coef
sum.tbl

### The model is y = b0 + b1 * x + e. The hypothesis test is h0: b1 = 0
### and ha: b1 != 0. Since the p-value is very very small, we reject the
### null hypothesis

### 2. Refer to question 1. Form a confidence interval for the slope coefficient

sum.tbl[2, 1] + c(1, -1) * qt(0.975, fit$df) * sum.tbl[2, 2] ### Manually
confint(fit) ### Using R's built-in

### 3. Refer to question 1. Form a confidence interval for the intercept
### (center the fathers' heights first to get an intercept that is easier
### to interpret)

y <- father.son$sheight
x <- father.son$fheight - mean(father.son$fheight)
fit <- lm(y ~ x)
confint(fit) ### Using R's built-in

### 4. Refer to question 1. Form a mean value interval for the expected
### son's height at the average father's height

fit <- lm(sheight ~ I(fheight - mean(fheight)), data=father.son)
m <- mean(father.son$fheight)
predict(fit, newdata=data.frame(fheight=m), interval='confidence')

### 5. Refer to question 1. Form a prediction interval for the son's
### height at the average father's height

fit <- lm(sheight ~ I(fheight - mean(fheight)), data=father.son)
m <- mean(father.son$fheight)
predict(fit, newdata=data.frame(fheight=m), interval='prediction')
