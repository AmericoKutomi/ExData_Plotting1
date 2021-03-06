# install.packages('data.table')   ## use this line if the package is not installed
library(data.table)
## reading all data
#
dados <- fread("household_power_consumption.txt", sep=";", header=TRUE, 
               na.strings = "?", stringsAsFactors = TRUE)
## subsetting to a new data frame
#
feb <- dados[Date=="1/2/2007" | Date=="2/2/2007", ]  ## The dates were not converted
#
# Creating Variables by conversion from character to DateTime and Numeric
feb$DataHora = as.POSIXct(strptime(paste(feb$Date," ",feb$Time), "%d/%m/%Y %H:%M:%S"))
feb$Sub1 = as.numeric(feb$Sub_metering_1)
feb$Sub2 = as.numeric(feb$Sub_metering_2)
feb$Sub3 = as.numeric(feb$Sub_metering_3)
#
## plotting the Chart
#
plot(feb$DataHora, feb$Sub1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(feb$DataHora, feb$Sub1, col = "black")
lines(feb$DataHora, feb$Sub2, col = "red")
lines(feb$DataHora, feb$Sub3, col = "blue")
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file ="plot3.png")  # file to be created in working directory
dev.off()