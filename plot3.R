

dt<-read.table("household_power_consumption.txt",header = T,sep = ";", stringsAsFactors = F,na.strings = "?")
dt2<- dt[dt$Date== "1/2/2007" | dt$Date== "2/2/2007",]
rm(dt)

dt2$d <- as.Date(dt2$Date,"%d/%m/%Y")

dt2$t <- as.POSIXct(strptime(paste(dt2$Date, dt2$Time),"%d/%m/%Y %H:%M:%S"))

# (5). Create png file for Plot 3.  The hex RGB value for the bar colour was taken from the example
png(filename = "plot3.png", width=480, height=480)
plot(dt2$t, dt2$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
points(dt2$t, dt2$Sub_metering_1, col = "black", type = "l")
points(dt2$t, dt2$Sub_metering_2, col = "red", type = "l")
points(dt2$t, dt2$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3") )
dev.off()
