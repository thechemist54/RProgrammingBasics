library(foreach)
library(doParallel)
library(MKinfer)

simulate_single <- function(n1, n2, distr, level = 0.05, alternative = "two.sided", ...) { # nolint
  # Generate data:
  x <- distr(n1, ...)
  y <- distr(n2, ...)

  # Compute p-values:
  p_t_test <- t.test(x, y, alternative = alternative)$p.value
  p_perm_t_test <- perm.t.test(x, y, alternative = alternative, R = 999)$perm.p.value # nolint
  p_wilcoxon <- wilcox.test(x, y, alternative = alternative)$p.value

  # Return the p-values
  return(c(p_t_test, p_perm_t_test, p_wilcoxon))
}

# Function to parallelize simulations
simulate_type_I_parallel <- function(n1, n2, distr, level = 0.05, B = 999, alternative = "two.sided", ...) { # nolint
  # Register parallel backend to use multiple cores
  registerDoParallel(cores = 4)

  # Run simulations in parallel
  results <- foreach(i = 1:B, .combine = rbind) %dopar% {
    simulate_single(n1, n2, distr, level, alternative, ...)
  }

  # Convert results to a data frame
  colnames(results) <- c("p_t_test", "p_perm_t_test", "p_wilcoxon")
  p_values <- as.data.frame(results)

  # Stop the parallel backend
  stopImplicitCluster()

  # Return the type I error rates
  return(colMeans(p_values < level))
}

library(parallel)

data(airquality)

# Using mclapply to run the operation in parallel with 4 workers
result <- mclapply(airquality, function(x) {
  # Check if x is numeric since mean and sd do not apply to factors or character vectors # nolint
  if(is.numeric(x)) {
    (x - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE)
  } else {
    x # Return as is if not numeric
  }
}, mc.cores = 4)

result_df <- as.data.frame(result)

# Print the result to check
print(result_df)