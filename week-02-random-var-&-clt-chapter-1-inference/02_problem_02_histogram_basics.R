# Week 2: Random Variables and Central Limit Theorem
# Problem_02 Histogram_Basics
# You have the following data on heights of people in inches
# Write R code that, Finds the minimum and maximum height, creates 1-inch spaced bin boundaries from the minimum to maximum
# Creates a histogram using those boundaries, label the x-axis "Height (in inches)", Give the histogram the title "Heights"

library(tidyverse)

height <- c(62, 64, 65, 65, 67, 68, 69, 71, 72, 74)

minim <- min(height)
maxim <- max(height)

bins <- seq(minim, maxim, by = 1)

hist(
  height,
  breaks = bins,
  xlab = "Height (in inches)",
  main = "Heights"
)
