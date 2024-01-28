#####View the documentation for the diamonds data and read about different variables. Check the data structures and answer: #nolint


### How many observations and variables are there and what type of variables (numeric, categorical, etc.) are there? #nolint

library(ggplot2)

data(diamonds)

head(diamonds)

summary(diamonds)

# Structure of the dataset
str(diamonds)

# Dimensions of the dataset
dim(diamonds)

# Number of Observations and Variables:

# The dataset contains 53,940 observations (rows).
# There are 10 variables (columns) in the dataset.

# Types of Variables:

# carat: Numeric (num). Represents the weight of the diamond.
# cut: Ordered factor (Ord.factor). Represents the quality of the cut of the diamond, with levels like Fair, Good, etc. #nolint
# color: Ordered factor (Ord.factor). Represents the color of the diamond, with levels from D (best) to J (worst). #nolint
# clarity: Ordered factor (Ord.factor). Indicates the clarity of the diamond, with levels like I1, SI2, SI1, etc. #nolint
# depth: Numeric (num). The height of a diamond, as a percentage of the girdle diameter. #nolint
# table: Numeric (num). The width of the diamond's table expressed as a percentage of its average diameter. #nolint
# price: Integer (int). The price of the diamond in US dollars.
# x: Numeric (num). Length of the diamond in mm.
# y: Numeric (num). Width of the diamond in mm.
# z: Numeric (num). Depth of the diamond in mm.

### Compute summary statistics (means, median, min, max, counts for categorical variables). #nolint

# Summary statistics for numeric variables
summary_numeric <- summary(diamonds[sapply(diamonds, is.numeric)])

summary_numeric

#     carat            depth           table           price      #nolint
# Min.   :0.2000   Min.   :43.00   Min.   :43.00   Min.   :  326  #nolint
# 1st Qu.:0.4000   1st Qu.:61.00   1st Qu.:56.00   1st Qu.:  950  #no lint
# Median :0.7000   Median :61.80   Median :57.00   Median : 2401  #nolint
# Mean   :0.7979   Mean   :61.75   Mean   :57.46   Mean   : 3933  #nolint
# 3rd Qu.:1.0400   3rd Qu.:62.50   3rd Qu.:59.00   3rd Qu.: 5324  #nolint
# Max.   :5.0100   Max.   :79.00   Max.   :95.00   Max.   :18823  #nolint
#       x                y                z         #nolint
# Min.   : 0.000   Min.   : 0.000   Min.   : 0.000  #nolint
# 1st Qu.: 4.710   1st Qu.: 4.720   1st Qu.: 2.910  #nolint
# Median : 5.700   Median : 5.710   Median : 3.530  #nolint
# Mean   : 5.731   Mean   : 5.735   Mean   : 3.539  #nolint
# 3rd Qu.: 6.540   3rd Qu.: 6.540   3rd Qu.: 4.040  #nolint
# Max.   :10.740   Max.   :58.900   Max.   :31.800 #nolint

# Counts for categorical variables
counts_categorical <- sapply(diamonds[sapply(diamonds, is.factor)], table)

counts_categorical

# $cut

#      Fair      Good Very Good   Premium     Ideal #nolint
#      1610      4906     12082     13791     21551 #nolint

# $color

#     D     E     F     G     H     I     J #nolint
#  6775  9797  9542 11292  8304  5422  2808 #nolint

# $clarity

#    I1   SI2   SI1   VS2   VS1  VVS2  VVS1    IF #nolint
#   741  9194 13065 12258  8171  5066  3655  1790 #nolint


### Are there any missing values? #nolint

# Count of missing values for each column
missing_values <- sapply(diamonds, function(x) sum(is.na(x)))

missing_values

# carat     cut   color clarity   depth   table   price       x       y       z  #nolint
#       0       0       0       0       0       0       0       0       0       0 #nolint

#No there are no missing values


##### Create a scatterplot with total sleeping time along the x-axis and time awake along the y-axis (using the msleep data).  #nolint

### What pattern do you see? #nolint

ggplot(data = msleep, aes(x = sleep_total, y = awake)) +
  geom_point() +
  labs(x = "Total Sleeping Time (hours)", y = "Time Awake (hours)",  #nolint
       title = "Scatterplot of Total Sleeping Time vs Time Awake")

# The points form a pattern that descends from the top left to the bottom right, which suggests that as the total sleeping time increases, the time awake decreases. #nolint

# This pattern indicates that there is an inverse relationship between the amount of time an animal sleeps and the amount of time it remains awake within a given time frame, typically a 24-hour period. The plot follows a near-perfect negative diagonal line because the sum of total sleep time and time awake for an animal must equal the total time available in a day. Therefore, if an animal sleeps more, it has less time to be awake, and vice versa. #nolint

### Explain the pattern(s). #nolint

# The pattern is what one would expect from any species with a relatively fixed cycle of sleep and wakefulness within a 24-hour day. The variation around the line represent differences in how species allocate time to sleep and wakefulness, potentially due to evolutionary, environmental, or physiological factors. #nolint

### Explain the correlation between total sleeping time and time awake. #nolint

cor(msleep$sleep_total, msleep$awake)

# The correlation coefficient of approximately -1 (or -0.9999986 to be precise) indicates an almost perfect negative linear relationship between total sleeping time and time awake. In the context of the msleep dataset, this means that for almost every mammal in the dataset, an increase in the total amount of time spent sleeping is associated with an almost exactly proportional decrease in the amount of time spent awake, and vice versa. #nolint

# If a mammal spends more time sleeping, it must correspondingly spend less time awake. The correlation is so close to -1, which suggests there is very little variability around this relationship, and it can be predicted with near certainty that knowing the total sleeping time of a mammal gives you the total awake time, and the reverse is also true. #nolint