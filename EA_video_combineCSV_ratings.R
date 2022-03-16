#authored by: Kelly Barry (primary) 
# Code to _____


# import packages
library(tidyverse)

# ----------------------------------------------
# setup

fold_name = "~/OneDrive - University of Pittsburgh/EA-EA/Data/participants"
# to check the subfolders within participants 
# uncomment the following
 list.files(fold_name)

# these are the "responses_by_participant" folders
fold1 = paste(fold_name, "20_ps_01312022",
                 "responses_by_participant",sep="/")
fold2 = paste(fold_name, "5_ps_06082021",
                 "responses_by_participant",sep="/")
fold3 = paste(fold_name, "20_ps_02212022",
                       "EA_Task", "responses_by_participant",
                       sep="/")
# add additional folders here
# fold_demo = paste(fold_name, "subfold1", "subfold2",
#                  "responses_by_participant", sep="/")

# ----------------------------------------------
# functions

# combineCSV takes a folder containing csvs
# and returns all csvs combined as one
# ***NOTE***: BECAUSE OF HOW FILE STRUCTURE IS ORGANIZED, MAY NEED TO CHANGE "PART_ID" NUMBER...
      #DEPENDING ON WORKING DIRECTORY, WILL NOT OUTPUT SUB ID 
      #fold1 & 2 = 8; fold 3 = 9
combineCSV <- function(sf){
  combined <- data.frame()
  subfold_files = list.files(sf)
  part_id = str_split(sf, pattern="/", simplify=TRUE)[9]
  for (fn in subfold_files){
    temp <- suppressMessages(read_csv(paste(sf,fn,sep="/")))
    temp$source <- fn
    temp$participant_id <- part_id
    if (nrow(combined)==0){
      combined = temp
    }
    else{
      combined = suppressMessages(full_join(combined, temp))
    }
  }
  return(combined)
}

# responseToList takes a "responses_by_participant" subfolder
# and returns a list of commands to copy paste
# see below for example
responseToList <- function(sf){
  print_list = c("")
  part_folds = list.files(sf)
  for (f in part_folds){
    address = paste(sf, f, sep="/")
    var_name = paste("data.",f,sep="")
    row1 <- paste(var_name, ' = combineCSV("', 
                  address, '")\n', sep="")
    row2 <- paste("write_csv(",var_name,', "', 'all_ea_vid_ratings_',
                  f, '.csv")\n', sep="")
    cat(row1)
    cat(row2)
    cat("\n\n")
    
  } 
}

# ----------------------------------------------
# creating CSVs

# for each "responses_by_participant" subfolder do the following
# run responseToList(subfolder)
# copy and paste the output into this file
# run the output
# example for fold1 below

responseToList(fold3)

# the above command outputs the following to console
# i didn't actually run any of the write_csv commands
# bc i don't want to mess w ur data
# but lmk if it works

#*****************
IMPORTANT -- WILL NEED TO CHANGE FOR EACH BATCH OF PARTICIPANTS
#*****************
## specify working directory where you want combined files saved 
  #new folder: combined_responses_by_participant

# DONE -- setwd('~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_01312022/combined_responses_by_participant')
# DONE -- setwd('~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/5_ps_06082021/combined_responses_by_participant')
# DONE -- setwd('~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/combined_responses_by_participant')


#NOTE / NEXT TO DO: 
  # possible (but JH might have code) -- creating separate columns for each video (instead of 1 long one)
            # this might not matter for long vs wide data format for MSSD
data.5664641951fac700118ed23f = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/5664641951fac700118ed23f")
write_csv(data.5664641951fac700118ed23f, "all_ea_vid_ratings_5664641951fac700118ed23f.csv")


data.58060d08b869700001d70b8c = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/58060d08b869700001d70b8c")
write_csv(data.58060d08b869700001d70b8c, "all_ea_vid_ratings_58060d08b869700001d70b8c.csv")


data.598fba148380cc00012a3ce7 = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/598fba148380cc00012a3ce7")
write_csv(data.598fba148380cc00012a3ce7, "all_ea_vid_ratings_598fba148380cc00012a3ce7.csv")


data.5a459ab2ee927b0001e1e1e2 = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/5a459ab2ee927b0001e1e1e2")
write_csv(data.5a459ab2ee927b0001e1e1e2, "all_ea_vid_ratings_5a459ab2ee927b0001e1e1e2.csv")


