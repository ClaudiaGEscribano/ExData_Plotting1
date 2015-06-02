## 1st assignement of the exploratory data analysis

setwd("/users/claudiagutierrezescribano/R/ExploratoryData/")

download.file("https://github.com/ClaudiaGEscribano/ExData_Plotting1/exdata_data_household_power_consumption.zip", "exdata_data_household_power_consumption.zip", method='wget')
unzip('exdata_data_household_power_consumption.zip')

## Read the data you have downloaded

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
head(data) ## How the data looks like
names(data)

## Subsetting the 2 days I need

powerConsumption <- subset(data,Date=="1/2/2007"| Date=="2/2/2007")

## Graph

with(powerConsumption, hist(Global_active_power, col='red',main="Global Active Power", xlab="Global Active Power (kilowatts)"))

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()           
