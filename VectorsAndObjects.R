#Aaman Bhandari
#MSDS 631: R Programming

#Create an integer variable e holding the value 42. Check the object class of e with class(). # nolint
e <- 42
# Check the object class of e
class(e)

#Convert e to the character data type with as.character(). Check the object class again. #nolint
e <- as.character(e)

# Check the object class again
class(e)

#Create a character vector friends with four names from your circle of friends or acquaintances. #nolint
friends <- c("Bruce", "Clark", "Diana", "Barry")

#Index the second element from the vector friends.
friends[2]

#Replace the first element of the vector friends with “Isolde” and check the updated vector again. #nolint
friends[1] <- "Isolde"

# Check the updated vector
friends

#Create a vector v1 from the following elements 1, “Hello”, 2, “World”. Check the object class. #nolint
v1 <- c(1, "Hello", 2, "World")

# Check the object class
class(v1)

#Create a vector v2 with numerical values (only integers) ranging from 4 to 10. #nolint
v2 <- 4:10

#Index the first three elements from v2.
v2[1:3]

#Index all elements of v2 except the second element and save the result as v2.subset. #nolint
v2.subset <- v2[-2] #nolint

#Use the length() function to find out the length of v2.subset (= the number of elements in the vector). #nolint
length(v2.subset)