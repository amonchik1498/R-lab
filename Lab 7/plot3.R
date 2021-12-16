library(dplyr)
library(ggplot2)

NEI <- readRDS( "C:/Users/PC ALLO/Desktop/summarySCC_PM25.rds" )
SCC <- readRDS( "C:/Users/PC ALLO/Desktop/Source_Classification_Code.rds" )

sums3<-aggregate(Emissions~fips+type+year, NEI, sum)
Baltimore2<-subset(sums3, fips=="24510")

png("C:/Users/PC ALLO/Desktop/plot3.png", width=480, height=480)
qplot(x=year, 
      y=Emissions, 
      data=Baltimore2, 
      facets=.~type, 
      geom = c("point", "line"), 
      xlab = "Year", 
      ylab = "Emissions of PM2.5 (tons)", 
      main = "Total Emissions of PM2.5 by the Type of Source in Baltimore, Maryland", 
      color=type)

dev.off()
