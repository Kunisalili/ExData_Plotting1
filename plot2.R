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

##Change a directory of exporting plots.
##Change a language of daynames to English
##Combine the two variables and then use strptime () to give the labels on the X axis
setwd("C://Users//Aneta//Desktop//NAUKA//R_course//Exploratory_analysis//project_week1")
Sys.setlocale("LC_TIME", "English")
Date_and_time<-paste(data_base_1$Date, data_base_1$Time)
DT_done<-strptime(Date_and_time,"%Y-%m-%d %H:%M:%S")

##Construct second plot and save it to a PNG file with 
##a width of 480 pixels and a height of 480 pixels called 'plot2.png'.
png(file="plot2.png", width=480, height=480)

with(data_base_1, plot(DT_done, Global_active_power,type='l',xlab="", ylab = 'Global Active Power (kilowatts)')) 

dev.off() 