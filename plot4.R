dt <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
TwoDay <- filter(dt, Date == "1/2/2007" | Date == "2/2/2007")
rm(dt)
#set up graph
png('plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))
x <- as.POSIXct(paste(TwoDay$Date, TwoDay$Time), format="%d/%m/%Y %H:%M:%S")


#Graph TopLeft (from original Plot2)
y <- as.numeric(TwoDay$Global_active_power)
plot(x,y, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#Graph TopRight
y <- as.numeric(TwoDay$Voltage)
plot(x,y, type = "l", ylab = "Voltage", xlab = "datetime")

#Graph BottomLeft
Sub_metering_1 <- as.numeric(TwoDay$Sub_metering_1)
Sub_metering_2 <- as.numeric(TwoDay$Sub_metering_2)
Sub_metering_3 <- as.numeric(TwoDay$Sub_metering_3)
plot(x,Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(x, Sub_metering_1)
lines(x, Sub_metering_2, col = "red")
lines(x, Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, pt.cex = 1, cex = .8)

#Graph BottomRight
y <- as.numeric(TwoDay$Global_reactive_power)
plot(x, y, type = "l", ylab = "Global_Reactive_Power", xlab = "datetime")

dev.off()
