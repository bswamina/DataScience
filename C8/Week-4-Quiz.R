
### 1. Load the vowel.train and vowel.test data sets:

library(ElemStatLearn)
data(vowel.train)
data(vowel.test)

### Set the variable y to be a factor variable in both the training and
### test set. Then set the seed to 33833. Fit (1) a random forest predictor
### relating the factor variable y to the remaining variables and (2) a
### boosted predictor using the "gbm" method. Fit these both with the
### train() command in the caret package
###
### What are the accuracies for the two approaches on the test data set?
### What is the accuracy among the test set samples where the two methods
### agree

vowel.train$y <- as.factor(vowel.train$y)
vowel.test$y <- as.factor(vowel.test$y)
set.seed(33833)

library(caret)

rf.out <- capture.output(
    rf.model <- train(y ~ ., method='rf', data=vowel.train)
)
gbm.out <- capture.output(
    gbm.model <- train(y ~ ., method='gbm', data=vowel.train)
)
rm(list=c('rf.out', 'gbm.out'))
rf.predict <- predict(rf.model, vowel.test)
gbm.predict <- predict(gbm.model, vowel.test)
confusionMatrix(rf.predict, vowel.test$y)$overall[1]
confusionMatrix(gbm.predict, vowel.test$y)$overall[1]
agreed.index <- rf.predict == gbm.predict
confusionMatrix(rf.predict[agreed.index], vowel.test$y[agreed.index])$overall[1]

### RF Accuracy = 0.6082, GBM Accuracy = 0.5152, Agreement Accuracy = 0.6361

### 2. Load the Alzheimer's data using the following commands:

library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p=3/4)[[1]]
training = adData[inTrain,]
testing = adData[-inTrain,]

### Set the seed to 62433 and predict diagnosis with all the other variables
### using a random forest ("rf"), boosted trees ("gbm") and linear discriminant
### analysis ("lda") model. Stack the predictions together using random forests
### ("rf"). What is the resulting accuracy on the test set? Is it better or
### worse than each of the individual predictions

set.seed(62433)
rf.out <- capture.output(
    rf.model <- train(diagnosis ~ ., method='rf', data=training)
)
gbm.out <- capture.output(
    gbm.model <- train(diagnosis ~ ., method='gbm', data=training)
)
lda.out <- capture.output(
    lda.model <- train(diagnosis ~ ., method='lda', data=training)
)
rm(list=c('rf.out', 'gbm.out', 'lda.out'))
rf.predict <- predict(rf.model, testing)
gbm.predict <- predict(gbm.model, testing)
lda.predict <- predict(lda.model, testing)
combined.data <- data.frame(diagnosis=testing$diagnosis,
                            rf.predict,
                            gbm.predict,
                            lda.predict)
combined.out <- capture.output(
    combined.model <- train(diagnosis ~ ., method='rf', data=combined.data)
)
rm(list=c('combined.out'))
combined.predict <- predict(combined.model, testing)
confusionMatrix(rf.predict, testing$diagnosis)$overall[1]
confusionMatrix(gbm.predict, testing$diagnosis)$overall[1]
confusionMatrix(lda.predict, testing$diagnosis)$overall[1]
confusionMatrix(combined.predict, testing$diagnosis)$overall[1]

### Stacked Accuracy: 0.80 is better than random forests and lda and the same as boosting

### 3. Load the concrete data with the commands:

set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p=3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

### Set the seed to 233 and fit a lasso model to predict Compressive Strength.
### Which variable is the last coefficient to be set to zero as the penalty
### increases? (Hint: it may be useful to look up ?plot.enet)

set.seed(233)
mod_lasso <- train(CompressiveStrength ~ ., method='lasso', data=training)
library(elasticnet)
plot.enet(mod_lasso$finalModel, xvar='penalty', use.color=TRUE)

### Cement

### 4. Load the data on the number of visitors to the instructors blog from here:
###
### https://d396qusza40orc.cloudfront.net/predmachlearn/gaData.csv
###
### Using the commands:
    
library(lubridate) # For year() function below
dat = read.csv("~/Downloads/DATA/gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)

### Fit a model using the bats() function in the forecast package to the
### training time series. Then forecast this model for the remaining time
### points. For how many of the testing points is the true value within the
### 95% prediction interval bounds

library(forecast)
ts.model <- bats(tstrain)
fcast <- forecast(ts.model, level=95, h=dim(testing)[1])
sum(fcast$lower < testing$visitsTumblr & testing$visitsTumblr < fcast$upper) / 
    dim(testing)[1]

### 96%

### 5. Load the concrete data with the commands:

set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

### Set the seed to 325 and fit a support vector machine using the e1071
### package to predict Compressive Strength using the default settings.
### Predict on the testing set. What is the RMSE

set.seed(325)
library(e1071)
svm.model <- svm(CompressiveStrength ~ ., data=training)
svm.predict <- predict(svm.model, testing)
accuracy(svm.predict, testing$CompressiveStrength)

### 6.72
