#Write in R a function that converts temperatures from Fahrenheit to Celsius.

convertFtoC <- function(temp_F) { # nolint
  temp_C <- (temp_F - 32) * 5/9 # nolint
  return(temp_C)
}

# Check if the function is working
p <- convertFtoC(32)
print(p)

# Example vector of temperatures in Fahrenheit
temps_F <- c(32, 212, 98.6) # nolint

# Convert the vector of temperatures to Celsius
temps_C <- convertFtoC(temps_F) # nolint

# Print the result
print(temps_C)