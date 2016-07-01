###
### plot4.R
###

### Load Library

library(data.table)

### Initialize variables

dir <- "~/Downloads/"
file <- "household_power_consumption.txt"
data.file <- paste0(dir, file)

### Load the file household_power_consumption.txt as a data.table

fullset <- fread(data.file, na.strings = "?")

rm(dir, file, data.file)

### Load a subset of fullset for dates "1/2/2007" & "2/2/2007"

subset <- fullset[Date == "1/2/2007" | Date == "2/2/2007"]

rm(fullset)

### Subset and rename columns

dataset <- subset[, .(dtm = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
                      gap = Global_active_power,
                      grp = Global_reactive_power,
                      vol = Voltage,
                      sm1 = Sub_metering_1,
                      sm2 = Sub_metering_2,
                      sm3 = Sub_metering_3)]

rm(subset)

### Draw the plot

png(filename = "~/Downloads/plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(dataset, {
    plot(dtm, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    plot(dtm, vol, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(dtm, sm1, type = "n", xlab = "", ylab = "Energy sub metering")
    lines(dtm, sm1, type = "l", col = 'black')
    lines(dtm, sm2, type = "l", col = 'red')
    lines(dtm, sm3, type = "l", col = 'blue')
    legend('topright', bty = 'n', lty = c(1, 1),
           col = c('black', 'red', 'blue'),
           legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
    plot(dtm, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()

rm(dataset)
