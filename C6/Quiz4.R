
### Q1

### A pharmaceutical company is interested in testing a potential blood
### pressure lowering medication. Their first examination considers only
### subjects that received the medication at baseline then two weeks later.
### The data are as follows (SBP in mmHg)
###
### Subject Baseline Week 2
### 1       140      132
### 2       138      135
### 3       150      151
### 4       148      146
### 5       135      130
###
### Consider testing the hypothesis that there was a mean reduction in
### blood pressure? Give the P-value for the associated two sided T test.
### (Hint, consider that the observations are paired.)

baseline <- c(140, 138, 150, 148, 135)
week2 <- c(132, 135, 151, 146, 130)
t.test(x = baseline, y = week2, alternative = 'two.sided', paired = TRUE)$p.value

### Q2

### A sample of 9 men yielded a sample average brain volume of 1,100cc
### and a standard deviation of 30cc. What is the complete set of values
### of mu0 that a test of H0:mu=mu0 would fail to reject the null hypothesis
### in a two sided 5% Students t-test?

n <- 9
mu <- 1100
sd <- 30
df <- n - 1
mu + c(-1, 1) * qt(0.975, df) * sd / sqrt(n)

### Q3

### Researchers conducted a blind taste test of Coke versus Pepsi.
### Each of four people was asked which of two blinded drinks given
### in random order that they preferred. The data was such that 3
### of the 4 people chose Coke. Assuming that this sample is
### representative, report a P-value for a test of the hypothesis
### that Coke is preferred to Pepsi using a one sided exact test.

n <- 4
x <- 3
binom.test(x = x, n = n, alternative = 'greater')$p.value

### Q4

### Infection rates at a hospital above 1 infection per 100 person
### days at risk are believed to be too high and are used as a
### benchmark. A hospital that had previously been above the
### benchmark recently had 10 infections over the last 1,787 person
### days at risk. About what is the one sided P-value for the
### relevant test of whether the hospital is *below* the standard?

r <- 1 / 100
x <- 10
days <- 1787
poisson.test(x = x, T = days, r = r, alternative = 'less')$p.value

### Q7

### Researchers would like to conduct a study of 100 healthy adults
### to detect a four year mean brain volume loss of .01 mm3. Assume
### that the standard deviation of four year volume loss in this
### population is .04 mm3. About what would be the power of the
### study for a 5% one sided test versus a null hypothesis of no
### volume loss?

n <- 100
delta <- 0.01
sd <- 0.04
power.t.test(n = n, delta = delta, sd = sd,
             type = 'one.sample',
             alternative = 'one.sided')$power

### Q8

### Researchers would like to conduct a study of n healthy adults
### to detect a four year mean brain volume loss of .01 mm3.
### Assume that the standard deviation of four year volume loss in
### this population is .04 mm3. About what would be the value of n
### needed for 90% power of type one error rate of 5% one sided test
### versus a null hypothesis of no volume loss?

delta <- 0.01
sd <- 0.04
power <- 0.9
power.t.test(power = power, delta = delta, sd = sd,
             type = 'one.sample',
             alternative = 'one.sided')$n
