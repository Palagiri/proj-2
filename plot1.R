
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(reshape2)
NEImelt = melt( data=NEI, id.vars = c("year"), measure.vars=c("Emissions"))
head(NEImelt, 10)
colnames(NEImelt)

meanEmissions = dcast (data=NEImelt, formula=year ~ variable, mean)
meanEmissions

png(filename="plot1.png")
with (meanEmissions, plot (x=year, y=Emissions, type="p",
                           main = "Avg.Emission of PM2.5 over years", 
                           xlab = "Year",                
                           ylab = "Avg PM2.5"
))
dev.off()
png (filename = "plot1_gg.png")
library(ggplot2)
ggplot( data=meanEmissions, aes(x=year, y = Emissions, group = year)) +
        geom_point(size = 2, color = "purple") + geom_line(aes(group=1)) +
        ggtitle( "Avg PM2.5 Emissions over year (1999 - 2008)") +
        xlab (" Year") + 
        ylab ("Mean of PM2.5 Emissions")
        


dev.off()