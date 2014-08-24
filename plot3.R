library(ggplot2)

## Read the data file
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

totalBal <- subset(NEI, fips == "24510")

total <- aggregate(totalBal[c("Emissions")],
                       list(type = totalBal$type, year = totalBal$year), sum)

png("plot3.png")
#par( mfrow = c( 1, 2 ), oma = c( 1, 2, 2, 2 ) )

## Plot 1
ggplot(data=total, aes(x=year, y=Emissions, group=type, color=type)) + geom_line() + geom_point( size=2, shape=21, fill="white") + xlab("Year") +  ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)")) + ggtitle(expression("Total Baltimore City" ~ PM[2.5] ~ "Emissions by Source Type and Year"))
ggsave(file="plot3.png")


