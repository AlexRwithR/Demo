phrase.zoom <-function(file.name, z =1, v = NULL, r = NULL){
  res.osc<- vector('list', z)
  envl<- env(file.name, plot =FALSE)
  f <- file.name@samp.rate
  o<-1
  e<-2
  if(!is.null(v)){
    if(is.null(r)){
    v<- matrix(v,byrow= TRUE, ncol =2)
    n <- nrow(v)
    for(i in 1:n){
      res.osc[[i]] <-oscillo(envl, from = v[i,1], to = v[i,2], f= f,
                             identify = TRUE, nidentify =2)
    }}
    #Block for if there are multiple idenification points on one zoom
    else{
      v<- matrix(v,byrow= TRUE, ncol =2)
      n <- nrow(v)
      mes <- vector('list', z)
      for(i in 1:n){
        mes[[i]] <-oscillo(envl, from = v[i,1], to = v[i,2], f= f,
                               identify = TRUE, nidentify =r)
      }
      for(s in 1:(length(mes[[1]])/4)){
        
      res.osc[[s]]<- matrix(data=c(mes[[1]][o,], mes[[1]][e,]), 
                            byrow= TRUE, ncol = 2)
      o<-o +2
      e<-e+2
      }
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
       
 
