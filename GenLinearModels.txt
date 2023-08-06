### a. Form the scatter plot of y and x1. Then answer, does the normal GLM structure of constant variability in y seem appropriate? If not, how does it seem to be violated? #nolint

# Read the data (since the file contains headers)
houses_data <- read.table("Houses.dat", header = TRUE)

# View the first few rows of the data
head(houses_data)

# Create a scatter plot of price (y) vs taxes (x1)
plot(houses_data$taxes, houses_data$price, main = "Scatter Plot of Selling Price vs Tax Bill", #nolint
     xlab = "Tax Bill (in dollars)", ylab = "Selling Price (in thousands of dollars)") #nolint

#Answer: From the plot, we can observe that the variability in the selling price does not appear to be constant across different levels of the tax bill. There seems to be a pattern where the spread of the selling price increases as the tax bill increases. The funnel-shaped pattern is indicative of heteroscedasticity, which violates the assumption of constant variability in y. #nolint

# The normal GLM structure of constant variability in y does not seem appropriate for this data, as the assumption of homoscedasticity appears to be violated. #nolint

# Homoscedasticity (or homogeneity of variance) refers to the situation where the variability of the residuals (or errors) is constant across all levels of the explanatory variables. #nolint

### b. Using the identity link function, fit the 1. normal GLM 2.gamma GLM 3.For each model, interpret the effect of x2. #nolint

# Fitting a normal GLM with identity link function
normal_glm <- glm(price ~ taxes + new, family = gaussian(link = "identity"), data = houses_data) #nolint

# Summary of the normal GLM
summary(normal_glm)

## Holding the tax bill constant, new houses have a mean selling price that is approximately $86,200 higher than that of old houses. The effect is statistically significant at the 0.01 level. #nolint

# Fitting a gamma GLM with identity link function
gamma_glm <- glm(price ~ taxes + new, family = Gamma(link = "identity"), data = houses_data) #nolint

# Summary of the gamma GLM
summary(gamma_glm)

## Holding the tax bill constant, new houses have a mean selling price that is approximately $80,545 higher than that of old houses. The effect is statistically significant at the 0.05 level. #nolint

#Answer: In both models, the effect of x2(whether the house is new) is positive and statistically significant, indicating that new houses tend to sell at a higher price compared to old houses, controlling for the tax bill. #nolint

### c. For each model, describe how the estimated variability in selling prices varies as the mean selling price varies from 100 thousand to 500 thousand dollars. #nolint

# Given values for mean selling price
mean_values <- c(100, 500) # in thousands

# Dispersion parameter for normal GLM
dispersion_normal_glm <- 6212.741

# Dispersion parameter for gamma GLM
dispersion_gamma_glm <- 0.08731903

# Calculating the estimated variance for the normal GLM (constant across different means) #nolint
variances_normal_glm <- rep(dispersion_normal_glm, length(mean_values))

# $normal_glm_variances
#[1] 6212.741 6212.741

# Calculating the estimated variance for the gamma GLM (proportional to the square of the mean) #nolint
variances_gamma_glm <- dispersion_gamma_glm * (mean_values^2)

#$gamma_glm_variances
#[1]   873.1903 21829.7575

# Displaying the estimated variances
list(normal_glm_variances = variances_normal_glm, gamma_glm_variances = variances_gamma_glm) #nolint

#Answer: For the normal GLM: The estimated variance will be 6212.741 (in thousands squared) for both $100,000 and $500,000 mean selling prices. For the gamma GLM: The estimated variance will be 873.19 for $100,000 and 21,829.76 for $500,000 (in thousands squared). #nolint

### d. Which model is preferred according to AIC?

# Calculate the AIC for the normal GLM
aic_normal_glm <- AIC(normal_glm)

#[1] 1162.178

# Calculate the AIC for the gamma GLM
aic_gamma_glm <- AIC(gamma_glm)

#[1] 1106.705

# Display the AIC values
aic_normal_glm
aic_gamma_glm

#AIC for the normal GLM: 1162.178 AIC for the gamma GLM: 1106.705.

# The AIC is a measure used to compare different statistical models. It takes into account both the goodness of fit and the complexity of the model. A lower AIC value indicates a better model fit, considering the trade-off between fit and complexity. #nolint

#Answer: Based on the AIC values, the gamma GLM has a lower AIC value, indicating that it is the preferred model #nolint
