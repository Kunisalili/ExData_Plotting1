##Creat correct directory as a workdirectory
setwd("C://Users//Aneta//Desktop//NAUKA//R_course//Exploratory_analysis")

##Creat new folder in directory, which the name will be 'project_week_1', where you will download dataset
if (!file.exists("project_week1")) {dir.create("project_week1")}

##Download zipped data and then unzip it.
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="./project_week1/Electric_power_consumption.zip")
unzip(zipfile="./project_week1/Electric_power_consumption.zip", exdir="./project_week1")

##Read dataset as a table and later convert the Date and Time variables to Date/Time classes 
##in R using as.Date() functions and selett only data from the dates 2007-02-01 and 2007-02-02. 
data_base<- read.table("./project_week1/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
data_base$Date<- as.Date(data_base$Date,"%d/%m/%Y")
data_base_1<-data_base[data_base$Date == '2007-02-01' | data_base$Date == '2007-02-02',]

##Convert other variables to numeric classes
for (i in 3:9) data_base_1[,i] <- as.numeric(data_base_1[,i]) 

##Construct first plot (histogram) and save it to a PNG file with 
##a width of 480 pixels and a height of 480 pixels called 'plot1.png'.

setwd("C://Users//Aneta//Desktop//NAUKA//R_course//Exploratory_analysis//project_week1")

png(file="plot1.png", width=480, height=480)

with (data_base_1, hist(Global_active_power,  xlab = 'Global Active Power (kilowatts)', col="red", main="Global Active Power"))

dev.off() 
