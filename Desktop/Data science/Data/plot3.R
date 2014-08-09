Sys.setlocale("LC_TIME", "English")
a <- read.csv("household_power_consumption.txt", sep = ";", nrows = 80000)
a1 <- a[a$Date == "1/2/2007" | a$Date == "2/2/2007", ]
a2 <- a1
a2$Date <- strptime(paste(a1$Date,a1$Time), "%d/%m/%Y %H:%M:%S")
a2$Sub_metering_1 <- as.numeric(as.character(a2$Sub_metering_1))
a2$Sub_metering_2 <- as.numeric(as.character(a2$Sub_metering_2))
a2$Sub_metering_3 <- as.numeric(as.character(a2$Sub_metering_3))

png(filename = 'plot3.png', width = 480, height = 480, units = 'px')
par(bg="transparent")
with(a2, plot(Date, Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering"))
with(a2, points(Date, Sub_metering_2, type="l", col="red"))
with(a2, points(Date, Sub_metering_3, type="l", col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=2, col=c("black","red","blue"), lty=c(1,1,1))
dev.off()