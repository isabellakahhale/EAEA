#MSSD work with Empathic Accuracy video ratings 

setwd('~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/5_ps_06082021/combined_responses_by_participant')
library("psych", "tidyverse", "dplyr")

#load in data
files <- (Sys.glob("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/5_ps_06082021/combined_responses_by_participant"))

filenames <- list.files(files)
filenames
ldf <- lapply(filenames, read.csv)

paste("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/5_ps_06082021/combined_responses_by_participant", filenames, sep="/")

#extracting individual df's 
for (i in 1:length(ldf))
  assign(paste(paste("df", i, sep=""), "summary", sep="."), res[[i]])



#test data w 1 participant
df1<-read_csv("all_ea_vid_ratings_5eba15915da926159040f442.csv")  
df1 <- dplyr::select(df1, -participant_id)

#subset video variables 
  #want data in long format



#descriptives
summary(df1$rating)
sd(df1$rating)


?psych::mssd

psych::mssd(df1$rating, lag=1, group=NULL)



! manually push to GitHub repo









