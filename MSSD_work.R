#MSSD work with Empathic Accuracy video ratings 

setwd('/Users/kellybarry/OneDrive - University of Pittsburgh/EA-EA/Data/participants/')

#load in data 


#loop code through each video rating for each response by participant --> for each task 
#what I want the code to do: 
  #loop through for each participant folder in "responses_by_participant"
      #loop through each video (in participant folder)
  #result: a data frame FOR EACH PARTICIPANT  that has ROWS ratings (at each timepoint) for each video (column)
    # each participant would have a data frame with all video data (this would then be reduced for MSSD calculations)
      #save this data frame in "responses by participant" participant file.... "combined_EA_responses" 

#find all folders in your directory
  dir<-"/Users/kellybarry/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant"
#get a list of all files in directory
  file_names<-list.files(path=dir, full.names = F)  
  file_names

    
for (f in 1:nrow(file_names)) {
  for (v in 1:nrow(videolist)){
     <- paste ("/Users/kellybarry/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant", identifier, "/", videolist$Vid_List[v], ".csv", sep = "")
  }
}


  
  
  
  
#subset video variables 


library(psych)
?psych::mssd

psych::mssd(x,group=NULL, lag = 1,na.rm=TRUE)

?autoR











