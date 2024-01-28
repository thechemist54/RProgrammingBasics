# This project deals with issues that come up with data collection.
# There is a surprisingly cheap 5 carat diamond, and some cheap 3 carat diamonds. How can we identify those points? #nolint
# Use an interactive scatterplot to identify outliers in these variables. Check prices, carat and other information and think about if any of the outliers can be due to data errors. #nolint
# Discuss the following:
# How can you tell if the data is an outlier or if it is something important?
# Which data is the noise and how is the noise different from outliers?
# When there are missing values, explain the pros and cons of the following strategies: #nolint
# Elimination of Data Objects
# Estimation of Missing Values
# What are the limitations of analyzing real data with missing values and why is it impossible to really know such data? #nolint

library(ggplot2)
library(plotly)

# Subset the data for diamonds between 2.5 and 3.5 carats
subset_diamonds <- subset(diamonds, carat >= 2.5 & carat <= 3.5)

# Create a ggplot
gg <- ggplot(subset_diamonds, aes(x = carat, y = price)) +
  geom_point(aes(text = paste("Carat:", carat, "Cut:", cut, "Color:", color, "Clarity:", clarity, "Price:", price))) + #nolint
  labs(title = "Interactive Scatterplot of Price vs Carat (2.5-3.5 Carat Diamonds)", x = "Carat", y = "Price") #nolint

# Convert to a plotly object
ggplotly(gg, tooltip = "text")

library(dplyr)

# Load the diamonds dataset from ggplot2
data("diamonds", package = "ggplot2")

# Sample a subset of the data to reduce size
set.seed(123) # for reproducibility
sampled_diamonds <- diamonds %>% 
  filter(carat < 3) %>%
  sample_n(1000) # adjust the sample size as needed

# Create a ggplot
gg1 <- ggplot(sampled_diamonds, aes(x = carat, y = price)) +
  geom_point(aes(text = paste("Carat:", carat, 
                              "<br>Price:", price, 
                              "<br>Cut:", cut, 
                              "<br>Color:", color, 
                              "<br>Clarity:", clarity)),
             color = "blue") +
  labs(title = "Interactive Scatterplot of Diamond Price by Carat (Sampled)",
       x = "Carat",
       y = "Price")

# Convert to an interactive plotly object
interactive_plot <- ggplotly(gg1, tooltip = "text")

# Show the interactive plot
interactive_plot


# Filter the dataset for diamonds between 4 and 5 carats
subset_diamonds <- diamonds %>%
  filter(carat >= 4 & carat <= 5.5) %>%
  mutate(index = row_number())  # Add an index column

# Create a ggplot
gg <- ggplot(subset_diamonds, aes(x = carat, y = price)) +
  geom_point(aes(text = paste("Index:", index,
                              "<br>Carat:", carat, 
                              "<br>Cut:", cut, 
                              "<br>Color:", color, 
                              "<br>Clarity:", clarity, 
                              "<br>Depth:", depth, 
                              "<br>Table:", table, 
                              "<br>Price:", price, 
                              "<br>x:", x, 
                              "<br>y:", y, 
                              "<br>z:", z)),
             color = "blue") +
  labs(title = "Interactive Scatterplot of Diamond Price by Carat (4-5 Carat Diamonds)",
       x = "Carat",
       y = "Price")

# Convert to an interactive plotly object
interactive_plot <- ggplotly(gg, tooltip = "text")

# Print the interactive plot
interactive_plot

