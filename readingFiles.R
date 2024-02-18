library(readr)

# Import the text file with values separated by a single space, and specify that missing values are represented by a period # nolint
data <- read_delim("single_delimited.txt", delim = " ", na = ".", col_names = TRUE) # nolint
print(data)