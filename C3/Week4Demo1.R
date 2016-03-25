
cameras <- read.csv("~/Downloads/cameras.csv")

tolower(names(cameras))

splits <- strsplit(names(cameras), "\\.")

first.part <- function(x) { x[1] }

sapply(splits, first.part)

### -------------------------------------------

reviews <- read.csv("~/Downloads/reviews.csv")
solutions <- read.csv("~/Downloads/solutions.csv")

sub("_", "", names(reviews))

my.str <- "This_is_a_long_string"
sub("_", " ", my.str)
gsub("_", " ", my.str)

### -------------------------------------------

grep("Alameda", cameras$intersection)
grep("Alameda", cameras$intersection, value = T)

table(grepl("Alameda", cameras$intersection))

cameras2 <- cameras[!grepl("Alameda", cameras$intersection), ]

### -------------------------------------------

library(stringr)

nchar("R Program")

substr("R Program", 3, 5)

paste("R", "Program")

paste("R", "Program", sep = ".")

paste0("R", "Program")

str_trim("   R Script  ")
