#This script is solution to Exploratory Data Analysis course project plot2
#Goal is to make plot of Global Activw Power (kilowats) in time during 01/02/207 and 02/01/2007

#reading data file
householdPC <- read.table("household_power_consumption.txt", 
                          header = TRUE,
                          dec = ".",
                          na.strings = "?",
                          stringsAsFactors = FALSE,
                          sep=";")

#selecting relevant data and making proper formats
plotingData <- householdPC[householdPC$Date == "1/2/2007" | householdPC$Date == "2/2/2007", ]
plotingData$Global_active_power <- as.numeric(plotingData$Global_active_power)
plotingData$DateTime <- as.POSIXct(paste(plotingData$Date, plotingData$Time, sep = " "),
                                   format = "%d/%m/%Y %H:%M:%S")

#creating plot
png(filename = "plot2.png", width = 480, height = 480)
plot(plotingData$DateTime, plotingData$Global_active_power, xlab = "",
                                                            ylab = "Global Active Power (kilowats)", 
                                                            type = "l")

dev.off()