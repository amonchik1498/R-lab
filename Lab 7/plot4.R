library(dplyr)

NEI <- readRDS( "C:/Users/PC ALLO/Desktop/summarySCC_PM25.rds" )
SCC <- readRDS( "C:/Users/PC ALLO/Desktop/Source_Classification_Code.rds" )

NEISCC <- merge(NEI,SCC,by.x="SCC",by.y="SCC")
NEISCCCoal <- NEISCC[which(grepl("Coal",NEISCC$EI.Sector)==TRUE),]
NEISCCCoal2 <- tapply(NEISCCCoal$Emissions,NEISCCCoal$year,sum)

png("C:/Users/PC ALLO/Desktop/plot4.png", width=480, height=480)
plot(names(NEISCCCoal2),NEISCCCoal2,type="b",col="red",xlab="Year",ylab="Total Emissions PM2.5 from Coal Combustion sources")
dev.off()
