library(dplyr)
library(magrittr)  # For the pipe operator

age <- c(28, 48, 47, 71, 22, 80, 48, 30, 31)
purchase <- c(20, 59, 2, 12, 22, 160, 34, 34, 29)
visit_length <- c(5, 2, 20, 22, 12, 31, 9, 10, 11)

#1. add a new variable rev_per_minute using a pipe (below is how it is done without pipe so it has to be replaced)  # nolint
# Based on existing variables
bookstore <- data.frame(age, purchase, visit_length) %>%
  dplyr::mutate(rev_per_minute = purchase / age)

# sqrt(mean(x)) # nolint
x <- 1:8
sqrt_mean_x <- x %>%
  mean() %>%
  sqrt()

#assign("x", 25) # nolint
25 %>%
  (function(value) assign("x", value, envir = globalenv()))

#sort(x^2+5)[1:2] # nolint
x <- 1:8
sorted_values <- x %>%
  { .^2 + 5 } %>% # nolint
  sort() %>%
  .[1:2]
