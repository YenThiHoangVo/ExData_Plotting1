# Read in Data
data <- read.table("~/Downloads/Exploratory Data Analysis/household_power_consumption.txt", 
                   header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
# Explore data
#str(data)
#head(data)

# Subset data from the dates 2007-02-01 and 2007-02-02
subdata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
#str(subdata)

png("plot3.png", width = 480, height = 480)
global.active.power <-as.numeric(subdata$Global_active_power)
datetime <-strptime(paste(subdata$Date, subdata$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")
#with(subdata, sapply(c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), as.numeric))
Sub_metering_1 <-as.numeric(subdata$Sub_metering_1)
Sub_metering_2 <-as.numeric(subdata$Sub_metering_2)
Sub_metering_3 <-as.numeric(subdata$Sub_metering_3)

#with(subdata, {
#  plot(Sub_metering_1~datetime, type = "l", xlab = "", ylab= "Energy sub metering")
#})

plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab= "Energy sub metering")
lines(datetime, Sub_metering_2, type = "l", col="red")
lines(datetime, Sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5,
       col=c("black", "red", "blue"))
dev.off()
