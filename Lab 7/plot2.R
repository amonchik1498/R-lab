NEI <- readRDS( "C:/Users/PC ALLO/Desktop/summarySCC_PM25.rds" )
SCC <- readRDS( "C:/Users/PC ALLO/Desktop/Source_Classification_Code.rds" )

sums2<-aggregate(Emissions~fips+year, NEI, sum)
Baltimore<-subset(sums2, fips=="24510")

png("C:/Users/PC ALLO/Desktop/plot2.png", width=480, height=480)

plot(Baltimore$year, 
     Baltimore$Emissions, 
     type = "l", xlab = "Year",  
     ylab = "Emissions of PM2.5 (tons)", 
     main = "Total Emissions of PM2.5 from all Sources in Baltimore, Maryland", 
     xaxt = "n")

axis(1, 
     at = c(1999,2002,2005,2008), 
     labels = c(1999,2002,2005,2008));

dev.off()
