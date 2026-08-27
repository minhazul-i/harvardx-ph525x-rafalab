# Week 2: Random Variables and Central Limit Theorem
# Problem_04 Normal distribution

# Suppose the height of a population are approximately equally distributed. Mean height is 165 cm and SD is 7 cm.   
# You randomly select one person. What is the probability that their height is greater than 175 cm?

library(tidyverse)

# The probability that their height is less than or eqaul to 175
pnorm(175, 165, 7)

# so, the probability that their height is greater than 175 cm
1 - pnorm(175, 165, 7)




# Problem_05 Normal distribution

# Adult weights are approximately normally distributed with mean = 60 kg, and SD = 8 kg
# what is the probability that a randomly selected adult weighs between 60 and 75 kg?

pnorm(75, 60, 8) - pnorm(60, 60, 8)
