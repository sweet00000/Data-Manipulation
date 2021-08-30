
setwd("C:/Users/Sweet/Desktop/TOMATOE/done/MS/fruitscans_21S121")
files <- list.files(pattern = ".csv", recursive=F)
newtable<-NULL

for (i in 1:length(files)){
  
  setwd("C:/Users/Sweet/Desktop/TOMATOE/done/MS/fruitscans_21S121")
 
  
  head1<-basename(files[i])
  
  data <- read.csv(head1 , header=F)
  
  head2 <- data[2,2]
 
  head <- rbind(head1,head2)
  
  newtable <- cbind(newtable,head)
  
  }

setwd("C:/Users/Sweet/Desktop/TOMATOE/done/MS/fruitscans_21S121")
write.csv(newtable,"final_merged.csv")

