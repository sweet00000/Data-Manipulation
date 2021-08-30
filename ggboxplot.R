setwd("C:/Users/Sweet/Desktop/TOMATOE")

data <- read.csv("21s1501.csv")

data$genotype<-factor(data$genotype,levels=c("A","H", "B"))

library(ggplot2)
library(ggpubr)

#######################################################
for (i in 7:11) {
  
 
  z <- names(data[i])
  
  
  p <- ggplot(data, aes(x = pedigree,
                        y = data[ , i])) 
  
  p <- p + labs(y = z)
  
  p <- p + geom_boxplot(outlier.shape = NA, 
                        aes(fill = genotype))
  
  p <- p + geom_jitter(aes(color = ripeness,
                           shape = factor(lc)))
  
  p <- p + scale_color_manual(values=c ("#D7E900", "#18E900", "#E99A00", "#E90000"))
  
  
  ##############################################################
  p <- p + facet_grid(lc~genotype, 
                      scales = "free_x") 
  
  
  p <- p + theme(axis.text.x = element_text(angle = 90, 
                                            vjust = 0.5, 
                                            hjust=1))
  
  
  p <- p + theme(panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(),
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black"))
 
  
####################################################################3
  
  cname<-names(data[i])
  
  jpeg(paste(cname,"_21S1501.jpeg"), res=600, units = 'cm', height = 15, width = 30)
  
  plot(p)
  
  dev.off()
}
 
