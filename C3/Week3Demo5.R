library(dplyr)

chicago <- readRDS("~/Downloads/chicago.rds")

names(chicago)

### Should see:
### [1] "city" "tmpd" "dptp" "date" "pm25tmean2" "pm10tmean2" "o3tmean2"
### [8] "no2tmean2"

### To return a data frame with columns city through date

head(select(chicago, city:date))

### To return a data frame without columns city through dptp

head(select(chicago, -(city:dptp)))

### To do the same using regular data frame (its the following 3 steps)

i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])

### To return a data frame where we filter rows to satisfy the condition
### pm25mean2 > 35

head(filter(chicago, pm25tmean2 > 35))

### To return a data frame where we filter rows to satisfy the condition
### pm25mean2 > 35 & tmpd > 75

head(filter(chicago, pm25tmean2 > 35 & tmpd > 75))

### Arrange the chicago data frame based on the date

chicago <- arrange(chicago, date)

### Arrange the chicago data frame based on the date (descending order)

chicago <- arrange(chicago, desc(date))

### Rename the columns dptp to dewpoint and pm25tmean2 to pm25

chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)

### Add a new column called pm25detrend which equals pm25 - mean(pm25)

chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = T))

### Add a new column called tmpcat which equals a factor value of hot or cold

chicago <- mutate(chicago, tmpcat = factor(1 * tmpd > 80, labels = c("hot", "cold")))

### Now group the data frame by tmpcat column

hotcold <- group_by(chicago, tmpcat)

### Find the min and max of tmpd and pm25

summary <- summarize(hotcold, tmpdmin = min(tmpd),
                     pm25min = min(pm25, na.rm = T),
                     tmpdmax = max(tmpd),
                     pm25max = max(pm25, na.rm = T))

### Use pipeline %>%

chicago <- readRDS("~/Downloads/chicago.rds")

chicago %>% 
    rename(pm25 = pm25tmean2) %>% 
    mutate(tmpcat = factor(1 * tmpd > 80, labels = c("hot", "cold")))
