Business Intelligence Lab 5 Submission Markdown
================
Dynamite
Today

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
- [Loading the Pima Indians Diabetes
  dataset](#loading-the-pima-indians-diabetes-dataset)
  - [Split the dataset into training and testing
    sets](#split-the-dataset-into-training-and-testing-sets)
  - [Resampling using k-fold
    Cross-Validation](#resampling-using-k-fold-cross-validation)
  - [Resampling using Bootstrap](#resampling-using-bootstrap)
  - [Resampling using repeated k-fold
    Cross-Validation](#resampling-using-repeated-k-fold-cross-validation)
  - [Resampling using SMOTE (Synthetic Minority Over-sampling
    Technique)](#resampling-using-smote-synthetic-minority-over-sampling-technique)
  - [You can now access the performance metrics and compare the
    resampling
    methods](#you-can-now-access-the-performance-metrics-and-compare-the-resampling-methods)

# Student Details

|                                                   |                                                                                                                                                                                       |          |
|---------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| **Student ID Numbers and Names of Group Members** | \| 1. 120313 - C - Otieno Daniel Obala \| 2. 136804 - C - Joy Cheptoo \| \| 3. 136017 - C - Unika Mureithi \| \| 4. 133598 - C - Shirlene Ouma \| \| 5. 135864 - C - Winnie Githua \| |          |
|                                                   | **GitHub Classroom Group Name**                                                                                                                                                       | Dynamite |
| **Course Code**                                   | BBT4206                                                                                                                                                                               |          |
| **Course Name**                                   | Business Intelligence II                                                                                                                                                              |          |
| **Program**                                       | Bachelor of Business Information Technology                                                                                                                                           |          |
| **Semester Duration**                             | 21<sup>st</sup> August 2023 to 28<sup>th</sup> November 2023                                                                                                                          |          |

# Setup Chunk

We start by installing all the required packages

`{library(mlbench)}`

`library(caret)`

------------------------------------------------------------------------

Load

`{data(PimaIndiansDiabetes)} dataset <- PimaIndiansDiabetes`

------------------------------------------------------------------------

**Note:** the following “*R Markdown*” options have been set as the
defaults in this markdown:

> output:  
>   
> github_document:  
> toc: yes  
> toc_depth: 4  
> fig_width: 6  
> fig_height: 4  
> df_print: default  
>   
> editor_options:  
> chunk_output_type: console

# Loading the Pima Indians Diabetes dataset

``` r
#data(PimaIndiansDiabetes)
#dataset <- PimaIndiansDiabetes
```

## Split the dataset into training and testing sets

We then display the number of observations and number of variables. We
have 101 observations and 100 variables to work with.

``` split
set.seed(123)  # For reproducibility
trainIndex <- createDataPartition(dataset$diabetes, p = 0.7, list = FALSE)
training_data <- dataset[trainIndex, ]
testing_data <- dataset[-trainIndex, ]
```

## Resampling using k-fold Cross-Validation

`{set.seed(123)} ctrl <- trainControl(method = "cv", number = 10) model_cv <- train(diabetes ~ ., data = training_data, method = "glm", trControl = ctrl) results_cv <- resamples(list(CV = model_cv))`

## Resampling using Bootstrap

We then display the number of observations and number of variables. We
have 101 observations and 100 variables to work with.

``` resampling
```

## Resampling using repeated k-fold Cross-Validation

We then display the number of observations and number of variables. We
have 101 observations and 100 variables to work with.

`{set.seed(123)} ctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3) model_rep_cv <- train(diabetes ~ ., data = training_data, method = "glm", trControl = ctrl) results_rep_cv <- resamples(list(RepCV = model_rep_cv))`

## Resampling using SMOTE (Synthetic Minority Over-sampling Technique)

We then display the number of observations and number of variables. We
have 101 observations and 100 variables to work with.

`{set.seed(123)} ctrl <- trainControl(method = "cv", number = 10, classProbs = TRUE, summaryFunction = twoClassSummary) model_smote <- train(diabetes ~ ., data = training_data, method = "glm", trControl = ctrl, preProc = c("center", "scale", "smote")) results_smote <- resamples(list(SMOTE = model_smote))`

## You can now access the performance metrics and compare the resampling methods

``` basically

summary(results_cv)
summary(results_boot)
summary(results_loocv)
summary(results_rep_cv)
summary(results_smote)
```
