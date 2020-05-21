phrase.zoom <-function(file.name, z =1, v = NULL){
  res.osc<- vector('list', z)
  envl<- env(file.name, plot =FALSE)
  f <- file.name@samp.rate
  if(!is.null(v)){
    v<- matrix(v,byrow= TRUE, ncol =2)
    n <- nrow(v)
    for(i in 1:n){
      res.osc[[i]] <-oscillo(envl, from = v[i,1], to = v[i,2], f= f,
                             identify = TRUE, nidentify =2)
    }
  }
  else{
  x<- 1
  for(i in 1:z){
    # if(x <= z){
    res.osc[[i]] <- oscillo(envl, f = f,zoom = TRUE,
                            identify = TRUE, nidentify = 2)
    x<-x +1
  }}
  return(res.osc)
  }

 trytry<-phrase.zoom(yw1.mono, z= 4)

oscillo(yw1.mono)
# phrase.test <-function(file.name, z =1, v = NULL){
#   res.osc<- vector('list', z)
#    if(!is.null(v)){
#     v<- matrix(v,byrow= TRUE, ncol =2)
#     n <- nrow(v)
#     for(i in 1:n){
#       res.osc[[i]] <-oscillo(file.name, from = v[i,1], to = v[i,2], identify = TRUE, nidentify =2)
#     }
#    }
#   return(res.osc)}
# trytry<-phrase.test(yw1.mono, v = c(0, 5, 9 ,12, 22, 25, 33, 36))
#  trytry           
 