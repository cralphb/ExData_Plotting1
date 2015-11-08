# Load the data into R and subset to retain only
# the target timeframe.

epc <- read.table("./data/household_power_consumption.txt", 
    header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".", 
    nrows = 69525)
epc <- epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]

# Replace any missing values with "NA".

gsub("?", "NA", epc)

# Plot global active power over given days.

png("plot2.png", width=480, height=480)
dati <- strptime(paste(epc$Date, epc$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
plot(dati, as.numeric(epc$Global_active_power), type = "l",
     xlab = "",
     ylab = "Global Active Power (killowatts)")
dev.off()