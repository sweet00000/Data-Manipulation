setwd("C:/Users/Sweet/Desktop/TOMATOE")                                               #set working directory/folder

data <- read.csv("21s1501.csv")                                                       #read/open file "21s1501.csv"

data$genotype<-factor(data$genotype,levels=c("A","H", "B"))                           #give the posible factors in column "genotype" an order they must follow

library(ggplot2)                                                                      #download ggplot2
library(ggpubr)                                                                       #download ggpubr

#######################################################
for (i in 7:11) {                                                                     #loop for moving to each column consecutivly
  
 
  z <- names(data[i])                                                                 #for the current column take the header name and make it variable z
  
  
  p <- ggplot(data, aes(x = pedigree,                                                 #create a plot with pedigree as the x axis and the current column header name as the Y axis
                        y = data[ , i])) 
  
  p <- p + labs(y = z)                                                                #label the y axis with the current column name
  
  p <- p + geom_boxplot(outlier.shape = NA,                                           #make the plot a boxplot, get rid of asthetic outlier points, and color each box by the factor "genotype"
                        aes(fill = genotype))
  
  p <- p + geom_jitter(aes(color = ripeness,                                          #add the individual measurments as esthetic points, color these points by the factor "ripeness", change the shape of these points by the factor "lc'/locule number
                           shape = factor(lc)))
  
  p <- p + scale_color_manual(values=c ("#D7E900", "#18E900", "#E99A00", "#E90000"))  #setting the colors to color the "ripeness" factor by
  
  
  ##############################################################
  p <- p + facet_grid(lc~genotype,                                                    #facet the plot by the factor "lc" verticlally and horizontally by the factor "genotype"
                      scales = "free_x")                                              #get rid of points in the x axis that are blank becasue they are in a different facet
  
  
  p <- p + theme(axis.text.x = element_text(angle = 90,                               #rotate the x axis point names by 90 degrees so they do not overlap
                                            vjust = 0.5, 
                                            hjust=1))
  
  
  p <- p + theme(panel.grid.major = element_blank(),                                  #set the bacround to plain white and add a boundry line around the ousideof the plot
                 panel.grid.minor = element_blank(),
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black"))
 
  
####################################################################3
  
  jpeg(paste(z,"_21S1501.jpeg"), res=600, units = 'cm', height = 15, width = 30)     #export the plot as a jpeg and name it the column name followed by "_21S1501.jpeg"
  
  plot(p)                                                                            #show the plot
  
  dev.off()                                                                          #end the loop
}
 
