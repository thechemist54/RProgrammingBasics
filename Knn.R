# Import data about white and red wines:
white <- read.csv("white.csv", sep = ";")
red <- read.csv("red.csv", sep = ";")

# Add a type variable:
white$type <- "white"
red$type <- "red"

# Merge the datasets:
wine <- rbind(white, red)
wine$type <- factor(wine$type)

#install.packages("caret", dependencies = TRUE) #nolint

library(caret)

tc <- trainControl(method = "cv",
                   number = 10,
                   repeats = 100,
                   summaryFunction = twoClassSummary,
                   savePredictions = TRUE,
                   classProbs = TRUE)

m <- train(type ~ pH + alcohol + fixed.acidity + residual.sugar,
           data = wine,
           trControl = tc,
           method = "knn",
           metric = "ROC",
           tuneLength = 15,
           preProcess = c("center", "scale"))

# to visualize results you need the following
# install.packages("MLeval", dependencies = TRUE) #nolint

library(MLeval)

plots <- evalm(m,
               gnames = "kNN")

plots$roc

plots$optres[[1]][13, ]

plots$cc