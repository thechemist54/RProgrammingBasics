library(ggplot2)
library(reshape2)
# library(palmerpenguins)
library(dplyr)

#eg3
ggplot(tips, aes(x = total_bill, y = tip / total_bill, color = sex, shape = smoker, size = size)) + # nolint
  geom_point(alpha = 0.6) +
  facet_wrap(~time, scales = "free_x") +
  scale_color_manual(values = c("Female" = "black", "Male" = "grey30")) +
  scale_shape_manual(values = c("No" = 16, "Yes" = 17)) +
  labs(title = "Relation between total bill and tips during lunch and dinner",
       x = "Total bill ($)",
       y = "Ratio between tips and total bill") +
  theme_bw()

#eg2

# Define the age range from 0 to 1600
ages <- seq(0, 1600, by = 100)

# Initialize the data frame with the age column
trees <- data.frame(age = ages)

# Simulate circumferences for tree types with a linear increase up to a peak at age 1000 # nolint
peak_age <- 1600
max_circumference <- 800

# Function to calculate circumference
calc_circumference <- function(age, peak, max_circ) {
  sapply(age, function(a) {
    if (a <= peak) {
      return((max_circ / peak) * a)  # Linear increase
    } else {
      return(max_circ)  # Stay at max
    }
  })
}

# Apply the function to create the circumference columns
trees$TreeType1 <- calc_circumference(trees$age, peak_age, max_circumference)
trees$TreeType2 <- calc_circumference(trees$age, peak_age, max_circumference * 0.8) # nolint
trees$TreeType3 <- calc_circumference(trees$age, peak_age, max_circumference * 0.6) # nolint
trees$TreeType4 <- calc_circumference(trees$age, peak_age, max_circumference * 0.4) # nolint
trees$TreeType5 <- calc_circumference(trees$age, peak_age, max_circumference * 0.2) # nolint

# Ensure the circumferences are not negative
trees[trees < 0] <- 0


# Convert from wide to long format
trees_long <- melt(trees, id.vars = 'age', variable.name = 'TreeType', value.name = 'Circumference') # nolint

# Plot
ggplot(trees_long, aes(x = age, y = Circumference, fill = TreeType)) +
  geom_area(position = 'stack') + # nolint
  geom_vline(xintercept = 1000, linetype = "solid", color = "black", size = 1) +
  labs(title = "Simulated Tree Circumferences Over Age", x = "Age", y = "Circumference") + # nolint
  theme_minimal() +
  theme(legend.position = "none")

#eg1

library(gridExtra)
mtcars$wt <- round(mtcars$wt, 1)

data(mtcars)

# Calculating mean weight, displacement, and miles per gallon for each number of cylinders # nolint
summary_data <- mtcars %>%
  group_by(cyl) %>%
  summarise(mean_wt = mean(wt), mean_disp = mean(disp), mean_mpg = mean(mpg), .groups = 'drop') %>% # nolint
  mutate(cyl = factor(cyl)) # to use in the plot as a factor

# Create the plot
p <- ggplot(mtcars, aes(x = disp, y = mpg, size = wt, color = as.factor(cyl))) +
  geom_point(alpha = 0.6) +
  scale_color_manual(values = c("4" = "red", "6" = "green", "8" = "blue")) +
  labs(x = "Displacement (disp)", y = "Miles per Gallon (mpg)", color = "Number of Cylinders (cyl)") + # nolint
  theme_minimal() +
  guides(size = guide_legend("Weight (1000 lbs)"))

# Create the table using the summary data
table <- tableGrob(summary_data)

# Combine the plot and the table
grid.arrange(table, p, ncol = 1, heights = c(1, 4))


#eg4

library(palmerpenguins)

# Load the palmerpenguins dataset
data(penguins)

# Filter out rows with NA values in any of the relevant columns
penguins_filtered <- penguins %>%
  filter(!is.na(bill_length_mm) & !is.na(body_mass_g) & !is.na(sex))

# Create the plot with a LOESS curve instead of a linear model
p <- ggplot(penguins_filtered, aes(x = bill_length_mm, y = body_mass_g, color = sex)) + # nolint
  geom_point() +
  geom_smooth(method = "loess", se = TRUE) +  # Use lm for linear model, or loess for smooth curve # nolint
  facet_wrap(~sex, scales = 'free') + # nolint
  labs(title = "Relationship between bill length and body mass of Gentoo penguins", # nolint
       subtitle = "Divided and colored by sex",
       x = "Bill Length (mm)",
       y = "Body Mass") +
  scale_color_manual(values = c("female" = "red", "male" = "blue")) +
  theme_minimal()

# Print the plot
print(p)