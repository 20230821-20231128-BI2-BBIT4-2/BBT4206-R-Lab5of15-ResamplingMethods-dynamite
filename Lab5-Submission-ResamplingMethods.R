# Load the required packages
library(mlbench)
library(caret)

# Load the Pima Indians Diabetes dataset
data(PimaIndiansDiabetes)
dataset <- PimaIndiansDiabetes

# Split the dataset into training and testing sets
set.seed(123)  # For reproducibility
trainIndex <- createDataPartition(dataset$diabetes, p = 0.7, list = FALSE)
training_data <- dataset[trainIndex, ]
testing_data <- dataset[-trainIndex, ]

# Resampling using k-fold Cross-Validation
set.seed(123)
ctrl <- trainControl(method = "cv", number = 10)
model_cv <- train(diabetes ~ ., data = training_data, method = "glm", trControl = ctrl)
results_cv <- resamples(list(CV = model_cv))

# Resampling using Bootstrap
set.seed(123)
ctrl <- trainControl(method = "boot", number = 100)
model_boot <- train(diabetes ~ ., data = training_data, method = "glm", trControl = ctrl)
results_boot <- resamples(list(Boot = model_boot))

# Resampling using Leave-One-Out Cross-Validation (LOOCV)
set.seed(123)
ctrl <- trainControl(method = "LOOCV")
model_loocv <- train(diabetes ~ ., data = training_data, method = "glm", trControl = ctrl)
results_loocv <- resamples(list(LOOCV = model_loocv))

# Resampling using repeated k-fold Cross-Validation
set.seed(123)
ctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
model_rep_cv <- train(diabetes ~ ., data = training_data, method = "glm", trControl = ctrl)
results_rep_cv <- resamples(list(RepCV = model_rep_cv))

# Resampling using SMOTE (Synthetic Minority Over-sampling Technique)
set.seed(123)
ctrl <- trainControl(method = "cv", number = 10, classProbs = TRUE, summaryFunction = twoClassSummary)
model_smote <- train(diabetes ~ ., data = training_data, method = "glm", trControl = ctrl, preProc = c("center", "scale", "smote"))
results_smote <- resamples(list(SMOTE = model_smote))

# You can now access the performance metrics and compare the resampling methods
summary(results_cv)
summary(results_boot)
summary(results_loocv)
summary(results_rep_cv)
summary(results_smote)
