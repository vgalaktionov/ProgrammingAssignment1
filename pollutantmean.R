library(stringr)

pollutantmean <- function(directory, pollutant, id=001:332) {
    id00<-str_pad(id, width=3,side="left",pad="0") ## padding id with zeroes to width 3
    filename<- paste(id00,".csv",sep="") ## converting id00 to filenames
    filepath<-paste(directory,"/",filename,sep="") ## converting filenames to filepaths
    data<-do.call("rbind",lapply(filepath,read.csv)) ## reading all file paths and merging the resulting frames
    clean_data<-data[!is.na(data[,pollutant]),] ## omitting missing values in pollutant column
    sum(clean_data[[pollutant]])/nrow(clean_data) ## calculating mean
    
  }
