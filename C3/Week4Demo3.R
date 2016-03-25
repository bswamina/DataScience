
d1 <- Sys.Date()
print(d1)

d2 <- date()
print(d2)

### -------------------------------------------

format(d1, "%a %b %d, %Y")
format(d1, "%A, %B %d, %Y")

### -------------------------------------------

sd <- c("1Jan2010", "2Feb2011", "3Mar2012")
dd <- as.Date(sd, "%d%b%Y")
print(dd)

dd[2]-dd[1]
as.numeric(dd[2]-dd[1])

### -------------------------------------------

weekdays(d1)
months(d1)

### -------------------------------------------

library(lubridate)

ymd <- ymd("20160321")
print(ymd)

mdy <- mdy("03/21/2016")
print(mdy)

dmy <- dmy("21-03-2016")
print(dmy)

mdy.hms <- mdy_hms("03/21/2016 21:15:25")
print(mdy.hms)

ymd.hms <- ymd_hms("2016-03-21 21:15:25", tz = "EST")
print(ymd.hms)

tm <- now()
print(tm)

### -------------------------------------------

dt1 <- as.Date("03/25/2016 12:05:45", format = "%m/%d/%Y %H:%M:%S")

ct.dt1 <- as.POSIXct(dt1)
lt.dt1 <- as.POSIXlt(dt1)

attributes(lt.dt1)

print(lt.dt1$mday)
print(lt.dt1$mon)
print(lt.dt1$year) ### years since 1900
print(lt.dt1$wday) ### 0:6 - day of the week starting sunday (0)
print(lt.dt1$yday)

