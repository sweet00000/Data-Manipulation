setwd("C:/Users/Sweet/Desktop/TOMATOE")  #set working directory/folder

data <- read.csv("21s1501.csv")          #read and work in "21s1501.csv", set as variable "data"

library(plyr)                            #download plyr
library(dplyr)                           #download dplyr
library(stringr)                         #download stringr 
############################################
x <- pull(data, var = genotype)          #select and work within the column headed by "genotyope"
   
y <- str_replace(x, "A", "1")            #in the genotype columnn, replace all A's with 1 
z <- str_replace(y, "H", "2")            #in the genotype columnn with all A's replaced with 1, replace all H's with 2
x <- str_replace(z, "B", "3")            #in the genotype columnn with all A's replaced with 1 and all H's with 2, replace all B's with 3

y <- as.numeric(x)                       #set the new genotype column's characters as numeric values to be manipulated mathematically later

data[, "genotype"] <- y                  #add the new genotype column back to the original spreadsheet

by_P <- group_by(data, pedigree)         #group the rows by their pedigree numbers

by_P <- summarize(by_P,                  #in each group average the values by column
                  genotype = mean(genotype, na.rm = TRUE),
          
                  mean.area = mean(area, na.rm = TRUE), 
          
                  mean.tomato.pericarp.area = mean(tomato.pericarp.area,
                                                   na.rm = TRUE), 
           
                  mean.tomato.pericarp.area.ratio = mean(tomato.pericarp.area.ratio,
                                                         na.rm = TRUE), 
          
                  mean.tomato.pericarp.thickness = mean(tomato.pericarp.thickness,
                                                        na.rm = TRUE),
          
                  mean.tomato.pericarp.thickness.ratio = mean(tomato.pericarp.thickness.ratio,
                                                              na.rm = TRUE))

x <- pull(by_P, var = genotype)          #select and work within the column headed by "genotyope" to replace the numeric representative with the date wanted

y <- str_replace(x, "1", "A")            #in the genotype columnn, replace all 1s with A 
z <- str_replace(y, "2", "H")            #in the genotype columnn with all 1s with A, replace all 2s with H
x <- str_replace(z, "3", "B")            #in the genotype columnn with all 1s replaced with A and all 2s with H, replace all 3s with b

by_P[, "genotype"] <- x                  #add the new genotype column back to the averaged spreadsheet

                                         #make a new csv file with the averaged values
write.csv(by_P, file="output/AVE.150151.csv", row.names=FALSE) 
