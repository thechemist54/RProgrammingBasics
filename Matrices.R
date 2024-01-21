#Create a matrix named m1 with three rows and five columns and all the numeric (integer) values from 6 to 20! #nolint

m1 <- matrix(6:20, nrow = 3, ncol = 5, byrow = TRUE)

#Multiply all elements in m1 by 0.5! Overwrite the matrix m1 with the result!

m1 <- m1 * 0.5

#Create another matrix m2 with one row and five columns and all the numeric (integer) values from 1 to 5! #nolint

m2 <- matrix(1:5, nrow = 1, ncol = 5)

#Calculate the sum of all elements in m2!

sum_m2 <- sum(m2)

#Combine m1 and m2 with rbing(). Save the result as m3 and check the dimension of the new matrix! #nolint

m3 <- rbind(m1, m2)
dim_m3 <- dim(m3)

#Index the 5th column of m3!

column_5_m3 <- m3[, 5]

#Index the 2nd and 4th lines of m3!

lines_2_4_m3 <- m3[c(2, 4), ]

#Calculate the sums for all columns in m3!

column_sums_m3 <- colSums(m3)

#Calculate the standard deviation for the 3rd column in m3!

sd_col3_m3 <- sd(m3[, 3])

#From m3, index the element in the 2nd column and 2nd line and all eight adjacent elements! Save the result as m4 and examine its object class! #nolint

m4 <- m3[(2 - 1):(2 + 1), (2 - 1):(2 + 1)]
class_m4 <- class(m4)
