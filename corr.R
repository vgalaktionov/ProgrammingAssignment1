library(stringr)

corr <- function(directory,threshold=0, id=001:332) {
  polcor<- numeric()
  for (i in 1:length(id)) { #for each of the file ids
    id00<-str_pad(id[i], width=3,side="left",pad="0") ## padding id with zeroes to width 3
    filename<- paste(id00,".csv",sep="") ## converting id00 to filename
    filepath<-paste(directory,"/",filename,sep="") ## converting filename to filepaths
    data<-read.csv(filepath) ## read file
    data<-na.omit(data)## omit missing
      if (nrow(data)>threshold) { ## if threshold reached, calculate correlation and append to output
          polcor<-c(polcor,cor(data[,"sulfate"],data[,"nitrate"]))
      }
  }
  polcor

}
