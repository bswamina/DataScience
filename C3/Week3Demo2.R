file <- "/home/bswamina/Downloads/Restaurants.csv"

df <- read.csv(file)

head(df, 3)

tail(df, 3)

summary(df)

quantile(df$councilDistrict, na.rm = T)
quantile(df$councilDistrict, probs = c(0.50, 0.75, 0.90))

table(df$zipCode, useNA = "ifany")

### Cross tabulation between df$councilDistrict (rows) and 
### df$zipCode (columns)

table(df$councilDistrict, df$zipCode)

### Same as above: table(df$councilDistrict, df$zipCode)

xtabs(~ df$councilDistrict + df$zipCode)