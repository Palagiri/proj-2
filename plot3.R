#Plot 3
#Subsetting the Baltimore emissions
BaltimoreEmissions = subset (x=NEI, NEI$fips == 24510)
#Converting the type col into factor.
BaltimoreEmissions$type = as.factor(BaltimoreEmissions$type)
#melting the data where it can hold per year per type what was Emissions
BaltimoreMelt = melt (BaltimoreEmissions, id.vars = c("year", "type"), measure.vars=c("Emissions"))

#Subsetting for the year 1999
Balt99Melt = subset ( x=BaltimoreMelt, year == 1999)
head(Balt99Melt)
#To find the SUM of the Emissions 
Balt99MeltDcast = dcast (data=Balt99Melt, formula = type ~ variable, sum)
head(Balt99MeltDcast)
#Adding year as the columns
Balt99MeltDcast$year = 1999

#Subsetting for the year 2002
Balt2002Melt = subset ( x=BaltimoreMelt, year == 2002)
head(Balt2002Melt)
#To find the SUM of the Emissions 
Balt2002MeltDcast = dcast (data=Balt2002Melt, formula = type ~ variable, sum)
head(Balt2002MeltDcast)
#Adding year as the columns
Balt2002MeltDcast$year = 2002

#Subsetting for the year 2005
Balt2005Melt = subset ( x=BaltimoreMelt, year == 2005)
head(Balt2005Melt)
#To find the SUM of the Emissions 
Balt2005MeltDcast = dcast (data=Balt2005Melt, formula = type ~ variable, sum)
head(Balt2005MeltDcast)
#Adding year as the columns
Balt2005MeltDcast$year = 2005

#Subsetting for the year 2008
Balt2008Melt = subset ( x=BaltimoreMelt, year == 2008)
head(Balt2008Melt)
#To find the SUM of the Emissions 
Balt2008MeltDcast = dcast (data=Balt2008Melt, formula = type ~ variable, sum)
head(Balt2008MeltDcast)
#Adding year as the columns
Balt2008MeltDcast$year = 2008


#Merging all the 4 data frames
plot3DF = rbind.data.frame(Balt99MeltDcast,Balt2002MeltDcast,Balt2005MeltDcast,Balt2008MeltDcast)
summary(plot3DF)
str(plot3DF)
head(plot3DF)
plot3DF
#plotting the DF
library (ggplot2)

#Opening a PNG file
png(filename="plot3.png")

ggplot (plot3DF) + geom_line(aes(year, Emissions, group = type, color=type)) +
        ggtitle("Emissions in Baltimore city") + 
        xlab ("Year") + 
        ylab ("Total PM2.5 Emissions")

dev.off()
