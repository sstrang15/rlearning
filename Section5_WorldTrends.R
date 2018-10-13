#Produce scatterplot 
# x Axis: Life Expectancy
# y Axis: Fertility Rate
# by Country
# Categorize by Regions

#----------------------------

#Import data
worldData <- read.csv(file.choose())

#Build Data Frames--


#Build Screening Vectors
worldData.1960 <- worldData$Year == 1960
worldData.2013 <- worldData$Year == 2013

#Use Logical vectors to 
#generate condition based data frames
data.1960 <- worldData[worldData.1960,]
data.2013 <- worldData[worldData.2013,]

add1960 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)

merged1960 <- merge(data.1960, add1960, by.x="Country.Code", by.y="Code")
merged2013 <- merge(data.2013, add2013, by.x="Country.Code", by.y="Code")

merged1960$Year <- NULL
merged2013$Year <- NULL

library(ggplot2)

qplot(data=merged1960, x=Fertility.Rate, y=Life.Exp)
qplot(data=merged1960, x=Fertility.Rate, y=Life.Exp, colour=Region, alpha=.6, shape=I(7))
