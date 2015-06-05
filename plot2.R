## Second plot of the 1st assignment of the Exploratory data analysis

## Download data

setwd("/users/claudiagutierrezescribano/R/ExploratoryData/")

download.file("https://github.com/ClaudiaGEscribano/ExData_Plotting1/exdata_data_household_power_consumption.zip", "exdata_data_household_power_consumption.zip", method='wget')
unzip('exdata_data_household_power_consumption.zip')

## Read the data you have downloaded

powerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

## Date and time columns as Date and time data

powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")
powerConsumptionDays <- subset(powerConsumption, Date=="2007-02-01"| Date=="2007-02-02")
datetime <- paste(as.Date(powerConsumptionDays$Date), powerConsumptionDays$Time)
powerConsumptionDays$Datetime <- as.POSIXct(datetime)

## Graph 2

plot(powerConsumptionDays$Global_active_power~powerConsumptionDays$Datetime, type="l", ylab="Global Active Power (Kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()