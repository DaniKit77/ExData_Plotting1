dt <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
TwoDay <- filter(dt, Date == "1/2/2007" | Date == "2/2/2007")
rm(dt)
png('plot3.png',width = 480, height = 480)
Sub_metering_1 <- as.numeric(TwoDay$Sub_metering_1)
Sub_metering_2 <- as.numeric(TwoDay$Sub_metering_2)
Sub_metering_3 <- as.numeric(TwoDay$Sub_metering_3)
x <- as.POSIXct(paste(TwoDay$Date, TwoDay$Time), format="%d/%m/%Y %H:%M:%S")
plot(x,Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(x, Sub_metering_1)
lines(x, Sub_metering_2, col = "red")
lines(x, Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, pt.cex = 1, cex = .8)

dev.off()
