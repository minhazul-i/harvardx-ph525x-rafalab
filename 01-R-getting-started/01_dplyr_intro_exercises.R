# PH525x — dplyr Exercises
# Dataset: msleep_ggplot2.csv
# Assumption: The CSV file is in the current working directory.


# Exercise 1
# Read in the msleep_ggplot2.csv file with read.csv and
# use class to determine what type of object is returned.

data <- read.csv("msleep_ggplot2.csv")
class(data)


# Exercise 2
# Use filter to select only the primates.
# How many animals in the table are primates?

primates <- filter(data, order == "Primates")
nrow(primates)


# Exercise 3
# What is the class of the object obtained after
# subsetting the table to only include primates?

class(primates)


# Exercise 4
# Use select to extract sleep_total for the primates.
# What class is this object?

sleep_tot <- data %>%
  filter(order == "Primates") %>%
  select(sleep_total)

class(sleep_tot)


# Exercise 5
# Calculate the average amount of sleep for primates.
# Use unlist to convert the selected data to a vector.

sleep_tot <- data %>%
  filter(order == "Primates") %>%
  select(sleep_total) %>%
  unlist()

mean(sleep_tot)


# Exercise 6
# Repeat Exercise 5 using filter and summarize.

# summarize() is used to calculate summary statistics
# from the data, such as the mean of a variable.

data %>%
  filter(order == "Primates") %>%
  summarize(average_sleep = mean(sleep_total))
