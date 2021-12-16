NEI <- readRDS( "C:/Users/PC ALLO/Desktop/summarySCC_PM25.rds" )
SCC <- readRDS( "C:/Users/PC ALLO/Desktop/Source_Classification_Code.rds" )

vehicle<-SCC[grep("Vehicles", SCC$SCC.Level.Three, ignore.case = T), ]

my_data<-merge(NEI, vehicle, by ="SCC")

Baltimore3<-subset(my_data, fips=="24510")
sums4<-aggregate(Emissions~year, Baltimore3, sum)

png("C:/Users/PC ALLO/Desktop/plot5.png", width=480, height=480)
plot(sums4, type = "l", 
     xlab = "Year",  
     ylab = "Emissions of PM2.5 (tons)", 
     main = "Total Emissions of PM2.5 
     from Motor Vehicle Sources in Baltimore, Maryland", 
     xaxt = "n")

axis(1, at = c(1999,2002,2005,2008), labels = c(1999,2002,2005,2008));
dev.off()
