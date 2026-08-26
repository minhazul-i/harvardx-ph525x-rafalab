# Week 2: Random Variables and Central Limit Theorem
# Problem_03 Systolic BP Histogram
# You have the following systolic blood pressure measurements from 15 patients.
# find the smallest and largest SBP, create bin boundaries with 5 mmHg bin boundaries
# Create an ECDF called sbp_ecdf, create a histogram using your 5 mmHg bins
# Label the x-axis "Systolic Blood Pressure", finally use your ECDF to find the proportion of patients with SBP <= 140 mmHg

library(tidyverse)

sbp <- c(112, 118, 121, 125, 127, 130, 131, 135, 138, 142, 145, 150, 154, 160, 172)

smallest <- min(sbp)
largest <- max(sbp)

bins <- seq(smallest, largest, by = 5)

sbp_ecdf <- ecdf(sbp)

hist(
  sbp,
  breaks = bins,
  xlab = "Systolic Blood Pressure",
  main = "SBP Histogram"
)

sbp_ecdf(140)
