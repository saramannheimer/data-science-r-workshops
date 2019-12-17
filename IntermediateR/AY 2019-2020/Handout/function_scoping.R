
################# COOL PRACTICE WITH FUNCTION SCOPING ###############


l <- function(x) x + 1

m <- function(){
  l <- function(x) x*2
  l(10)
}

m()

c <- 3 

c(c = 3)


j <- function(){
  if(!exists("a")){
    a <- 1
  }else{
    a <- a + 1
  }
  
  print(a)
}

j()

j()
