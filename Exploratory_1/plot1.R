a <- read.csv("household_power_consumption.txt", sep = ";", nrows = 80000)
a1 <- a[a$Date == "1/2/2007" | a$Date == "2/2/2007", ]
a2 <- a1
a2$Date <- strptime(paste(a1$Date,a1$Time), "%d/%m/%Y %H:%M:%S")
a2$Global_active_power <- as.numeric(as.character(a2$Global_active_power))

png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
par(bg="transparent")
with(a2, hist(Global_active_power, freq=16, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency"))
dev.off()