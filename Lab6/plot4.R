my_data<-read.table("C:/Users/PC ALLO/Desktop/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

my_lab <-subset(my_data, Date=="1/2/2007" | Date=="2/2/2007")

my_lab$DateTime<-paste(my_lab$Date, my_lab$Time)
my_lab$DateTime<-strptime(my_lab$DateTime, "%d/%m/%Y %H:%M:%S")
my_lab$Date<-as.Date(my_lab$Date, "%d/%m/%Y")

png("C:/Users/PC ALLO/Desktop/plot4.png", width=480, height=480)
plot(my_lab$DateTime, 
     my_lab$Sub_metering_1, 
     type = "l", xlab = "", ylab = "Energy sub metering")

lines(my_lab$DateTime, 
      my_lab$Sub_metering_2, 
      type = "l", col = "red")

lines(my_lab$DateTime, 
      my_lab$Sub_metering_3, 
      type = "l", col = "blue")

legend("topright", 
       lty = c(1, 1, 1), 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), 
       bty = "n"
)
plot(my_lab$DateTime, 
     my_lab$Global_reactive_power, 
     type = "l", xlab = "datetime",  ylab = "Global_reactive_power")
dev.off()
