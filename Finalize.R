oscillo(demrecord)
# To extracteach song we can use my custom function phrase.zoom() which has three inputs
#   file.name - the name of the wave file
#   z         - the number of phrases
#   v         - a vector of time stamps to automatically zoom into. If v = NULL the fucntion
#               uses identify() to do select the time frame with a mouse & curser

#For demostration purposes lets see what the reults are when v = NULL
# Note this can be a slow process press esc to end at anytime 
phrase.zoom(demrecord, z = 4)

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
