fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "data.zip")
powerdata <- unzip("data.zip")
con <- read.table(powerdata, header = T, sep = ";", na.strings = "?")
con$Date <- as.Date(con$Date, format = "%d/%m/%Y")
pow <- con[con$Date >= "2007-02-01" & con$Date <= "2007-02-02",]
pow$Global_active_power <- as.numeric(as.character(pow$Global_active_power))
pow$Sub_metering_1 <- as.numeric(as.character(pow$Sub_metering_1))
pow$Sub_metering_2 <- as.numeric(as.character(pow$Sub_metering_2))
pow$Sub_metering_3 <- as.numeric(as.character(pow$Sub_metering_3))
pow <- transform(pow, dt = as.POSIXct(paste(Date, Time)), format = "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))
plot(pow$dt, pow$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(pow$dt, pow$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", ylim = range(pow$Voltage))
plot(pow$dt, pow$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(pow$dt, pow$Sub_metering_2, col = "red")
lines(pow$dt, pow$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1, cex = 0.25) 
plot(pow$dt, pow$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = range(pow$Global_reactive_power))
dev.copy(png, file = "Plot4.png", height = 480, width = 480)
dev.off()