##Consider the following time series plot of daily morning gold prices, based on the gold data from the forecast package: #nolint
##library(forecast) #nolint
##autoplot(gold) #nolint
##We’d like to add a note about the spike due to incorrect value to the plot. First, we wish to find out on which day the spike appears: #nolint
##spike_date <- which.max(gold) #nolint
##To add a circle around that point, we add a call to annotate to the plot:
##autoplot(gold) +
##      annotate(geom = "point", x = spike_date, y = gold[spike_date],
##             size = 5, shape = 21, colour = "red", fill = "transparent")
##Using the figure created above and the documentation for annotate, do the following: #nolint



library(forecast)
library(ggplot2)
autoplot(gold)

spike_date <- which.max(gold)

##Add the text “Incorrect value” next to the circle.
p <- autoplot(gold) +
      annotate(geom = "point", x = spike_date, y = gold[spike_date], #nolint
               size = 5, shape = 21, colour = "red", fill = "transparent") +
        annotate(geom = "text", x = spike_date, y = gold[spike_date], label = "Incorrect value", #nolint
           hjust = -0.1, vjust = -1.5, colour = "red")

##Create a second plot where the incorrect value has been removed.

gold_corrected <- gold
gold_corrected[spike_date] <- NA

p_corrected <- autoplot(gold_corrected)

print(p_corrected)

##Read the documentation for the geom geom_hline. Use it to add a red reference line to the plot, at y=400. #nolint

# Plot the data with the spike and add a red horizontal line at y=400
p_ref_line <- p +
  geom_hline(yintercept = 400, linetype = "dashed", color = "red") +
  ggtitle("Gold Prices with Reference Line at y=400") +
  ylab("Gold Price") +
  xlab("Time")

print(p_ref_line)

# Plot the data without the spike and add a red horizontal line at y=400
p2 <- p_corrected +
  geom_hline(yintercept = 400, colour = "red", linetype = "dashed") +
  ggtitle("Gold Prices with Reference Line at y=400") +
  ylab("Gold Price") +
  xlab("Time")

print(p2)
