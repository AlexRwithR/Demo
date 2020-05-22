# Implementing analysis techniques used for another paper 
# Downloading files
library(tuneR)
library(warbleR)
library(seewave)
library(tidyverse)
library(dplyr)

tuneR::setWavPlayer('/usr/bin/afplay')
# www.xeno-canto.org/322837/download

#Download the file
# This file was recorded by Peter Boesman and posted on xeno-canto
# I orginally found this recording while working a larger project,
# by selecting 10 yellow warbler song recordings. This specific file was chosen for it's demostration valu
download.file('www.xeno-canto.org/322837/download',
              "/Users/filelocation/demorec.mp3", quiet = TRUE)
rec.location<-"/Users/filelocation/demorec.mp3"
mp32wav()
demrecord<-readMP3(rec.location)
oscillo(demrecord)

