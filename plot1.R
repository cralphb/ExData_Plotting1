# Load the data into R and subset to retain only
# the target timeframe.

epc <- read.table("./data/household_power_consumption.txt", 
  header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".", 
  nrows = 69525)
epc <- epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]

# Replace any missing values with "NA".

gsub("?", "NA", epc)

# Plot histogram of global active power and save to a PNG file.

png("plot1.png", width=480, height=480)
hist(as.numeric(epc$Global_active_power), col = "Red", 
     xlab = "Global Active Power (killowatts)", 
     main = "Global Active Power")
dev.off()