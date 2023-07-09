##1. The student directory for a large university has 400 pages with 130 names per page, a total of 52,000 names. Using software, show how to select a simple random sample of 10 names. 

# Set the seed for reproducibility which ensures that we get the same random sample each time code is run
set.seed(123)
# Generate a sequence of all the names in the directory
all_names <- paste0("TestName", 1:(400 * 130))
# Select a simple random sample of 10 names
sample_names <- sample(all_names, 10)
# Print the selected names
print(sample_names)

##2. From the Murder data file, use the variable murder, which is the murder rate (per 100,000 population) for each state in the U.S. in 2017 according to the FBI Uniform Crime Reports. At first, do not use the observation for D.C. (DC). Using software:

file_path <- "Murder.dat"

data <- read.table(file_path, header = TRUE)

#a. Find the mean and standard deviation and interpret their values.

# Exclude the observation for D.C. from the dataframe
data_without_dc <- data[data$state != "DC", ]


# Calculate the mean
mean_murder <- mean(data_without_dc$murder)

# Calculate the standard deviation
sd_murder <- sd(data_without_dc$murder)

# Print the mean and standard deviation
print(mean_murder)
#The mean murder rate is approximately 4.874 which represents the average murder rate accross all the states. In this case, the mean murder rate is 4.874 per 100,000 population indicating the average murder rate accross the states.
print(sd_murder)
#The standard deviation measures the dispersion or variability of the murder rates from the mean. In this case, the murder rate varies by 2.586 around the mean. A larger standard deviation indicates a higher degree of variability in the murder rates among the states.

#b. Find the five-number summary and construct the corresponding boxplot

# Calculate the five-number summary
summary_murder <- summary(data_without_dc$murder)

# Print the five-number summary
print(summary_murder)

# Construct the boxplot
boxplot(data_without_dc$murder, main = "Murder Rates (Excluding D.C.)", ylab = "Murder Rate (per 100,000 population)")
#The five-number summary consists of the minimum, lower quartile (Q1), median (Q2), upper quartile (Q3), and maximum values. The boxplot visually represents these summary statistics. The resulting boxplot will provide a visual representation of the distribution of murder rates across the states.

#c. Including the observation for D.C. affects the mean more than the median due to the presence of an outlier.

# Calculate the updated mean and median
mean_murder_updated <- mean(data$murder)
median_murder_updated <- median(data$murder)

# Print the updated mean and median
print(mean_murder_updated)
print(median_murder_updated)

#After including the D.C. the mean is more influenced by this outlier, while the median remains relatively unaffected. This demonstrates that the median is a more robust measure of central tendency in the presence of outliers, while the mean is sensitive to extreme values.

##3. The Houses data file lists the selling price (thousands of dollars), size (square feet), tax bill (dollars), number of bathrooms, number of bedrooms, and whether the house is new (1 = yes,0 = no) for 100 home sales in Gainesville, Florida. Let’s analyze the selling prices

file_path1 <- "Houses.dat"

houseData <- read.table(file_path1, header = TRUE)

selling_prices <- houseData$price

# a. Construct a frequency distribution and a histogram.

# Create a frequency distribution
freq_dist <- table(selling_prices)

# Print the frequency distribution
print(freq_dist)

# Construct a histogram
hist(selling_prices, main = "Selling Prices", xlab = "Price (thousands of dollars)", ylab = "Frequency")

# b. Find the percentage of observations that fall within one standard deviation of the mean.

# Calculate the mean and standard deviation
mean_price <- mean(selling_prices)
sd_price <- sd(selling_prices)

# Calculate the range within one standard deviation
lower_bound <- mean_price - sd_price
upper_bound <- mean_price + sd_price

# Calculate the percentage of observations within one standard deviation
within_one_sd <- sum(selling_prices >= lower_bound & selling_prices <= upper_bound) / length(selling_prices) * 100

# Print the percentage
print(within_one_sd)

# c. Construct a boxplot.

# Construct a boxplot
boxplot(selling_prices, main = "Selling Prices", ylab = "Price (thousands of dollars)")





