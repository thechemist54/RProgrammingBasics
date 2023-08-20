# Generate '+' class
x_plus <- rnorm(1000, mean = 2, sd = 2.5)
y_plus <- rnorm(1000, mean = 2, sd = 2.5)

# Generate 'o' class
x_o <- rnorm(1000, mean = 0, sd = 1)
y_o <- rnorm(1000, mean = 0, sd = 1)

# Plot the data
plot(x_plus, y_plus, pch = "+")
points(x_o, y_o, pch = "o")

# Set the seed for reproducibility
set.seed(42)

# Generate '+' class using uniform distribution
x_plus <- runif(1000, min = -3, max = 3)
y_plus <- x_plus + runif(1000, min = -1, max = 1) #nolint # Adjust according to the relationship seen in the plot

# Generate 'o' class using uniform distribution
x_o <- runif(100, min = -2, max = 2)
y_o <- runif(100, min = -2, max = 2) # nolint Adjust the range to center around a specific point

# Plot the data
plot(x_plus, y_plus, xlim=c(-4, 4), ylim=c(-4, 4), pch='+', xlab='X', ylab='Y', main='Recreated Plot') #nolint
points(x_o, y_o, pch='o') #nolint