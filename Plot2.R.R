fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "data.zip")
powerdata <- unzip("data.zip")
con <- read.table(powerdata, header = T, sep = ";")
con$Date <- as.Date(con$Date, format = "%d/%m/%Y")
pow <- con[con$Date >= "2007-02-01" & con$Date <= "2007-02-02",]
pow$Global_active_power<- as.numeric(as.character(pow$Global_active_power))
pow <- transform(pow, dt = as.POSIXct(paste(Date, Time)), format = "%d/%m/%Y %H:%M:%S")
Plot2.png <- plot(pow$dt, pow$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot2.png", height = 480, width = 480)
dev.off()