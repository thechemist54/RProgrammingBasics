#Create a for loop that outputs the arithmetic mean for each variable (column) of your data frame df – provided that the variable is numeric! #nolint

# Create a sample data frame
df <- data.frame(
  NumericColumn1 = c(1, 2, 3, 4, 5),
  NumericColumn2 = c(6, 7, 8, 9, 10),
  NumericColumnWithNA = c(1, NA, 3, NA, 5)
)

# Print the data frame
print(df)


for (col in colnames(df)) {
    # Check if the column is numeric
    if (is.numeric(df[[col]])) {
        # Calculate and print the mean of the column
        cat("Mean of", col, ":", mean(df[[col]], na.rm = TRUE), "\n")
    }
}
