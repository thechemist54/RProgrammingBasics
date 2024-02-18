#1

x <- c(8, 5, 9, NA)
for (i in seq_along(x)) {
    if (!is.na(x[i]) && x[i] == 5) {
        cat(i, "\n")
    }
}

# The issue is due to the use of the assignment operator = instead of the equality operator == inside the if statement.  # nolint

#2

printmessage <- function(x) {
    if (is.na(x)) {
        print("x is NA")
    } else if (x > 0) {
        print("x is greater than zero")
    } else {
        print("x is less than or equal to zero")
    }
    invisible(x)
}

# The issue arises because the function printmessage does not handle NA values properly. The if statement expects a logical TRUE or FALSE, but an NA value is neither, resulting in an error.  # nolint
