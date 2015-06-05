## 4th plot of the 1st assignment of the Exploratory data analysis

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

par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,2,2,2))
with(powerConsumptionDays, {plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="Datetime")
plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
legend("topright",col=c("black","red","blue"), lty =1, lwd =2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), xjust=0, yjust=0, x.intersp=0,y.intersp=0.3, inset=0,0)
plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power (kilowatts)",xlab="Datetime")
})


dev.copy(png, file="plot4.png",height=800, width=800)
dev.off()
