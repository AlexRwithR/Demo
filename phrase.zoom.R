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


       
 
