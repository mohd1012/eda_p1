
dt<-read.table("household_power_consumption.txt",header = T,sep = ";", stringsAsFactors = F,na.strings = "?")
dt2<- dt[dt$Date== "1/2/2007" | dt$Date== "2/2/2007",]
rm(dt)

dt2$d <- as.Date(dt2$Date,"%d/%m/%Y")

dt2$t <- as.POSIXct(strptime(paste(dt2$Date, dt2$Time),"%d/%m/%Y %H:%M:%S"))


png(filename = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))

# Plot 1,1 Global Active Power 
plot(dt2$t, dt2$Global_active_power, type = "l", xlab = "", ylab="Global Active Power" )

# Plot 1,2 Voltage
plot(dt2$t, dt2$Voltage, type = "l", xlab = "datetime", ylab="Voltage" )

# Plot 2,1 Energy Sub Numbering
 plot(dt2$t, dt2$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
points(dt2$t, dt2$Sub_metering_1, col = "black", type = "l")
points(dt2$t, dt2$Sub_metering_2, col = "red", type = "l")
points(dt2$t, dt2$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty = "n" )

# Plot 2,2 Global Reactive Power
plot(dt2$t, dt2$Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_reactive_power" )

dev.off()