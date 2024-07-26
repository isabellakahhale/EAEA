#authored by: Kelly Barry 
# Code to pull MSSD and descriptive stats from participant video ratings

library("psych", "tidyverse", "dpylr")

#set working directory to the participant subfolder
#  ** depending who is running the code, may need to change working directory for script to run

#for KB 



# will need to repeat for every participant folder directory 
#  ** depending on your OneDrive file organization, may need to change file path script to work

#for KB: setwd('~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/5_ps_06082021/combined_responses_by_participant')
fold_name1 <- "~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/5_ps_06082021/combined_responses_by_participant"


#for KB: setwd('/Users/kellybarry/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_01312022/combined_responses_by_participant')
fold_name2 <- "/Users/kellybarry/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_01312022/combined_responses_by_participant"

#for KB: setwd('/Users/kellybarry/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/combined_responses_by_participant')
fold_name3 <- "/Users/kellybarry/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/combined_responses_by_participant"


# lists subfolders within working directory 
# ** will need to change **fold_name** AND **working directory** for each participant directory
filenames <- list.files(fold_name3)
filenames

#creates a list of data frames, 1 df for each participant in directory
  #ldf = list of data frames
ldf <- lapply(filenames, read.csv)


#custom function, will allow df's to be "flattened" 
  #i.e., going from 1 long variable for all video ratings --> 8 long-form variables for each video
pivot_df <- function(df){
  tidyr::pivot_wider(df, names_from = "source", 
                     values_from = "rating") -> new_df
  return(new_df)
}


#create empty list for the names of df's within your list 
  #relevant for the 'for loop' below
ldf_names <- c()


#Extracting individual dfs for each participant
  #creates data frame for each participant from our list of dfs 
for (i in 1:length(ldf)){
  ldf_names[i] <- paste(paste("df", i, sep=""), "mssd", sep="_")
  }

# For every df in ldf, create a variable for each video  (this will allow us to calculate a MSSD for each video later)
  # example: creates df1.mssd.flattened to df5.mssd.flattened
mssd_list <- list()
for (i in 1:length(ldf)){
  temp <- ldf[[i]] 
  new_name <- paste(ldf_names[[i]],"_flattened",sep="")
  assign(new_name, as.data.frame(pivot_df(temp)))
  mssd_list[[i]] <- as.data.frame(pivot_df(temp))
}


#KB notes to self: 
  # do this in a loop/function, so I can do it for multiple participants/ folders of participants (and not each one individually)
  # storing the MSSD, M, SD for each video, for each participant as a new data frame

#empty data frame for MSSDs to go 
  #only need to reset this when running all participants (or else it will over write participant you previously calculated MSSDs for)
#allData <- data.frame()

#extracts MSSD for each video, adds participant ID, and binds rows together
  # allData = data frame with all MSSD info
for (i in 1:length(mssd_list)){
  mssd_row <- lapply(mssd_list[[i]][,3:11], function(x) mssd(x))
  mssd_row <- as.data.frame(mssd_row)
  partID <- mssd_list[[i]][1,2]
  fullRow <- cbind(partID,mssd_row)
  allData <- rbind(allData,fullRow)
}

#making things pretty 
#rename variables; rename(df, new name = old name )
colnames(allData)

allData <- dplyr::rename(allData, "120_4_mssd" = "X120_4.csv")
allData <- dplyr::rename(allData, "128_2_mssd" = "X128_2.csv")
allData <- dplyr::rename(allData, "129_2_mssd" = "X129_2.csv")
allData <- dplyr::rename(allData, "147_2_mssd" = "X147_2.csv") 
allData <- dplyr::rename(allData, "167_2_mssd" = "X167_2.csv")  
allData <- dplyr::rename(allData, "173_6_mssd" = "X173_6.csv")  
allData <- dplyr::rename(allData, "174_3_mssd" = "X174_3.csv")
allData <- dplyr::rename(allData, "181_2_mssd" = "X181_2.csv")
allData <- dplyr::rename(allData, "practice_mssd" = "practice.csv")

#end product should be CSV with MSSD listed for each participant 
#setwd('/Users/kellybarry/OneDrive - University of Pittsburgh/EA-EA/Analysis/')
#write.csv(allData, 'mssd03242022.csv')


#Calculating average MSSD for each video 

#load data 
allData <- read.csv("CONFIRM MOST UPDATED CSV")

#optional, clean up environment
  #rm(list=(ls()[ls()!="allData"]))

#average MSSD for each video 
summary(allData$'120_4_mssd')
sd(allData$'120_4_mssd') 

summary(allData$'128_2_mssd')
sd(allData$'128_2_mssd') #

summary(allData$'129_2_mssd')
sd(allData$'129_2_mssd') #

summary(allData$'147_2_mssd')
sd(allData$'147_2_mssd') #

summary(allData$'167_2_mssd')
sd(allData$'167_2_mssd') #

summary(allData$'173_6_mssd')
sd(allData$'173_6_mssd') #

summary(allData$'174_3_mssd')
sd(allData$'174_3_mssd') #

summary(allData$'181_2_mssd')
sd(allData$'181_2_mssd') #


summary(allData$'practice_mssd')
sd(allData$'practice_mssd') #

plot(allData$'174_3_mssd')


#individual participant MSSD avgs 
  #exclude videos:  129_2, 147_2
mssd$total_MSSD_per_participant <- rowMeans(mssd[,c(3, 4, 7, 8, 9, 10)], na.rm=T)
head(mssd$total_MSSD_per_participant)

library(ggplot2)
ggplot(mssd, aes(x=X, y=total_MSSD_per_participant)) + geom_point() +
  labs(title="Distribution of Average MSSD Values",
       x="Participant", y = "MSSD")

#save.image(file = "EAEA_MSSD_work.RData")
! manually push to GitHub repo


#next steps for KB: 
  #for loop for MEAN for each vid
  #for loop for SD for each vid 








