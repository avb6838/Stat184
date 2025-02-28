# needs ----
## Length = 11 inches
## Width = 8.5 inches
## Height = (variable s or side length of square)

#Volume Function ----
findVolume <- function(len = 11, wid = 8.5, h){
  v <- (len-2*h)*(wid-2*h)*h
  return(v)
}

#Graphing Volume----
squareSideL <- seq(0,8.5/1.999999,0.1)
plot(squareSideL, findVolume(h = squareSideL))


#Max Value and Index----
maxVal <- max(findVolume(h = squareSideL))

#Collatz Conjecture----
collatzEven <- function(n){
  x <- n/2
  return(x)
}
collatzOdd <- function(n){
  x <- 3*n+1
  return(x)
}
collatzStoppingTime <- function(n, counter = 0){
  counter <- counter + 1
  if(n == 1){
    counter <- counter - 1
    return(counter)
  }
  else if(n%%2 == 0){
    collatzStoppingTime(collatzEven(n), counter)
  }
  else{
    collatzStoppingTime(collatzOdd(n), counter)
  }
  
}

?sapply
?hist
?Vectorize
vectCollatz <- sapply(1:100, collatzStoppingTime)
hist(vectCollatz, breaks = 100)

#Spinner function----
spinner <- function(p1wins = 0, p2wins = 0){
  while((p1wins != 5)&(p2wins != 5)){
    spinResult <- sample(1:1000, 1)
    if(spinResult%%2==0){
      p1wins <- p1wins + 1
    }
    else{
      p2wins <- p2wins + 1
    }
  }
  if(p1wins == 5){
    print("Player 1 wins!")
  }
  else{
    print("Player 2 wins!")
  }
}

simResults <- replicate(
  n = 10000,
  expr = spinner()
)
table(simResults)

spinner2 <- function(p1wins = 0, p2wins = 0){
  while((p1wins != 5)&(p2wins != 5)){
    spinResult <- sample(1:10, 1)
    if(spinResult<=4){
      p1wins <- p1wins + 1
    }
    else{
      p2wins <- p2wins + 1
    }
  }
  if(p1wins == 5){
    print("Rahquez wins!")
  }
  else{
    print("Christina wins!")
  }
}

simResults <- replicate(
  n = 1000,
  expr = spinner2()
)
table(simResults)
