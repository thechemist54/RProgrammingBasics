#Two datasets that are shipped with the ggplot2 package: diamonds: describing the prices of more than 50,000 cut diamonds and msleep describing the sleep times of 83 mammals. Then, #nolint

#Create a scatterplot with carat along the x-axis and price along the y-axis. Change the x-axis label to read “Weight of the diamond (carat)” and the y-axis label to “Price (USD).” Use cut to set the color of the points. #nolint
#Try adding the argument alpha = 1 to geom_point, i.e. geom_point(alpha = 1). Does anything happen? Try changing the 1 to 0.5 and 0.25 and see how that affects the plot. #nolint
#Change the scatterplot from above, so that diamonds with different cut qualities are represented by different shapes. #nolint
#Change the scatterplot from above, so that the size of each point is determined by the diamond’s length, i.e. the variable x.  #nolint

# Load the ggplot2 package
library(ggplot2)

# Basic scatterplot with carat on the x-axis and price on the y-axis
p <- ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.25) + # Change alpha to 0.5 or 0.25 to see the effect #nolint
  labs(x = "Weight of the diamond (carat)", y = "Price (USD)") +
  theme_minimal()

# Print the plot
print(p)

# Changing alpha values
# To change alpha, replace geom_point(alpha = 1) with geom_point(alpha = 0.5) or geom_point(alpha = 0.25) #nolint

# geom_point(alpha = 1) makes the points fully opaque. Changing alpha to 0.5 or 0.25 makes the points semi-transparent, which can be helpful in identifying areas of overplotting. #nolint


# Change the shape of points based on the cut quality
p_shape <- p + geom_point(aes(shape = cut))
print(p_shape)

# aes(shape = cut) changes the shape of the points based on the cut of the diamonds. #nolint

# Change the size of each point based on the diamond’s length (x)
p_size <- p + geom_point(aes(size = x))
print(p_size)

#aes(size = x) adjusts the size of each point based on the diamond's length.
