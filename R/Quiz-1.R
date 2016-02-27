### Read the data set

df <- read.csv("hw1_data.csv")

### Count of missing values in the Ozone column

oz <- df$Ozone[is.na(df$Ozone)]
length(oz)

### Mean of the Ozone column (excluding NA values)

mean(df$Ozone, na.rm=TRUE)

### Mean of the Solar.R column for the subset of rows where Ozone > 31 and Temp > 90

mean(df$Solar.R[df$Ozone > 31 & df$Temp > 90], na.rm=TRUE)

### Mean of Temp column when Month == 6

mean(df$Temp[df$Month == 6], na.rm=TRUE)

### Max value for Ozone column when Month == 5

max(df$Ozone[df$Month==5], na.rm=TRUE)
