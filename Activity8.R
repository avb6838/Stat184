#import libraries for activity 8
library(janitor)
library(knitr)
library(kableExtra)
library(tidyverse)
library(tidyr)
#IMPORTANT: armyInd is the individual case table from Activity #6

#Activity 8 first 3 questions----

#Isolate the male individual cases and female individual cases
maleArmyInd <- armyInd %>%
  filter(Gender == "Male")

femaleArmyInd <-armyInd %>%
  filter(Gender == "Female")

#Creates the dataframe inside R to work with for Male and Female cases
freqMale <- maleArmyInd %>%
  tabyl(Rank, Branch) %>%
  adorn_totals(c("row", "col"))

freqFemale <- femaleArmyInd %>%
  tabyl(Rank, Branch) %>%
  adorn_totals(c("row", "col"))

#Prints the data in a simple but clean format for the reader/anyone else who may want these frequency tables
freqMale %>%
  kable(caption = "Frequency Table of the Ranks and Branches of Males in Armed Forces", format.args = list(big.mark = ",")) %>%
  kable_classic()

freqFemale %>%
  kable(caption = "Frequency Table of the Ranks and Branches of Females in Armed Forces", format.args = list(big.mark = ",")) %>%
  kable_classic()

#Activity 8 question 4-6----
library(ggplot2)

data("diamonds")

diamondSummary <- diamonds %>%
  group_by(cut) %>%
  summarise(
    count = n(),
    minX = min(x),
    q1X = quantile(x, 0.20),
    q2X = quantile(x, 0.40),
    medX = median(x),
    q3X = quantile(x, 0.60),
    q4X = quantile(x, 0.80),
    maxX = max(x),
    madX = mad(x),
    meanX = mean(x),
    sdX = sd(x),
  )

diamondSummary %>%
  kable(caption = "Summary table of diamond length(x) grouped by type of cut", digits = 3) %>%
  kable_classic()

#Activity 8 questions 7 - 10----
library(palmerpenguins)

data("penguins")
#isolate Adelie penguins
pengData <- penguins %>%
  filter(species == "Adelie")
#linear regression on penguins where we look at the variables that contribute to body mass in grams
penguinModel <- lm(
  formula = body_mass_g ~ bill_length_mm + bill_depth_mm + flipper_length_mm + sex + island,
  data = pengData
) 
#Creating the table of coefficients to export
summary(penguinModel)$coefficients %>%
  kable(caption = "Summary of regression coefficients on penguin body mass in grams", digits = 4, align = "lcccc") %>%
  kable_classic()