data.5aadbe52811b2000016f7633 = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/5aadbe52811b2000016f7633")
write_csv(data.5aadbe52811b2000016f7633, "all_ea_vid_ratings_5aadbe52811b2000016f7633.csv")


data.5bf43ba0f35e0c0001017133 = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/5bf43ba0f35e0c0001017133")
write_csv(data.5bf43ba0f35e0c0001017133, "all_ea_vid_ratings_5bf43ba0f35e0c0001017133.csv")


data.5c4f6c99b813a200011 = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/5c4f6c99b813a200011")
write_csv(data.5c4f6c99b813a200011, "all_ea_vid_ratings_5c4f6c99b813a200011.csv")


data.5e07e9301d6b46148c904a0e = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/5e07e9301d6b46148c904a0e")
write_csv(data.5e07e9301d6b46148c904a0e, "all_ea_vid_ratings_5e07e9301d6b46148c904a0e.csv")


data.5e69987e0873d600084bc920 = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/5e69987e0873d600084bc920")
write_csv(data.5e69987e0873d600084bc920, "all_ea_vid_ratings_5e69987e0873d600084bc920.csv")


data.5eb074c7e612c1129942044c = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/5eb074c7e612c1129942044c")
write_csv(data.5eb074c7e612c1129942044c, "all_ea_vid_ratings_5eb074c7e612c1129942044c.csv")


data.5ee8f4e489b70a246eba4d20 = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/5ee8f4e489b70a246eba4d20")
write_csv(data.5ee8f4e489b70a246eba4d20, "all_ea_vid_ratings_5ee8f4e489b70a246eba4d20.csv")


data.5f079536db2246057cc1109c = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/5f079536db2246057cc1109c")
write_csv(data.5f079536db2246057cc1109c, "all_ea_vid_ratings_5f079536db2246057cc1109c.csv")


data.60c93f189082587ea79ce324 = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/60c93f189082587ea79ce324")
write_csv(data.60c93f189082587ea79ce324, "all_ea_vid_ratings_60c93f189082587ea79ce324.csv")


data.60fcd8a2f65ff33a1f4529fd = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/60fcd8a2f65ff33a1f4529fd")
write_csv(data.60fcd8a2f65ff33a1f4529fd, "all_ea_vid_ratings_60fcd8a2f65ff33a1f4529fd.csv")


data.60fd05e540846ba7851b2928 = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/60fd05e540846ba7851b2928")
write_csv(data.60fd05e540846ba7851b2928, "all_ea_vid_ratings_60fd05e540846ba7851b2928.csv")


data.60fedf190a70c073469169b6 = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/60fedf190a70c073469169b6")
write_csv(data.60fedf190a70c073469169b6, "all_ea_vid_ratings_60fedf190a70c073469169b6.csv")


data.61030eae5d251329cef97eec = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/61030eae5d251329cef97eec")
write_csv(data.61030eae5d251329cef97eec, "all_ea_vid_ratings_61030eae5d251329cef97eec.csv")


data.6108103e7cdaf6c911ee5c4c = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/6108103e7cdaf6c911ee5c4c")
write_csv(data.6108103e7cdaf6c911ee5c4c, "all_ea_vid_ratings_6108103e7cdaf6c911ee5c4c.csv")


data.610958c8d6b3c73ee399faed = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/610958c8d6b3c73ee399faed")
write_csv(data.610958c8d6b3c73ee399faed, "all_ea_vid_ratings_610958c8d6b3c73ee399faed.csv")


data.614e0d0cd2f99ded7afb41cb = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/614e0d0cd2f99ded7afb41cb")
write_csv(data.614e0d0cd2f99ded7afb41cb, "all_ea_vid_ratings_614e0d0cd2f99ded7afb41cb.csv")


data.614fa7d7ccfa0a319e572dd4 = combineCSV("~/OneDrive - University of Pittsburgh/EA-EA/Data/participants/20_ps_02212022/EA_Task/responses_by_participant/614fa7d7ccfa0a319e572dd4")
write_csv(data.614fa7d7ccfa0a319e572dd4, "all_ea_vid_ratings_614fa7d7ccfa0a319e572dd4.csv")
