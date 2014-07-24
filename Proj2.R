#Project submission for Exploratory Data analysis :
#Reading the RDS files : 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI, 10)
str(NEI)

#plotting the Emissions type for each year.
par (mfrow=c(1,1))
summary(NEI)
class(NEI$year)
NEI$year = as.factor(NEI$year)
summary (NEI$year)
library(reshape2)


NEImelt = melt( data=NEI, id.vars = c("year"), measure.vars=c("Emissions"))
head(NEImelt, 10)
colnames(NEImelt)

meanEmissions = dcast (data=NEImelt, formula=year ~ variable, mean)
meanEmissions

with (meanEmissions, plot (x=year, y=Emissions, 
                           main = "Avg. display of PM2.5 Emissions", 
                           xlab = "Year",                
                           ylab = "Avg PM2.5"
                                ))


meanEmissions = function (dataset) {
        
}
NEI_1999 = subset (NEI, NEI$year== 1999)
NEI_1999[100,]
AvgEmissions_1999= mean(NEI_1999$Emissions)
AvgEmissions_1999


NEI_1999 = subset (NEI, NEI$year== 1999)
NEI_1999[100,]
AvgEmissions_1999= mean(NEI_1999$Emissions)
AvgEmissions_1999