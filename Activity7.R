library(tidyverse)
library(dplyr)
library(ggplot2)

data("diamonds")

diamondSummary <- diamonds %>%
  group_by(cut) %>%
  summarise(
  #Counts all instances based on the grouping of cut
  count = n(),
  
  #Summary stats for X
  minX = min(x),
  q1X = quantile(x, 0.25),
  medX = median(x),
  q3X = quantile(x, 0.75),
  maxX = max(x),
  madX = mad(x),
  meanX = mean(x),
  sdX = sd(x),
  
  #Summary stats for Y
  minY = min(y),
  q1Y = quantile(y, 0.25),
  medY = median(y),
  q3Y = quantile(y, 0.75),
  maxY = max(y),
  madY = mad(y),
  meanY = mean(y),
  sdY = sd(y),
  
  #Summary stats for Z
  minZ = min(z),
  q1Z = quantile(z, 0.25),
  medZ = median(z),
  q3Z = quantile(z, 0.75),
  maxZ = max(z),
  madZ = mad(z),
  meanZ = mean(z),
  sdZ = sd(z)
)