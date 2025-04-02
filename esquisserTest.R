library(esquisse)

soldiers <- read.csv(
  file = "https://www.dropbox.com/scl/fi/mzt4e0i5pmq4c9xxck0fx/armedForcesSoldiers.csv?rlkey=jm1iu28692jqkd6x1z1i77phi&dl=1",
  header = TRUE,
  sep = ","
)

esquisser(
  data = soldiers,
  viewer = "browser"
)