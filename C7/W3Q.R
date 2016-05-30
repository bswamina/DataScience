
data(mtcars)

### Q1

### Consider the mtcars data set. Fit a model with mpg as the outcome
### that includes number of cylinders as a factor variable and weight
### as confounder. Give the adjusted estimate for the expected change
### in mpg comparing 8 cylinders to 4

fit <- lm(mpg ~ factor(cyl) + wt, data = mtcars)
summary(fit)$coef

### For factor(cyl)8 -6.070860

### Q2

### Consider the mtcars data set. Fit a model with mpg as the outcome
### that includes number of cylinders as a factor variable and weight
### as a possible confounding variable. Compare the effect of 8 versus
### 4 cylinders on mpg for the adjusted and unadjusted by weight models.
### Here, adjusted means including the weight variable as a term in the
### regression model and unadjusted means the model without weight
### included. What can be said about the effect comparing 8 and 4
### cylinders after looking at models with and without weight included

fit1 <- lm(mpg ~ factor(cyl), data = mtcars)
summary(fit)$coef
summary(fit1)$coef

### holding weight constant, cylinder appears to have less of an impact
### on mpg than if weight is disregarded

### Q3

### Consider the mtcars data set. Fit a model with mpg as the outcome
### that considers number of cylinders as a factor variable and weight
### as confounder. Now fit a second model with mpg as the outcome model 
### that considers the interaction between number of cylinders (as a
### factor variable) and weight. Give the P-value for the likelihood
### ratio test comparing the two models and suggest a model using 0.05
### as a type I error rate significance benchmark

fit2 <- lm(mpg ~ factor(cyl) * wt, data = mtcars)
anova(fit, fit2)

### The P-value is larger than 0.05. So, according to our criterion, we
### would fail to reject, which suggests that the interaction terms may
### not be necessary

### Q4

### Consider the mtcars data set. Fit a model with mpg as the outcome
### that includes number of cylinders as a factor variable and weight
### inlcuded in the model as
### lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
### How is the wt coefficient interpretted

fit3 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
summary(fit3)$coef

### The estimated expected change in MPG per one ton increase in weight
### for a specific number of cylinders (4, 6, 8)

### Q5

### Consider the following data set
### x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
### y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
### Give the hat diagonal for the most influential point

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit4 <- lm(y ~ x)
hatvalues(fit4)

### 0.9946

### Q6

### Consider the following data set
### x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
### y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
### Give the slope dfbeta for the point with the highest hat value

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit5 <- lm(y ~ x)
dfbetas(fit5)

### 134

### Q7

### Consider a regression relationship between Y and X with and
### without adjustment for a third variable Z. Which of the following
### is true about comparing the regression coefficient between Y and
### X with and without adjustment for Z

### It is possible for the coefficient to reverse sign after adjustment.
### For example, it can be strongly significant and positive before
### adjustment and strongly significant and negative after adjustment
