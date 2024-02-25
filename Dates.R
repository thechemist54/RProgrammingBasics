# 2020-01-01 instead of 020-01-01
as.Date("2021-01-01") - as.Date("2020-01-01")

# 020-01-01
as.Date("2021-01-01") - as.Date("020-01-01")

#"2022-11-08 03:14:35 PST" from "2022-11-09 26:14:35 PST". there is no 26:14:35, hours must me in a range of 0 to 23 # nolint
library(lubridate)
difftime(ymd_hms("2022-11-09 02:14:35", tz = "PST"), ymd_hms("2022-11-08 03:14:35", tz = "PST")) # nolint
difftime(ymd_hms("2022-11-09 20:14:35", tz = "PST"), ymd_hms("2022-11-08 03:14:35", tz = "PST")) # nolint
difftime(ymd_hms("2022-11-09 06:14:35", tz = "PST"), ymd_hms("2022-11-08 03:14:35", tz = "PST")) # nolint
difftime(ymd_hms("2022-11-09 16:14:35", tz = "PST"), ymd_hms("2022-11-08 03:14:35", tz = "PST")) # nolint

time <- as.POSIXct("2022-11-08 03:14:35", tz = "PST")
seconds_of_day <- hour(time) * 3600 + minute(time) * 60 + second(time)
day_of_year <- yday(time)

interval(start = as.Date("2020-01-01"), end = as.Date("2021-01-01"))

seq(as.Date("2020-04-21"), by = "month", length.out = 5)

# Applying the length function to a list of numeric vectors
result <- lapply(list(c(1, 2, 3), c(4, 5), c(6, 7, 8, 9)), length)
print(result)
#This will return a list where each element is the length of the corresponding numeric vector in the input list. # nolint

# Applying the sqrt function to a vector
result2 <- sapply(1:4, sqrt)
print(result2)
#This will return a numeric vector containing the square roots of the numbers 1 through 4. # nolint

# Applying the sum function to a list of numeric vectors, expecting a single numeric value as output # nolint
result3 <- vapply(list(c(1, 2, 3), c(4, 5), c(6, 7, 8, 9)), sum, numeric(1))
print(result3)
#This will return a numeric vector where each element is the sum of the corresponding numeric vector in the input list. The numeric(1) indicates that the output of applying sum to each element of the list should be a single numeric value. # nolint