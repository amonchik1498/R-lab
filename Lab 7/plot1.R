NEI <- readRDS( "C:/Users/PC ALLO/Desktop/summarySCC_PM25.rds" )
SCC <- readRDS( "C:/Users/PC ALLO/Desktop/Source_Classification_Code.rds" )

sums <- aggregate(Emissions~year, NEI, sum)
format(sums$Emissions,scientific=FALSE)

png("C:/Users/PC ALLO/Desktop/plot1.png", width=480, height=480)
plot(sums, 
     type = "l", 
     xlab = "Year",  
     ylab = "Emissions of PM2.5 (tons)", 
     main = "Total Emissions of PM2.5 from all U.S. Sources", xaxt = "n")

axis(1, at = c(1999,2002,2005,2008), labels = c(1999,2002,2005,2008));
dev.off()
