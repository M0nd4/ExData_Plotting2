## Question 1:
## Have total emissions from PM2.5 decreased in the United States from 1999 to
## 2008? Using the base plotting system, make a plot showing the total PM2.5
## emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Read the data file
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

totalBal <- subset(NEI, fips == "24510")

total <- tapply(totalBal$Emissions/1000, totalBal$year, sum)

png("plot2.png")
par( mfrow = c( 1, 2 ), oma = c( 1, 2, 2, 2 ) )

## Plot 1
plot(names(total), total, type="l",
     xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions (Ktons)"))

## Plot 2

barplot(total, xlab='Year', ylab=("Total" ~ PM[2.5] ~ "Emissions (Ktons)"))
title(main=expression("Total Baltimore City" ~ PM[2.5] ~ "Emissions by Year"),outer=TRUE)

dev.off()

