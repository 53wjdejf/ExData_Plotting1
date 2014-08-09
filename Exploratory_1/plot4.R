Sys.setlocale("LC_TIME", "English")
a <- read.csv("household_power_consumption.txt", sep = ";", nrows = 80000)
a1 <- a[a$Date == "1/2/2007" | a$Date == "2/2/2007", ]
a2 <- a1
a2$Date <- strptime(paste(a1$Date,a1$Time), "%d/%m/%Y %H:%M:%S")
a2$Global_active_power <- as.numeric(as.character(a2$Global_active_power))
a2$Global_reactive_power <- as.numeric(as.character(a2$Global_reactive_power))
a2$Voltage <- as.numeric(as.character(a2$Voltage))
a2$Sub_metering_1 <- as.numeric(as.character(a2$Sub_metering_1))
a2$Sub_metering_2 <- as.numeric(as.character(a2$Sub_metering_2))
a2$Sub_metering_3 <- as.numeric(as.character(a2$Sub_metering_3))

png(filename = 'plot4.png', width = 480, height = 480, units = 'px')
par(mfrow=c(2,2), bg="transparent")
with(a2, {
        plot(Date, Global_active_power, type="l",
             xlab="", ylab="Global Active Power")
        plot(Date, Voltage, type="l",
             xlab="datetime", ylab="Voltage")
        plot(Date, Sub_metering_1, type="l",
             xlab="", ylab="Energy sub metering")
        with(a2, points(Date, Sub_metering_2, type="l", col="red"))
        with(a2, points(Date, Sub_metering_3, type="l", col="blue"))
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               bty="n", lwd=2, col=c("black","red","blue"), lty=c(1,1,1))
        plot(Date, Global_reactive_power, type="l",
             xlab="datetime")
        })
dev.off()