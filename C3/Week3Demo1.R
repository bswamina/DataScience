library(plyr)

set.seed(100)

df <- data.frame('var1' = sample(11:15), 
                 'var2' = sample(21:25), 
                 'var3' = sample(LETTERS, 5))
df <- df[sample(1:5), ]
df$var2[c(1, 3)] <- NA
print("--- Print DF ---")
print(df)

df2 <- df[df$var2 >= 22,]
print("--- Print DF2 ---")
print (df2)

df3 <- df[which(df$var2 >= 22),]
print("--- Print DF3 ---")
print(df3)

print("--- Print arrange(df, var1) ---")
print(arrange(df, var1))

print("--- Print arrange(df, desc(var1)) ---")
print(arrange(df, desc(var1)))

df$var4 <- rnorm(5)
print("--- Print DF ---")
print(df)
