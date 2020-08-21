# Read in Data
data <- read.table("~/Downloads/Exploratory Data Analysis/household_power_consumption.txt", 
                   header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
# Explore data
#str(data)
#head(data)

# Subset data from the dates 2007-02-01 and 2007-02-02
subdata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
#str(subdata)

png("plot1.png", width = 480, height = 480)
global.active.power <-as.numeric(subdata$Global_active_power)
hist(global.active.power, col = "red", main="Global Active Power",
     xlab= "Global Active Power (kilowatts)")
dev.off()
