dt <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
TwoDay <- filter(dt, Date == "1/2/2007" | Date == "2/2/2007")
rm(dt)
png('plot2.png',width = 480, height = 480)
y <- as.numeric(TwoDay$Global_active_power)
x <- as.POSIXct(paste(TwoDay$Date, TwoDay$Time), format="%d/%m/%Y %H:%M:%S")
plot(x,y, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
