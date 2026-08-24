library(tidyverse)
dat <- read.csv("data/femaleMiceWeights.csv")

# Filter/ obtain data of the mices under the chow diet only
controls <- filter(dat, Diet == "chow")

# Obtain only the body weights column from the controls
select(controls, Bodyweight)

# convert the bodyweights into a vector
controls <- select(controls, Bodyweight)
unlist(controls)

# do the whole thing using pipe in just a line
controls <- filter(dat, Diet == "chow") %>% select(Bodyweight) %>% unlist
