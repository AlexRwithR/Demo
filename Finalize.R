oscillo(demrecord)

l<-length(demrecord@left)/demrecord@samp.rate
f<- demrecord@samp.rate
env.song <- env(demrecord, envt = 'hil', plot =FALSE)
# To extracteach song we can use my custom function phrase.zoom() which has three inputs
#   file.name - the name of the wave file
#   z         - the number of phrases
#   v         - a vector of time stamps to automatically zoom into. If v = NULL the fucntion
#               uses identify() to do select the time frame with a mouse & curser

#For demostration purposes lets see what the reults are when v = NULL
# Note this can be a slow process press esc to end at anytime 

#phrase.zoom(demrecord, z = 4)

#looking at the oscillo the rough time frames can be estimated for a quicker zoom
song.extract<-phrase.zoom(demrecord, v = c(0, 3, 9,12, 20, 23, 32, 35))

# We now have a list of matrices that represent each song that can be accessed with song.extract[i]

# Now lets find the Signal Pause Ratio
# Step one find the signallength we can use my custom function signalleng to get this easily
extractlenght<-signalleng(song.extract)
totallength<- sum(extractlenght) # here is the total length of the song
#Now we can use my signal noise ratio function
sig.pause.rat<-SPR(demrecord,song.extract, totallength)
#SNR
m <- cutw(demrecord, from = 1.22, to = 2.31)
w<- cutw(demrecord, from = 14, to = 15.09)
SNR<- 20*log10(abs(rms(m)-rms(w))/rms(w))


# Time to find the syllable- pause ratios
start.end <- fromto(song.extract)
# this loop will break up the list into manageable 'chunks'
for (n in 1:length(start.end)) {
  assign(paste0('s',n ), start.end[[n]])
}
#the phrases should be reviewed on an individual basis incase of variation,
#but this can be done automatically
signal.1 <- oscillo(env.song, f = f, from = s1[1], to = s1[2], plot = FALSE)
sig1.auto <- timer(signal.1,f = f,
                   threshold =10, msmooth=c(50,0),
                   envt= 'hil',dmin= 0.06,
                   plot = TRUE)
sig1.auto$r # this will print the ratio

signal.2 <- oscillo(env.song, f = f, from = s2[1], to = s2[2], plot = FALSE)
sig2.auto <- timer(signal.2,f = f,
                   threshold =10, msmooth=c(50,0),
                   envt= 'hil',dmin= 0.06,
                   plot = TRUE)
sig2.auto$r

signal.3 <- oscillo(env.song, f =f , from = s3[1], to = s3[2], plot =FALSE)
sig3.auto<- timer(signal.3,f = f,
                              threshold =10, msmooth=c(50,0),
                              envt= 'hil',dmin= 0.06,
                              plot = TRUE)

sig3.auto$r
signal.4 <- oscillo(env.song, f = f, from = s4[1], to = s4[2], plot =FALSE)
sig4.auto<- timer(signal.4,f = f,
                  threshold =5, msmooth=c(50,0),
                  envt= 'hil',dmin= 0.06,
                  plot = TRUE)

sig4.auto$r
