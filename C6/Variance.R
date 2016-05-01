### Variance

### Binomial variance

p <- seq(0, 1, length = 1000)
y <- p * (1 - p)
plot(p, y, type = 'l', lwd = 2, frame = FALSE)

### Standard deviation of a sample of standard normals

nosim <- 1000
n <- 10
mat <- matrix(rnorm(nosim * n), nosim)
sd1 <- sd(apply(mat, 1, mean))
sd2 <- 1 / sqrt(n)
cat('sd1 =', sd1, '\n')
cat('sd2 =', sd2, '\n')
