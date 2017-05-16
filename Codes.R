# Author: Benjamin Reddy
# Taken from pages 49-50 of O'Neil and Schutt


library(plyr)

#All file locations are set on relative paths from the project directory.
qn <- read.csv("rollingsales_queens.csv",skip=4,header=TRUE)
head(qn)
dim(qn)

#export Summary and Data Structure to an external file in Analysis directory

sink("Analysis/RawDataSummary&Structure.txt")
print(summary(qn))
print(str(qn))
sink()

## clean/format the data with regular expressions. For now, know that the pattern "[^[:digit:]]" refers to members of the variable name that starts with digits.
## We use the gsub command to replace them with a blank space.
# We create a new variable that is a "clean' version of sale.price. And sale.price.n is numeric, not a factor.

names(qn) <- tolower(names(qn))               # make all variable names lower case
names(qn)

## Get rid of leading digits and convert to Numeric variables

qn$sale.price.n <- as.numeric(gsub("[^[:digit:]]","", qn$sale.price))
count(is.na(qn$sale.price.n))
qn$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", qn$gross.square.feet))
qn$land.sqft <- as.numeric(gsub("[^[:digit:]]","", qn$land.square.feet))
qn$year.built <- as.numeric(as.character(qn$year.built))

## Data exploration to ensure there's not anything absurd with sale prices

jpeg("Analysis/Chart1_HistogramforSalePrice.jpg")

attach(qn)
hist(sale.price.n)
detach(qn)

graphics.off()

## Plotting actual sales

jpeg("Analysis/Chart2_PlotforGrossSQFTvsSalePrice.jpg")

par(mfrow=c(2,1))
qn.sale <- qn[qn$sale.price.n!=0,]
plot(qn.sale$gross.sqft,qn.sale$sale.price.n)
plot(log10(qn.sale$gross.sqft),log10(qn.sale$sale.price.n))
par(mfrow=c(1,1))

graphics.off()

## Removing all which is not a 'Home' (1-, 2-, and 3-family homes)

qn.homes <- qn.sale[which(grepl("FAMILY",qn.sale$building.class.category)),]
dim(qn.homes)

jpeg("Analysis/Chart3_PlotforGrossSQFTvsSalePrice_forHomes.jpg")

plot(log10(qn.homes$gross.sqft),log10(qn.homes$sale.price.n))

graphics.off()

sink("Analysis/SummaryforFamilyHomeswithSalePricebelow100000.txt")
print(summary(qn.homes[which(qn.homes$sale.price.n<100000),]))
sink()

## Removing outliers that seem like they weren't actual sales (Logic: Sale Price < 100000 are considered outliers)

qn.homes$outliers <- (log10(qn.homes$sale.price.n) <=5) + 0
qn.homes <- qn.homes[which(qn.homes$outliers==0),]

jpeg("Analysis/Chart4_SalePricePlot_CleandataforHomes.jpg")

plot(log10(qn.homes$gross.sqft),log10(qn.homes$sale.price.n))

graphics.off()

## Exporting clean data from R to CSV file

write.csv(qn.homes,"Data/CleanData_RollingSales_Queens.csv")

