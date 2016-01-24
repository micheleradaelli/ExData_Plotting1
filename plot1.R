
#Download and unzip file
unzip("./household_power_consumption.zip")
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "./household_power_consumption.zip", method = "curl")

#Read in data and save as data
data <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

#Format data and time
data$Date <-strptime(data$Date,"%d/%m/%Y")
data$Time <-strptime(data$Time,"%H:%M:%S")

#Subset to 2007-02-01 and 2007-02-02
dates <- c("2007-02-01", "2007-02-02")
data <- subset(data, Date %in% dates)

#Create png file
png(file="plot1.png")

#Create histogram
hist(data$Global_active_power, xlab= "Global Active Power (kilowatts)", col="red", main="Global Active Power")

#Close device
dev.off()