#Turn on the profiler in R.
Rprof()

#Calculate how much time is spent in which function.
Rprof(NULL)
summaryRprof()

#Shows the sequence of calls.
traceback()

#Debugs the error, once you know in which function the error occurred.
debug(evaluateFunc)

#Investigates the environment where the error occurred.
options(error = recover)
# Now, when an error occurs, you will be prompted to choose a frame to inspect.

evaluateFunc <- function() { # nolint
    myString <- "Good things come in threes" # nolint
    age <- c(28, 48, 47, 71, 22, 80, 48, 30, 31) # nolint

    mean(age)
    #The error is because of a typo in the function name. The correct function for calculating mean in R is mean(), not means(). # nolint

    #name_of_a_variable_that_doesnt_exist + 1 * pi^2  # nolint
    #This error occurs because the variable name_of_a_variable_that_doesnt_exist does not exist. # nolint
    name_of_a_variable_that_doesnt_exist <- 3 # nolint
    name_of_a_variable_that_doesnt_exist + 1 * pi^2

    #Evaluation error: zip file 'C:\Users\mans\Data\some_file.xlsx' cannot be opened. # nolint
    #This error could be due to the file not existing at the specified location, the file being corrupted, or R not having permission to access the file. # nolint
     
    #1+2(2+3) Error: attempt to apply non-function
    1 + 2 * (2 + 3)
}
