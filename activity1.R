#Function for getting height of gummy bear off a spoonapult----

#Needs----
## intVel = 350
## time
## intHeight = 71
## GRAV = -980.665
## 0.5*GRAV*time^2 + intVel*time + intHeight

#Define funtion ----
## Name
## inputs/arguments: time, intVel, intHeight
## rule

getHeight <- function(time, intVel = 350, intHeight = 71){
  h <- 0.5*-980.665*time^2 + intVel*time + intHeight
  return(h)
}

