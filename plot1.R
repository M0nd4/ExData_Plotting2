## Read the data file
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

total <- tapply(NEI$Emissions/1000, NEI$year, sum)

png("plot1.png")#, width = 700, height = 700)
par( mfrow = c( 1, 2 ), oma = c( 1, 2, 2, 2 ) )

## Plot 1
plot(names(total), total, "b", 
     xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions (Ktons)")
     ,xaxt="n")
axis(side=1, at=c("1999", "2002", "2005", "2008"))
## Plot 2

barplot(total, xlab='Year', ylab=("Total" ~ PM[2.5] ~ "Emissions (Ktons)"))

title(main=expression("Total US" ~ PM[2.5] ~ "Emissions by Year"),outer=TRUE)
dev.off()


