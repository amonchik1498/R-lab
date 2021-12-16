my_data<-read.table("C:/Users/PC ALLO/Desktop/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

my_lab <-subset(my_data, Date=="1/2/2007" | Date=="2/2/2007")

my_lab$DateTime<-paste(my_lab$Date, my_lab$Time)
my_lab$DateTime<-strptime(my_lab$DateTime, "%d/%m/%Y %H:%M:%S")
my_lab$Date<-as.Date(my_lab$Date, "%d/%m/%Y")

png("C:/Users/PC ALLO/Desktop/plot1.png", width=480, height=480)
hist(my_lab$Global_active_power, 
     col="red", 
     xlab ="Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power"
)

dev.off()
