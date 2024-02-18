set.seed(123)  # Ensure reproducibility
rnorm(5, mean = 0, sd = 1)
dnorm(0, mean = 0, sd = 1)
pnorm(0, mean = 0, sd = 1)
set.seed(123)  # Ensure reproducibility
rpois(5, lambda = 3)

set.seed(123)  # Ensure reproducibility
norm_data1 <- rnorm(100, mean = 0, sd = 1)
hist(norm_data1)

set.seed(123)
norm_data2 <- rnorm(100, mean = 20, sd = 2)
hist(norm_data2)

set.seed(123)
uniform_draws <- runif(10, min = 100, max = 10000)
print(uniform_draws)

set.seed(123)
perm_sample <- sample(1:200)
print(head(perm_sample, 10))
#print(perm_sample) # nolint

set.seed(123)
sample_rep <- sample(10:100, size = 100, replace = TRUE)
print(sample_rep)

mean_waiting_time <- 15  # Average waiting time is 15 minutes
sd_waiting_time <- 5     # Standard deviation is 5 minutes

# Probability of waiting less than 10 minutes
probability_less_than_10 <- pnorm(10, mean = mean_waiting_time, sd = sd_waiting_time) # nolint
print(probability_less_than_10)

# Set the seed for reproducibility
set.seed(123)

# Generate 200 random samples from a binomial distribution
binom_samples <- rbinom(200, size = 10, prob = 0.7)

# Create a histogram of the generated samples
hist(binom_samples, main = "Histogram of Binomial Distribution Samples",
     xlab = "Number of Successes", ylab = "Frequency",
     col = "blue", breaks = 10)

# Adding additional information for interpretation
abline(v = mean(binom_samples), col = "red", lwd = 2)
legend("topright", legend = c("Mean"), col = c("red"), lwd = 2)
