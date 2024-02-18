#Addl_Task

# Load the necessary libraries
library(ggplot2)
library(png)
library(grid)

# Scatter plot of HP by Displacement with blue dots
ggplot(mtcars, aes(x = disp, y = hp)) +
  geom_point(size = 3, color = "blue") +
  labs(title = "HP by Displacement", x = "mtcars$disp", y = "mtcars$hp") +
  scale_y_continuous(breaks = seq(0, max(mtcars$hp), by = 50)) # Set y-axis breaks # nolint



# Define breaks for histogram that cover the full range of 'disp' in 'mtcars'
breaks_width <- 50 # Set the width of each bin
range_disp <- range(mtcars$disp)
breaks_seq <- seq(from = floor(range_disp[1] / breaks_width) * breaks_width,
                  to = ceiling(range_disp[2] / breaks_width) * breaks_width,
                  by = breaks_width)


# Create the histogram
hist(mtcars$disp, breaks = breaks_seq, col = "lightblue", border = "black",
     main = "Histogram of Displacement", xlab = "mtcars$disp", ylab = "Frequency") # nolint

# #If you want to combine these two use ggplot for both and save it as PNG

# library(patchwork) # nolint

# # Generate the ggplot2 version of the scatter plot
# p1 <- ggplot(mtcars, aes(x = disp, y = hp)) +
#   geom_point(size = 3, color = "blue") +
#   labs(title = "HP by Displacement", x = "mtcars$disp", y = "mtcars$hp") # nolint

# # Generate the ggplot2 version of the histogram
# p2 <- ggplot(mtcars, aes(x = disp)) +
#   geom_histogram(binwidth = 50, fill = "lightblue", color = "black") +
#   labs(title = "Histogram of Displacement", x = "Displacement", y = "Frequency") # nolint

# # Combine the plots side by side
# combined_plot <- p1 + p2 # nolint

# print(combined_plot) # nolint

# # Save the combined plot
# ggsave("combined_plots.png", combined_plot, width = 20, height = 10, units = "cm") #nolint

#e6eg0

# a) Plot with cylinders as a factor
p_a <- ggplot(mpg, aes(x = displ, y = hwy, color = factor(cyl))) +
  geom_point() +
  scale_color_manual(values = c("red", "green", "blue", "purple")) +
  theme_minimal() +
  labs(title = "a", x = "displ", y = "cty", color = "factor(cyl)") +
  theme(legend.position = "top")

# b) Plot with year as a factor
p_b <- ggplot(mpg, aes(x = displ, y = hwy, color = factor(year))) +
  geom_point() +
  scale_color_manual(values = c("red", "blue")) +
  theme_minimal() +
  labs(title = "b", x = "displ", y = "cty", color = "factor(year)") +
  theme(legend.position = "top")

# c) Plot with model as a factor
p_c <- ggplot(mpg, aes(x = model, y = hwy)) +
  geom_point() +
  labs(title = "c", x = "factor(model)", y = "cty") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

library(gridExtra)
# Arrange the plots with (a) and (b) on top and (c) at the bottom
grid.arrange(p_a, p_b, p_c, ncol = 2, nrow = 2, layout_matrix = rbind(c(1, 2), c(3, 3))) # nolint

#e6eg1

# Set the seed for reproducibility
set.seed(54321)

# Generate random data
data <- data.frame(
  alpha = 1:5,
  speed = c(-0.2, -1.1, -0.8, -1.62, -0.4)
)

# Create the plot
ggplot(data, aes(x = alpha, y = speed, label = paste0("\u03B1", 1:5))) +
  geom_point() + 
  geom_text(vjust = c(1, -0.1, 1, 0.1, 1), color = "grey20") +  # Adjust label positions # nolint
  labs(
    title = expression("Using expressions"),
    subtitle = expression(sqrt(paste("\u03B1"[1], "+", frac(beta, gamma)))),
    x = expression("\u03B1"[i]),
    y = expression("Speed" ~ (m * s^-1))
  ) +
  scale_y_continuous(breaks = seq(-1.6, -0.4, by = 0.4)) +  # Set y-axis breaks
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, hjust = 0),
    plot.subtitle = element_text(size = 20, hjust = 0),
    axis.title.x = element_text(face = "italic"),
    axis.title.y = element_text(face = "italic")
  )

#e6eg2

set.seed(54321)
# Generate random data for speed and dist
speed <- rnorm(100, mean = 15, sd = 5)
dist <- speed * rnorm(100, mean = 5, sd = 2)

data <- data.frame(speed, dist)

data <- na.omit(data)

# Create the plot
ggplot(data, aes(x = speed, y = dist)) +
  geom_point(size = 3) +
  labs(title = "Time zone: Europe/Helsinki\nDate: 2020-04-24", x = "Speed", y = "Distance") +#nolint
  scale_x_continuous(breaks = seq(0, 25, by = 5), limits = c(0, 25)) +
  scale_y_continuous(breaks = seq(0, 125, by = 25), limits = c(0, 125))