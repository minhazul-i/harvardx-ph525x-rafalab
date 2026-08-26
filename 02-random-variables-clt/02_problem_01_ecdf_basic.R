# Week 2: Random Variables and Central Limit Theorem
# problem_01 ECDF basics
# You have the following exam scores. Create and plot the ECDF of these marks.
# Find the smallest value and store as smallest, # Find the largest value and store as largest
# Create 100 equally spaced values between smallest and largest, storing as values
# Create the ECDF and store it as marksecdf
# Plot values on the x-axis and the corresponding ECDF values on the y-axis, connecting them with lines

library(tidyverse)

marks <- c(42, 55, 61, 61, 68, 72, 75, 80, 84, 91)

smallest <- min(marks)

largest <- max(marks)

values <- seq(smallest, largest, len = 100)

marksecdf <- ecdf(marks)

plot(values, marksecdf(values), type = "l")
