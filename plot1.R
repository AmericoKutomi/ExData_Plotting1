# install.packages('data.table')   ## use this line if the package is not installed
library(data.table)
## reading all data
#
dados <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", stringsAsFactors = TRUE)
## subsetting to a new data frame
#
feb <- dados[Date=="1/2/2007" | Date=="2/2/2007", ]  ## The dates were not converted
#
#
## plotting the histogram using as.numeric because the column was not converted
#
hist(as.numeric(feb$Global_active_power), 
     xlab = "Global Active Power (kilowatts)", 
     main="", col = 'red')
dev.copy(png, file ="plot1.png")  # file to be created in working directory
dev.off()