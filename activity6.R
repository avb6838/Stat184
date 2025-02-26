#Creating two data frames from Army data of individual and group case----

#import libraries----
##Tidyverse
##googlesheets4
##rvest
library(tidyverse)
library(googlesheets4)
library(rvest)

#load data----
##import data from the html and google sheet into 2 separate data frames
##gs4_deauth(), read_sheet, read_html, html_elements, html_table
gs4_deauth()
armyRaw <- read_sheet(ss = "https://docs.google.com/spreadsheets/d/1cn4i0-ymB1ZytWXCwsJiq6fZ9PhGLUvbMBHlzqG4bwo/edit?usp=sharing",
                      skip = 2,
                      col_types = c("?"),
                      guess_max = 10,
                      .name_repair = "minimal"
                      )

ranksRawList <- read_html(x = "https://neilhatfield.github.io/Stat184_PayGradeRanks.html") %>%
  html_elements(css = "table") %>%
  html_table(convert = TRUE, header = TRUE)



#tidy data
##remove totals from the google sheet data frame and remove coast guard from the html data frame if necessary

## Converts the tibble from HTML functions to a dataframe that is tidy
ranksRaw <- data.frame(ranksRawList[1])
colnames(ranksRaw) <- unlist(ranksRaw[1, ])
ranksRaw <- ranksRaw[-c(1,26), ] %>%
  subset(select = -c(1, 8))

### Created Army Tidy 
armyTidy <- armyRaw[-c(10, 16, 27, 28, 29), ] %>%
  subset(select =  -c(4, 7 ,10, 13, 16, 17, 18, 19))
  
#Wrangle data into 2 seperate data frames

armyGrp <- pivot_longer(armyTidy, cols = c("Male", "Female"), names_to = "Gender", values_drop_na = TRUE)

Branch <- data.frame(Branch = rep(c("Army", "Army", "Navy", "Navy", "Marine Corps", "Marine Corps", "Air Force", "Air Force", "Space Force", "Space Force"), times = 22))
armyGrp <- bind_cols(armyGrp, Branch, .name_repair = "minimal")
ranksTidy <- pivot_longer(ranksRaw, cols = c("Army", "Navy", "Marine Corps", "Air Force", "Space Force"), names_to = "Branch", values_to = "Rank")
armyGrp <- left_join(armyGrp, ranksTidy, by = c("Pay Grade", "Branch"), copy = TRUE)
#ArmyGrp is the final Data Frame for grouped cases in the Army Data----

armyInd <- uncount(armyGrp, weights = value)

#ArmyInd is the final Data Frame for individual cases in the Army Data----
