#This script is solution to Exploratory Data Analysis course project plot3
#Goal is to make plot of Energy Submetering variables in time during 01/02/207 and 02/01/2007

#reading data file
householdPC <- read.table("household_power_consumption.txt", 
                          header = TRUE,
                          dec = ".",
                          na.strings = "?",
                          stringsAsFactors = FALSE,
                          sep=";")

#selecting relevant data and making proper formats
plotingData <- householdPC[householdPC$Date == "1/2/2007" | householdPC$Date == "2/2/2007", ]
plotingData$Sub_metering_1 <- as.numeric(plotingData$Sub_metering_1)
plotingData$Sub_metering_2 <- as.numeric(plotingData$Sub_metering_2)
plotingData$Sub_metering_3 <- as.numeric(plotingData$Sub_metering_3)
plotingData$DateTime <- as.POSIXct(paste(plotingData$Date, plotingData$Time, sep = " "),
                                   format = "%d/%m/%Y %H:%M:%S")

#creating plot
png(filename = "plot3.png", width = 480, height = 480)
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
dev.off()