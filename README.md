# Demo

Link to blog describing the project https://alexatallleks.wordpress.com/2020/06/11/sound-analysis-of-the-american-yellow-warbler/
Libraries/Packages needed:

library(tuneR)

library(warbleR)

library(seewave)

library(tidyverse)

library(dplyr)


This is a small demonstration of my coding and sound analysis prowess. Here I showcase some of the custom functions I created to expedite the sound analysis process. The code here is only a small part of a larger project, as more is completed I will continue to add to this portfolio. This portfolio is organized so that each script has a designated duty; whether that be creating a function, downloading file, or analysis of the file.

Recording.R is the script that downloads the the recording used for this demostration

Finalize.R is where the analysis occurs.

Phrase.zoom.R - Script for the function phrase.zoom() which allows you to select lengths of a signal or pause. The function displays a oscillogram that where you can 'zoom' to a desired signal for a more accurate analysis. Predetermined times can be entered to skip the zooming process. The function can create a list if multiple there are signals.

siglength.R- Once the start and end of the signals are determined and stored in a list the function signalleng() can be used to quickly determin the length of each signal

Signal Pause Ratio.R- Script for the SPR() function that finds the Signal Pause Ratio

from.to.R- Script that takes a list created by the phrase.zoom() functoin and removes the amplitude data


In this demonstration I use a recording of an American Yellow Warbler’s (Setophaga aestiva) song downloaded from xeno-canto. The code should automatically download the file. Credit goes to Peter Boesman (Peter Boesman, XC322837. Accessible at www.xeno-canto.org/322837)

Much of the sound analysis is done with the help and methods as described in "Sound Analysis and Synthesis with R" by Jérôme Sueur

