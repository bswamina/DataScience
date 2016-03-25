
library(stringr)

txt <- readLines("http://www.textfiles.com/computers/24to96x.txt")

head(txt)

max <- length(txt)

set.seed(200)

i <- sample(1:max, 1)

### -------------------------------------------

tolower(txt[i])
toupper(txt[i])

### -------------------------------------------

strs <- unlist(str_split(txt[i], pattern = '[ ,\\!\"\\.-]'))
words <- strs[nchar(strs) > 1]
rm(strs)

### -------------------------------------------

grep("[Ww]hen", txt)
grep("[Ww]hen", txt, value = T)
grep("don't", txt, value = T, ignore.case = T)
