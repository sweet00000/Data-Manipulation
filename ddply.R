setwd("C:/Users/Sweet/Desktop/TOMATOE")

data <- read.csv("21s1501.csv")

library(plyr)
library(dplyr)
library(stringr)
head(data)

############################################

x <- pull(data, var = genotype)
   
y <- str_replace(x, "A", "1")
z <- str_replace(y, "H", "2")
x <- str_replace(z, "B", "3")

y <- as.numeric(x)

data[, "genotype"] <- y

by_P <- group_by(data, pedigree)

by_P <- summarize(by_P, 
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

x <- pull(by_P, var = genotype)


y <- str_replace(x, "1", "A")
z <- str_replace(y, "2", "H")
x <- str_replace(z, "3", "B")

by_P[, "genotype"] <- x

write.csv(by_P, file="output/AVE.150151.csv", row.names=FALSE)
