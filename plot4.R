#This script is solution to Exploratory Data Analysis course project plot2
#Goal is to make plot of Global Activw Power (kilowats) in time during 01/02/207 and 02/01/2007

#reading data file
householdPC <- read.table("household_power_consumption.txt", 
                          header = TRUE,
                          dec = ".",
                          stringsAsFactors = FALSE,
                          sep=";")

#selecting relevant data and making proper formats
plotingData <- householdPC[householdPC$Date == "1/2/2007" | householdPC$Date == "2/2/2007", ]
plotingData$Global_active_power <- as.numeric(plotingData$Global_active_power)
plotingData$Global_reactive_power <- as.numeric(plotingData$Global_reactive_power)
plotingData$Voltage <- as.numeric(plotingData$Voltage)
plotingData$DateTime <- as.POSIXct(paste(plotingData$Date, plotingData$Time, sep = " "),
                                   format = "%d/%m/%Y %H:%M:%S")

#creating plot
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(plotingData$DateTime, plotingData$Global_active_power, xlab = "",
                                                            ylab = "Global Active Power (kilowats)", 
                                                            type = "l")
plot(plotingData$DateTime, plotingData$Voltage, xlab = "datetime",
                                                ylab = "Voltage", 
                                                type = "l")
plot(plotingData$DateTime, plotingData$Sub_metering_1, xlab = "",
                                                       ylab = "Energy submetering", 
                                                       type = "l")
lines(plotingData$DateTime, plotingData$Sub_metering_2, xlab = "",
                                                        col  = "red",
                                                        type = "l")
lines(plotingData$DateTime, plotingData$Sub_metering_3, xlab = "",
                                                        col  = "blue", 
                                                        type = "l")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1",
                                                                                 "Sub_metering_2",
                                                                                 "Sub_metering_3"))
plot(plotingData$DateTime, plotingData$Global_reactive_power, xlab = "",
                                                              ylab = "Global Reactive Power", 
                                                              type = "l")


dev.off()