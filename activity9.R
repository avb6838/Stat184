library(ggplot2)
data(diamonds)

#Creating the plot utilizing table and depth as the x and y variables respectively
ggplot(
  data = diamonds,
  mapping = aes(
    x = table,
    y = depth
  )
) +
  #After creating the scatter, I utilize facet to split the graph up into grids to better visualize the differences looking at color and cut
  geom_point() +
  facet_grid(cut~color) +
  #Adding labels for people who are new to looking at statistics about diamonds and simplifying the table and depth meanings
  labs(
    x = "table (width relative to the widest point)",
    y = "depth (the tallest part of the diamond)",
    title = "Diamond color and cut by size of diamond"
  ) +
  theme_bw()

#Starting penguins plot

#removes all N/A's from the data to make the visualization clear
peng <- na.omit(penguins)
#Creating scatter plots from penguins with flipper length and body mass alongside coloring the points utilizing the species
ggplot(
  data = peng,
  mapping = aes(
    x = flipper_length_mm,
    y = body_mass_g,
    color = species
  )
) +
  geom_point() +
  #creates 2 different plots separated by sex
  facet_grid(~sex) +
  #Created labels to clear unnecessary syntax from labels and show the units alongside adding a title
  labs(
    x = "Flipper length (mm)",
    y = "Body mass (g)",
    title = "Effect of Sex on size of penguins"
  ) +
  theme_bw()

#Start of baby plot

#Create subset of baby names that just includes John, Kenneth, Gracie, and Zachary
library(tidyverse)
library(dplyr)

subBabyNames <- BabyNames %>%
  #filtering only the necessary names, then creating a frequency table after changing the case from names to individual people
  filter(name == c("John", "Kenneth", "Gracie", "Zachary")) %>%
  uncount(weights = count) %>%
  group_by(year, name) %>%
  summarize(count=sum(n()))

#Begin Plotting using year and count as the x and y
ggplot(
  data = subBabyNames,
  mapping = aes(
    x = year,
    y = count,
    color = name
  )
) +
  #Thickening the lines slightly while adding some transparency to help see the stacked lines
  geom_line(size = 2, alpha = 0.8) +
  #Labeling to help with visualization and to title the graph
  labs(
    x = "Year",
    y = "Total number of People with name",
    title = "Popularity of 4 names over the years"
  ) +
  theme_bw()


