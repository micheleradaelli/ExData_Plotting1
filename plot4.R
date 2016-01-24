#Download and unzip file
unzip("./household_power_consumption.zip")
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "./household_power_consumption.zip", method = "curl")

#Read in data and save as data
data <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

#Subset to 2007-02-01 and 2007-02-02
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Create DateTime column
data$DateTime <- with(data, as.POSIXlt(strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")))

#Create png file
png(file="plot4.png")

#Set par for 2 columns and 2 rows
par(mfrow=c(2,2))

#Draw first plot
plot(data$DateTime, data$Global_active_power,
type="l",
xlab=" ",
ylab="Global Active Power")

#Draw second plot
plot(data$DateTime, data$Voltage,
type="l",
xlab="datetime",
ylab="Voltage")

#Draw third plot
plot(data$DateTime, data$Sub_metering_1,
type="l",
xlab=" ",
ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
#Add legend
legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty = "solid", col = c("black","red","blue"))

#Draw fourth plot
plot(data$DateTime, data$Global_reactive_power,
type="l",
xlab="datetime",
ylab="Global_reactive_power")

#Close device
dev.off()