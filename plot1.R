#This script is solution to Exploratory Data Analysis course project
#Goal is to make histogram of Global Active Power by house hold for two dates

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

#creating plot
png(filename = "plot1.png", width = 480, height = 480)
hist(plotingData$Global_active_power, main = "Global Active Power",
                                      xlab = "Global Active Power (kilowats)",
                                      col  = "red")
dev.off()