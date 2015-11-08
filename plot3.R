# Load the data into R and subset to retain only
# the target timeframe.

epc <- read.table("./data/household_power_consumption.txt", 
    header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".", 
    nrows = 69525)
epc <- epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]

# Replace any missing values with "NA".

gsub("?", "NA", epc)

# Plot sub-metered energy metering over given days.

png("plot3.png", width=480, height=480)
dati <- strptime(paste(epc$Date, epc$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
plot(dati, as.numeric(epc$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(dati, as.numeric(epc$Sub_metering_2), type = "l", col = "red")
lines(dati, as.numeric(epc$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 3, col = c("black", "red", "blue"))
dev.off()