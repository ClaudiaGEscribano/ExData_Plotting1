## Third plot of the 1st assignment of the Exploratory data analysis

## Download data

setwd("/users/claudiagutierrezescribano/R/ExploratoryData/ExData_Plotting1")

download.file("https://github.com/ClaudiaGEscribano/ExData_Plotting1/exdata_data_household_power_consumption.zip", "exdata_data_household_power_consumption.zip", method='wget')
unzip('exdata_data_household_power_consumption.zip')

## Read the data you have downloaded

powerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

## Date and time columns as Date and time data

powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")
powerConsumptionDays <- subset(powerConsumption, Date=="2007-02-01"| Date=="2007-02-02")
datetime <- paste(as.Date(powerConsumptionDays$Date), powerConsumptionDays$Time)
powerConsumptionDays$Datetime <- as.POSIXct(datetime)

##Graph

with(powerConsumptionDays,{plot(powerConsumptionDays$Sub_metering_1~powerConsumptionDays$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright",col=c("black","red","blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png",height=480, width=480)
dev.off()

