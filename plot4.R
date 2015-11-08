# Load the data into R and subset to retain only
# the target timeframe.

epc <- read.table("./data/household_power_consumption.txt", 
                  header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".", 
                  nrows = 69525)
epc <- epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]

# Replace any missing values with "NA".

gsub("?", "NA", epc)

# Merge date/time and set up for multi-plot.

dati <- strptime(paste(epc$Date, epc$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

# Create 4 separate plots.

plot(dati, as.numeric(epc$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power")

plot(dati, as.numeric(epc$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")

plot(dati, as.numeric(epc$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(dati, as.numeric(epc$Sub_metering_2), type = "l", col = "red")
lines(dati, as.numeric(epc$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 3, col = c("black", "red", "blue"))

plot(dati, as.numeric(epc$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global reactive power")

dev.off()