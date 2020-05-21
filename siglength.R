#find the signal time
# function takes a list of matrix's created by () and finds the length of each individual signal
# this is  a great step for finding the phrase/pause ratio
signalleng<-function(file){
  l <- length(file)
  time.dif <- vector('list', l)
  for(i in 1:l){
    time.dif[[i]]  <-file[[i]][2]- file[[i]][1]
  }
 m<-unlist(time.dif)
 return((m))
   }


