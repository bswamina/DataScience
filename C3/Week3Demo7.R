library(dplyr)
library(tidyr)

### --------------------------------------------------------------------

### Messy Data - 1 :: Column names represent values

### The following dataset called students that demonstrates this scenario.
### The column names male and female should have been values. This dataset
### should have had three variables: grade, sex, and count.

set.seed(1234)
students <- data.frame(
    grade = LETTERS[1:5],
    male = sample(0:8, 5, replace = TRUE),
    female = sample(0:8, 5, replace = TRUE)
)
print(students)

### To tidy the students dataset, we need to have one column for each of
### the three variables (grade, sex, and count). We will use the gather()
### function from tidyr to fix this

students_tidy <- gather(students, sex, count, -grade)
print(students_tidy)

### Each row of the students_tidy dataset now represents exactly one
### observation. Each of our variables (grade, sex, and count) occupies
### exactly one column. This is tidy data !!!

### --------------------------------------------------------------------

### Messy Data - 2 :: Multiple variables are stored in one column

### The following dataset called students2 that demonstrates this scenario.
### The column names male_1, male_2, female_1 and female_2 should have been
### values male and female. In addition, these column names represent multiple
### variables - sex and class fused into one (male_1, female_1, etc). This
### dataset should have had four variables: grade, sex, class, and count

set.seed(1211)
students2 <- data.frame(
    grade = LETTERS[1:5],
    male_1 = sample(0:8, 5, replace = TRUE),
    female_1 = sample(0:8, 5, replace = TRUE),
    male_2 = sample(0:8, 5, replace = TRUE),
    female_2 = sample(0:8, 5, replace = TRUE)
)
print(students2)

### We will tidy the students2 dataset in a two step process
### We will use the gather() function from tidyr for step 1 to collect the
### columns names male_1, female_1, male_2, and female_2 as values of a new
### column sex_class

step1 <- gather(students2, sex_class, count, -grade)

### We will use the separate() function from tidyr on the step1 dataset to break
### the sex_class column into two separate columns sex and class

students2_tidy <- separate(step1, sex_class, c('sex', 'class'), sep = "_")

### We can use the pipeline %>% capability in dplyr to tidy students2 in a much
### cleaner and simpler way

students2_tidy <- students2 %>% 
    gather(sex_class, count, -grade) %>% 
    separate(sex_class, c('sex', 'class'))

### --------------------------------------------------------------------

### Messy Data - 3 :: Variables are stored in both rows and columns.

### The following dataset called students3 that demonstrates this scenario.
### In students3 dataset, we have midterm and final exam grades for about five
### students, each of whom are enrolled in exactly two of five possible classes

students3 <- read.csv("~/Downloads/students3.csv", na.strings = "", stringsAsFactors = FALSE)

### Tidying the students3 dataset is a multi-step process:
### 1. We will use the gather() function to collect column names class1 through
###    class5 as values of a new column called class
### 2. We will use the spread() function to map the values of the column test to
###    new columns
### 3. We will use the mutate() function to extract the numeric value of the class
###    values. For example, class1 should become 1, class2 become 2 and so on

students3_tidy <- students3 %>% 
    gather(class, grade, class1:class5, na.rm = T) %>%
    spread(test, grade) %>%
    mutate(class = extract_numeric(class))

### --------------------------------------------------------------------

### Messy Data - 4 :: Multiple observational units are stored in the same table.

### The following dataset called students4 that demonstrates this scenario. In this
### dataset each id, name, and sex is repeated twice

students4 <- read.csv("~/Downloads/students4.csv", na.strings = "", stringsAsFactors = FALSE)

### To tidy the students4 dataset, we need to break it into two separate tables:
### 1. student_info dataset containing (id, name, and sex)
### 2. student_grade dataset containing (id, class, midterm, final)

student_info <- students4 %>%
    select(id, name, sex) %>%
    unique()

student_grade <- students4 %>%
    select(id, class, midterm, final)

### --------------------------------------------------------------------
