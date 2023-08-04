library(ggplot2)

ggplot2(mpg, aes(displ, hwy, colour = class)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "loess") +
  labs(x = "Displacement", y = "Highway MPG", colour = "Car Type")