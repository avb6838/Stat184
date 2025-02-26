library(dcData)
library(tidyverse)

BabyNames %>%
  group_by( "first" ) %>%
  summarise( votesReceived=n() )

Tmp <- group_by(BabyNames, year, sex) %>%
  summarise(Tmp, totalBirths=sum(count))

Tmp <- group_by(BabyNames, year, sex)
summarise(BabyNames, totalBirths=sum(count)

top5seconds <- Minneapolis2013 %>%
  group_by(Second) %>%
  summarise(total_votes = n()) %>%
  arrange(desc(total_votes))

undervoted1 <- Minneapolis2013 %>%
  filter(First == "undervote") %>%
  summarise(count = n())

undervoted2 <- Minneapolis2013 %>%
  filter(Second == "undervote") %>%
  summarise(count = n())

undervoted3 <- Minneapolis2013 %>%
  filter(Third == "undervote") %>%
  summarise(count = n())
  
top3combo <- Minneapolis2013 %>%
  group_by(First, Second) %>%
  summarise(total_votes = n()) %>%
  arrange(desc(total_votes))

topPrecinct <- Minneapolis2013 %>%
  group_by(Precinct) %>%
  summarise(tvotes = n()) %>%
  arrange(desc(tvotes))

library(googlesheets4)
gs4_deauth()
galtonRaw <- read_sheet(
  ss = 'https://docs.google.com/spreadsheets/d/1Txj51UpLCgYR6nsh1kytBuwZm7agzVIK7feY8S0ZYrw/edit?usp=sharing'
)


galtonTidy <- galtonRaw %>%
  separate(col = "Sons in order of height", into = c("Son1", "Son2", "Son3"),sep = ", ", convert = TRUE) %>%
  separate(col = "Daughters in order of height", into = c("Daughter1", "Daughter2", "Daughter3"), sep = ", ", convert = TRUE)

newGaltonTidy <- galtonTidy %>%
  pivot_longer(cols = c("Son1", "Son2", "Son3", "Daughter1", "Daughter2", "Daughter3"), cols_vary = "fastest",names_to = "Child", values_drop_na = TRUE)

personGaltonTidy <- galtonTidy %>%
  pivot_longer(cols = c("Father", "Mother", "Son1", "Son2", "Son3", "Daughter1", "Daughter2", "Daughter3"), cols_vary = "fastest", names_to = "person", values_drop_na = TRUE, names_repair = "minimal")
