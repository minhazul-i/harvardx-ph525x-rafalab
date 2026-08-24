library(tidyverse)
dat <- read.csv("data/femaleMiceWeights.csv")

// Filter the mices under the chow diet
controls <- filter(dat, Diet == "chow")

// Obtain only the body weights of the controls
select(controls, Bodyweight)

// convert the bodyweights into vector
controls <- select(controls, Bodyweight)
unlist(controls)

//do the whole thing using pipe in just a line
controls <- filter(dat, Diet == "chow") %>% select(Bodyweight) %>% unlist
