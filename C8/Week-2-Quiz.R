
### Week 2 Quiz

# 1. Load the Alzheimer's disease data using the commands:

library(AppliedPredictiveModeling)
data(AlzheimerDisease)

### Which of the following commands will create non-overlapping
### training and test sets with about 50% of the observations
### assigned to each

adData = data.frame(diagnosis, predictors)
trainIndex = createDataPartition(diagnosis, p=0.50, list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

### 2. Load the cement data using the commands:

library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p=3/4)[[1]]
training = mixtures[inTrain,]
testing = mixtures[-inTrain,]

### Make a plot of the outcome (CompressiveStrength) versus the
### index of the samples. Color by each of the variables in the
### data set (you may find the cut2() function in the Hmisc
### package useful for turning continuous covariates into factors).
### What do you notice in these plots

library(ggplot2)
library(Hmisc)
names(training)
index <- seq(1, nrow(training))
age <- cut2(training$Age, g=5)
ggplot(training, aes(index, CompressiveStrength, col=age)) + geom_point()
fineagg <- cut2(training$FineAggregate, g=5)
ggplot(training, aes(index, CompressiveStrength, col=fineagg)) + geom_point()
coarseagg <- cut2(training$CoarseAggregate, g=5)
ggplot(training, aes(index, CompressiveStrength, col=coarseagg)) + geom_point()
super <- cut2(training$Superplasticizer, g=5)
ggplot(training, aes(index, CompressiveStrength, col=super)) + geom_point()
water <- cut2(training$Water, g=5)
ggplot(training, aes(index, CompressiveStrength, col=water)) + geom_point()
flyash <- cut2(training$FlyAsh, g=5)
ggplot(training, aes(index, CompressiveStrength, col=flyash)) + geom_point()
blast <- cut2(training$BlastFurnaceSlag, g=5)
ggplot(training, aes(index, CompressiveStrength, col=blast)) + geom_point()
cement <- cut2(training$Cement, g=5)
ggplot(training, aes(index, CompressiveStrength, col=cement)) + geom_point()

### There is a non-random pattern in the plot of the outcome versus index
### that does not appear to be perfectly explained by any predictor
### suggesting a variable may be missing

### 3. Load the cement data using the commands:

library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p=3/4)[[1]]
training = mixtures[inTrain,]
testing = mixtures[-inTrain,]

### Make a histogram and confirm the SuperPlasticizer variable is skewed.
### Normally you might use the log transform to try to make the data more
### symmetric. Why would that be a poor choice for this variable

hist(training$Superplasticizer)
hist(log10(training$Superplasticizer+1))

### There are values of zero so when you take the log() transform those
### values will be -Inf

### There are a large number of values that are the same and even if you
### took the log(SuperPlasticizer + 1) they would still all be identical
### so the distribution would not be symmetric

### 4. Load the Alzheimer's disease data using the commands:

library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p=3/4)[[1]]
training = adData[inTrain,]
testing = adData[-inTrain,]

### Find all the predictor variables in the training set that begin with
### IL. Perform principal components on these variables with the
### preProcess() function from the caret package. Calculate the number
### of principal components needed to capture 90% of the variance. How
### many are there

ad.names <- names(training)
il.names <- ad.names[startsWith(ad.names, 'IL')]
pre.proc <- preProcess(training[, il.names], method='pca', thresh=0.9)
pre.proc

### 7 for 80%, 9 for 90%

### 5. Load the Alzheimer's disease data using the commands:

library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis, predictors)
inTrain = createDataPartition(adData$diagnosis, p=3/4)[[1]]
training = adData[inTrain,]
testing = adData[-inTrain,]

### Create a training data set consisting of only the predictors with
### variable names beginning with IL and the diagnosis. Build two
### predictive models, one using the predictors as they are and one
### using PCA with principal components explaining 80% of the variance
### in the predictors. Use method="glm" in the train function. What is
## the accuracy of each method in the test set? Which is more accurate

ad.names <- names(training)
il.names <- ad.names[startsWith(ad.names, 'IL')]
il.training.1 <- training[,il.names]
il.training.2 <- training[,c(il.names, 'diagnosis')]
il.testing.1 <- testing[,il.names]
il.testing.2 <- testing[,c(il.names, 'diagnosis')]

model1 <- train(diagnosis ~ ., data=il.training.2, method='glm')
pred1 <- predict(model1, il.testing.2)
confusionMatrix(il.testing.2$diagnosis, pred1)

pre.proc <- preProcess(il.training.1, method='pca', thresh=0.8)
pca.training <- predict(pre.proc, il.training.1)
pca.testing <- predict(pre.proc, il.testing.1)
model2 <- train(il.training.2$diagnosis ~ ., method='glm', data=pca.training)
pred2 <- predict(model2, pca.testing)
confusionMatrix(il.testing.2$diagnosis, pred2)

### Non-PCA Accuracy: 0.65, PCA Accuracy: 0.72
