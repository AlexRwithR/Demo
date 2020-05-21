#signal pause ratio

SPR<-function(file.name, signal.name, sumsig){
  l <- length(signal.name)
  f<-file.name@samp.rate
  ends<- oscillo(file.name,f=f,  # this removes the silence at the beginning/ending of the recording 
                 from = signal.name[[1]][1], to= signal.name[[l]][2],
                 plot = FALSE)
  wavend<- Wave(ends, samp.rate= f, bit= 16) # turns the ends obj into a Wave file
  ntime<- length(wavend@left)/ wavend@samp.rate # this finds the total length (s) in the edited file
  pause.time<- ntime - sumsig # removes the time spent singing
  spr<- sumsig/pause.time # finds the ratio
  return(spr)
  }

  