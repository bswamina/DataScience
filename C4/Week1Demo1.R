library(datasets)

data(cars)
with(cars, plot(speed, dist))
head(cars)
hist(cars$speed, main = 'Car Speed Histogram')

data(airquality)
head(airquality)
with(airquality, plot(Wind, Ozone, main = 'Ozone vs Wind'))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "red"))

# type = 'n does not plot anything
with(airquality, plot(Wind, Ozone, main = 'Ozone vs Wind', type = 'n'))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "red"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "green"))
legend('topright', pch = 1, col = c('red', 'green'), legend = c('May', "Others"))

with(airquality, plot(Wind, Ozone, main = 'Ozone vs Wind', pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

par(mfrow = c(1, 2))
with(airquality, {
    plot(Wind, Ozone, main = 'Ozone vs Wind')
    plot(Temp, Ozone, main = 'Ozone vs Temp')
})

x <- rnorm(100)
hist(x)

y <- rnorm(100)
plot(x, y)

par(mar = c(4, 4, 2, 2))

plot(x, y)
title("x vs y")

pdf(file = "~/Downloads/MyPlot.pdf")
plot(x, y)
title("x vs y")
dev.off()

plot(x, y)
title("Cool Plot - x vs y")
dev.copy(jpeg, file = "~/Downloads/MyPlot.jpg")
dev.off()
