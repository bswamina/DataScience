### Distributions

### The no of ad clicks for a company is normally distributed with a mean
### of 1020 and a std deviation of 50.
###
### a. What is the probability of getting more than 1160 clicks in a day ?
### b. What no. of daily ad clicks would represent where 75% of the days have
###    fewer clicks

### a.

pnorm(1160, 1020, 50, lower.tail = FALSE)

### b.

qnorm(0.75, mean = 1020, sd = 50)

### The no. of people that show up at a bus stop is Poisson with a mean of 2.5
### per hour. If we watch the bus stop for 4 hours, what is the probability
### that 3 or fewer people show up

ppois(3, lambda = 2.5 * 4)

### If we flip a coin with success probability of 0.01 five hundred times.
### What is the probability of 2 or fewer success ?

### Two solutions
pbinom(2, size = 500, prob = 0.01)
### Or
ppois(2, lambda = 500 * 0.01)

### Suppose that the number of web hits to a particular site are approximately
### normally distributed with a mean of 100 hits per day and a standard 
### deviation of 10 hits per day. Imagine taking a random sample of 50 days.
### What number of web hits would be the point so that only 5% of averages of
### 50 days of web traffic have more hits ?

### Since we are taking the mean of 50 days, new sd = 10/sqrt(50)
qnorm(0.95, mean = 100, sd = 10 / sqrt(50))

### You don't believe that your friend can discern good wine from cheap.
### Assuming that you're right, in a blind test where you randomize 6
### paired varieties (Merlot, Chianti, ...) of cheap and expensive wines.
### What is the change that she gets 5 or 6 right ?

### The 4 here with lower.tail = FALSE means strictly > 4 (for 5 or 6)
pbinom(4, size = 6, prob = 0.5, lower.tail = FALSE)
