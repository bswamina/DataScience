### A second way to solve the problems in Quiz 1 using the hw1_data.csv dataset

### Read the data set

df <- read.csv('hw1_data.csv')

### Logical condition to only include rows that have all the values

df_cc <- complete.cases(df)

### Data frame with rows that have all the values (for all columns)

df_clean <- df[df_cc, ]

### Mean of the Ozone column
### Since we need to find the mean of Ozone (original has missing values) use df_clean

oz_mean <- mean(df_clean[['Ozone']])

### Logical condition for Ozone > 31 and Temp > 90
### Since condition involes Ozone (original has missing values) use df_clean

sr_ss <- df_clean[['Ozone']] > 31 & df_clean[['Temp']] > 90

### Mean of the Solar.R column for the subset of rows where Ozone > 31 and Temp > 90

sr_mean <- mean(df_clean[sr_ss, ][['Solar.R']])

### Logical condition for Month == 90

mt_ss <- df[['Month']] == 6

### Mean of Temp column when Month == 6

tm_mean <- mean(df[mt_ss, ][['Temp']])

### Logical condition for Month == 5
### Since we need to find the mean of Ozone (original has missing values) use df_clean

mt2_ss <- df_clean[['Month']] == 5

### Max value for Ozone column when Month == 5

oz_max <- max(df_clean[mt2_ss, ][['Ozone']])
