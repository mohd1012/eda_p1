

dt<-read.table("household_power_consumption.txt",header = T,sep = ";", stringsAsFactors = F,na.strings = "?")
dt2<- dt[dt$Date== "1/2/2007" | dt$Date== "2/2/2007",]
rm(dt)

dt2$d <- as.Date(dt2$Date,"%d/%m/%Y")

dt2$t <- as.POSIXct(strptime(paste(dt2$Date, dt2$Time),"%d/%m/%Y %H:%M:%S"))


png(filename = "plot2.png", width=480, height=480)
plot(dt2$t, dt2$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)" )
dev.off()
