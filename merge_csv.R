setwd("C:/Users/Sweet/Desktop/TOMATOE/KT excels")
files <- list.files(pattern = ".csv", recursive=F)
newtable<-NULL

for (i in 1:length(files)){
  
  setwd("C:/Users/Sweet/Desktop/TOMATOE/KT excels")
  
  filename<-basename(files[i])
  
  data <- read.csv(filename, header=F)
  
  data$V1 <- as.numeric(data$V1)
  
  data[is.na(data)] <- "delete"
  
  colnames(data)[1] <- "num"
  
  data <- data[!(data$num=="delete"),]
  
  head <- cbind(filename,data)
  
  newtable <- rbind(newtable,head)
  
}

colnames(newtable)[2:12] = c("num", 
                             "area",
                             "average_red",
                             "average_green",
                             "average_blue",
                             "average_luminosity",
                             "average_l_value",
                             "average_a_value",
                             "average_b_value",
                             "average_hue",
                             "average_chroma")

setwd("C:/Users/Sweet/Desktop/TOMATOE")

write.csv(newtable,"Merged_KTexcels.csv")

