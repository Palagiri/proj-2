This repository is created as the submission of the project files for the Exploratory Analysis.
The data obtained is from location :
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

This repo consists of different R files corresponding to plots 
The following are questions answered with different analysis done on the data :

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
>>I used melt() functions to melt the data year Vs Emissions
>>dcast to find the mean of the PM2.5 across the years on the melt data.
>>I took the average of the Particulate matter over the years to see the trend.Its observed that the Emissions got reduced from 1999 to 2008.
>>Plotted both the base plot and GGplot for reference.
>>Data Analysis:
>>The emissions declined during the year 1999 through 2008 for US.

2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
>>used Subset() to subset the data to just capture Baltimore City.
>>used melt() and dcast() to find the total emissions in a particular year.
>>Plotted both the base plot and GGplot for reference.
>>Data Analysis :
Total Emissions in the Baltimore city was highest in the year 1999 and lowest in 2008.

3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
>>I  subset the baltimore city data set and made different data frames for each year by melt function.
>>Found the SUM of the emissions using the dcast function with variable type.
>>plotted the ggplot of the graph.
>>Data Anlysis Plot3:
>>According to the data Emissions for the NON-POINT type was highest among all the types during the year 1999.
>>All the data gradually declined from the year 1999 to 2008 except for the emissions for the type POINT.
>>The Emissions for the POINT type rose heavily from 2002 to 2005.

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?


This repo consists my scramble file as well that i have used to practise before getting the different plots into different graphs and R scripts.
