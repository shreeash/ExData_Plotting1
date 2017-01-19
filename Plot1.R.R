fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "data.zip")
powerdata <- unzip("data.zip")
con <- read.table(powerdata, header = T, sep = ";")
con$Date <- as.Date(con$Date, format = "%d/%m/%Y")
pow <- con[con$Date >= "2007-02-01" & con$Date <= "2007-02-02",]
pow$Global_active_power<- as.numeric(as.character(pow$Global_active_power))
Plot1.png <- hist(pow$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png, file = "Plot1.png", height = 480, width = 480)
dev.off()