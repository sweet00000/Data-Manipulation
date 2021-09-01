setwd("C:/Users/Sweet/Desktop/TOMATOE/KT excels")    #set the working directory        
files <- list.files(pattern = ".csv", recursive=F)   #list all the files containing ".csv" and name the list "files"
newtable <- NULL                                     #create a new table with no data in it

for (i in 1:length(files)){                          #for loop, run the following code once for every file in the "files" list consecutively
  
  setwd("C:/Users/Sweet/Desktop/TOMATOE/KT excels")  #set the working directory 
  
  filename<-basename(files[i])                       #make the variable "filename" the filename of the file from the list "files" being worked on
  
  data <- read.csv(filename, header=F)               #read/work on the csv labeled with the filename of the file from the list "files" being worked on
  
  data$V1 <- as.numeric(data$V1)                     #change the class of the data in column 1 to numeric data
                                                       #only the numbers in the column 1 were kept, the rest of the data was changed into "NA"
  data[is.na(data)] <- "delete"                      #find all of the "NA" cells and replace them with "delete"
                                                       #this way I can delete by "delete" later
  colnames(data)[1] <- "num"                         #change the name of column 1 to "num" so it will work with the delete command
  
  data <- data[!(data$num=="delete"),]               #delete all rows containing delete in the "num" column
  
  head <- cbind(filename,data)                       #bind the filename and the data and call this new table "head"
  
  newtable <- rbind(newtable,head)                   #bind the "head" table to the blank table "newtable"
  
}                                                    #repeat for the next file in the list adding each file's "head" to the "newtable" in a row

colnames(newtable)[3:12] = c("area",                 #after every file has been added to "newtable", rename columns 3 through 12
                             "average_red",
                             "average_green",
                             "average_blue",
                             "average_luminosity",
                             "average_l_value",
                             "average_a_value",
                             "average_b_value",
                             "average_hue",
                             "average_chroma")

setwd("C:/Users/Sweet/Desktop/TOMATOE")              #set the working directory

write.csv(newtable,"Merged_KTexcels.csv")            #write "newtable" to the working directory with a new name
