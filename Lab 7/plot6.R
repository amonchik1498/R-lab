NEI <- readRDS( "C:/Users/PC ALLO/Desktop/summarySCC_PM25.rds" )
SCC <- readRDS( "C:/Users/PC ALLO/Desktop/Source_Classification_Code.rds" )

my_data1<-SCC[grep("Vehicle", SCC$SCC.Level.Three, ignore.case = T), ]
my_data2<-merge(NEI, my_data1, by.y ="SCC")

LA<-subset(my_data2, fips=="24510" | fips=="06037")
sumsLA<-aggregate(Emissions~fips+year, LA, sum)

png("C:/Users/PC ALLO/Desktop/plot6.png", width=480, height=480)
ggplot(sumsLA, aes(year, Emissions))+
  geom_line(aes(color=fips))+
  geom_point(aes(color=fips))+
  labs(title = "Total Emissions of PM2.5 from Motor Vehicle Sources
in Baltimore, Maryland and Los Angeles, California")+
  labs(x = "Year", y = "Emissions of PM2.5 (tons)")+
  scale_color_discrete(name = "Fips", labels = c("Los Angeles", "Baltimore"))

dev.off()
