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
feb$GAP = as.numeric(feb$Global_active_power)
#
## plotting the Chart
#
plot(feb$DataHora, feb$GAP, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file ="plot2.png")  # file to be created in working directory
dev.off()