
# Function to extract times for from and to 
fromto <- function(filelist){
  m <- vector('list', length(filelist))
  for (i in 1:length(filelist)){
    m[[i]] <- filelist[[i]][,1]
    #  assign(paste0('yb', n), yw.sample[n, ])

  }
return(m)
}
# and a loop to create seperate objects of each from and to value
for (n in 1:length(m)) {
  assign(paste0('s',n ), m[[n]])
}


