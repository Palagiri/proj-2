NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(reshape2)
NEImelt = melt( data=NEI, id.vars = c("year"), measure.vars=c("Emissions"))
head(NEImelt, 10)
colnames(NEImelt)

#Subsetting the data for the baltimore city with fipss : 24510
class(NEI$fips)
summary (NEI$fips)
NEI$fips = as.numeric(NEI$fips)

BaltimoreEmissions = subset (x=NEI, NEI$fips == 24510)
summary (BaltimoreEmissions)
nrow (BaltimoreEmissions)
BaltimoreMelt = melt (BaltimoreEmissions, id.vars = c("year"), measure.vars=c("Emissions"))
head (BaltimoreMelt)
sumBaltimoreE = dcast ( data = BaltimoreMelt, formula = year ~ variable, sum)
sumBaltimoreE
#base plot

sumBaltimoreE
png(filename="plot2.png")

with (sumBaltimoreE, 
      plot(x=year, y=Emissions, main = "Total Emmissions Baltimore", ylab = "Total PM2.5",
           xlab = "Year"
           ))
dev.off()


#GGplot 
png(filename="plot2_gg.png")
ggplot (data=sumBaltimoreE, aes(year, Emissions, group = year)) + 
        geom_point(size = 3, color ="purple") + 
        geom_line (aes(group=1)) +
        ggtitle ( "Total Emissions per year for Baltimore City (fips = 24510) ") + 
        xlab ("Year") + 
        ylab ("Total PM2.5 Emissions ")

dev.off()