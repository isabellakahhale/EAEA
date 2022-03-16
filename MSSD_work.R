#authored by: Kelly Barry 
# Code to _____
#MSSD work with Empathic Accuracy video ratings 

#set working directory to the participant subfolder
setwd("/OneDrive/EA-EA/Data/participants/5_ps_06082021/combined_responses_by_participant")

#the above code wasn't working for IK so I added this -- kelly, ignore if the above code works for you
setwd("/Users/isabellakahhale/OneDrive - University of Pittsburgh/Isabella/Research/EA-EA/Data/participants/5_ps_06082021")

library("psych", "tidyverse", "dpylr")


#load in data
#hmmm... this isn't working for IK. 
files <- (Sys.glob("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/5_ps_06082021/combined_responses_by_participant"))

filenames <- list.files(files)
filenames
ldf <- lapply(filenames, read.csv)

paste("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/5_ps_06082021/combined_responses_by_participant", filenames, sep="/")

#extracting individual df's 
for (i in 1:length(ldf)){
  assign(paste(paste("df", i, sep=""), "mssd", sep="."), ldf[[i]])
  }

#for (i in 1:length(ldf)) {
#  separated_videos<-tidyr::pivot_wider(i, names_from = i[["source"]], values_from = i[["rating"]])
#}

#sapply(ldf, tidyr::pivot_wider(ldf[1:5], names_from = "source", values_from = "rating"))


#breaking up each video rating to a new variable 
df1_separated_videos<-tidyr::pivot_wider(df1.mssd, names_from = "source", values_from = "rating")


#extracting mssd, mean, sd from each video
mssd_each_vid <-lapply(df1_separated_videos[,3:11], function(x) mssd(x))
m_each_vid <-lapply(df1_separated_videos[,3:11], function(x) mean(x, na.rm=T))
sd_each_vid <-lapply(df1_separated_videos[,3:11], function(x) sd(x, na.rm=T))


mssd_each_vid<- as.data.frame(mssd_each_vid)
names(mssd_each_vid) <- gsub(".csv", "_mssd", names(mssd_each_vid))

m_each_vid<- as.data.frame(m_each_vid)
names(m_each_vid) <- gsub(".csv", "_mean", names(m_each_vid))

sd_each_vid<- as.data.frame(sd_each_vid)
names(sd_each_vid) <- gsub(".csv", "_sd", names(sd_each_vid))

saved_stats <- rbind(c(mssd_each_vid, m_each_vid, sd_each_vid))
saved_stats <- as.data.frame(saved_stats)

#adding participant ID column 
#saved_stats$participant_id <- ""
saved_stats$participant_id <- rbind(df1_separated_videos$participant_id)

#moving participant ID to the front 
#saved_stats<-saved_stats[, c(28, 1:27)]


saved_stats <- dplyr::bind_rows(c(mssd_each_vid, m_each_vid, sd_each_vid))


#STILL NEED TO GET: get 1 total MSSD, across all videos




#end product should be CSV with MSSD listed for each participant 
#write.csv(XX, 'mssd03102022.csv')

! manually push to GitHub repo









