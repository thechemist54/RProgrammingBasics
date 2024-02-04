data <- read.csv("dataG2.csv", header = FALSE)

imported_data <- read.csv("dataG2.csv")
S = imported_data[, 5]-imported_data[, 3] # nolint
I_1 = which.min(S) # use figure I_1 (attached) # nolint
I_2 = which.max(S) # use figure L_2 (attached) # nolint

print(I_1)