data = read.csv('data.csv')

# Taking care of missing value
data$Age <- ifelse(is.na(data$Age), 
                   ave(data$Age, FUN = function(x) mean(x, na.rm =TRUE)), 
                   data$Age)
data$Salary <- ifelse(is.na(data$Salary), 
                      ave(data$Salary, FUN = function(x) mean(x, na.rm=TRUE)), 
                      data$Salary)

# Encoding categorical data
data$Country <- factor(data$Country, levels = c('France', 'Spain', 'Germany'), 
                       labels = c(1,2,3))
data$Purchased <- factor(data$Purchased, levels = c('No', 'Yes'), 
                         labels = c(0, 1))

# Splitting data to training and testing set 
library(caTools)
set.seed(2017)
split <- sample.split(data$Purchased, SplitRatio = 0.8)
training_set <- subset(data, split==TRUE)
testing_set <- subset(data, split==FALSE)

# Feature scaling
training_set[, 2:3] <- scale(training_set[, 2:3])
testing_set[, 2:3] <- scale(testing_set[, 2:3])

