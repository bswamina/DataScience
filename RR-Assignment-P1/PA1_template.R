###

library(data.table)
library(ggplot2)

###

file <- "~/Downloads/DATA/activity.csv"

###

data <- fread(file)
data$date <- as.Date(data$date, "%Y-%m-%d")

### Question 1

q1 <- data[, .(total = sum(steps)), by = .(date)]

range <- range(q1[, total], na.rm = TRUE)
print(paste("Range: ", range))

hist <- hist(q1[, total], breaks = seq(0, 25000, 2500))
print("hist counts: ")
print(hist$counts)

ggplot(q1, aes(x = q1[,total])) +
    geom_histogram(binwidth = 2500, fill = 'lightskyblue', color = 'blue') +
    scale_x_continuous(breaks = seq(0, 25000, 2500)) +
    scale_y_continuous(breaks = seq(0, 30, 2)) +
    labs(x = 'Daily Total Steps', y = 'Frequency') +
    ggtitle('Histogram of Total Daily Steps') +
    theme_bw() +
    theme(plot.title = element_text(face = 'bold', size = 10),
          axis.title = element_text(face = 'bold', size = 10))

mean <- mean(q1[,total], na.rm = TRUE)
median <- median(q1[,total], na.rm = TRUE)

print(paste("Mean: ", round(mean, digits = 2)))
print(paste("Median: ", median))

### Question 2

q2 <- data[, .(mean = mean(steps, na.rm = TRUE)), by =.(interval)]

ggplot(q2, aes(x = interval, y = mean)) +
    geom_line(color = 'blue', size = 1) +
    labs(x = '5-min Intervals', y = 'Average Total Steps') +
    ggtitle('Time Series Graph of Average Steps at 5-min Intervals') +
    theme_bw() +
    theme(plot.title = element_text(face = 'bold', size = 10),
          axis.title = element_text(face = 'bold', size = 10))

max <- q2[which.max(q2[, mean]), interval]
print(paste("Max interval: ", max))

### Question 3

data.new <- data.table(data)

na.idx <- which(is.na(data.new))
print(paste("Count of NAs: ", length(na.idx)))

mean.steps = round(mean(data.new$steps, na.rm = TRUE), digits = 2)
print(paste("Mean steps: ", mean.steps))

data.new$steps[na.idx] <- mean.steps

q3 <- data.new[, .(total = sum(steps)), by = .(date)]

hist <- hist(q3[, total], breaks = seq(0, 25000, 2500))
print("hist counts (post impute): ")
print(hist$counts)

ggplot(q3, aes(x = q3[,total])) +
    geom_histogram(binwidth = 2500, fill = 'lightgreen', color = 'darkgreen') +
    scale_x_continuous(breaks = seq(0, 25000, 2500)) +
    scale_y_continuous(breaks = seq(0, 30, 2)) +
    labs(x = 'Daily Total Steps', y = 'Frequency') +
    ggtitle('Histogram of Total Daily Steps') +
    theme_bw() +
    theme(plot.title = element_text(face = 'bold', size = 10),
          axis.title = element_text(face = 'bold', size = 10))

mean.new <- mean(q3[, total])
median.new <- median(q3[, total])

print(paste("Mean (post impute): ", round(mean.new, digits=2)))
print(paste("Median (post impute): ", median.new))

### Question 4

data.new$wday <- ifelse(weekdays(data.new$date) %in% c("Saturday", "Sunday"),
                       'weekend', 'weekday')

q4 <- data.new[, .(mean = mean(steps)), by = .(interval, wday)]

ggplot(q4, aes(x = interval, y = mean)) +
    geom_line(color = 'darkgreen', size = 1) +
    labs(x = '5-min Intervals', y = 'Average Total Steps') +
    ggtitle('Time Series Graph of Average Steps at 5-min Intervals') +
    scale_x_continuous(breaks = seq(0, 2500, 250)) +
    facet_wrap(~wday, nrow = 2) +
    theme_bw() +
    theme(strip.background = element_rect(fill = 'lightgreen')) +
    theme(plot.title = element_text(face = 'bold', size = 10),
          axis.title = element_text(face = 'bold', size = 10))
