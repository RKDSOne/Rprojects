library(XLConnect) # to read xls file

# Read input file
wb = loadWorkbook("hpi-data.xlsx")
data.table = readWorksheet(wb, sheet = "Complete HPI Dataset", header = TRUE, startRow = 6, startCol = 2)

# Plot 4 figures
par(mfrow = c(2, 2))

# Display the distribution of HPI variable graphically
boxplot(data.table$Happy.Planet.Index, data = data.table, main = "Distribution of Happy Planet Index", ylab = "HPI")

# Make scatterplots
plot(data.table$Happy.Planet.Index, data.table$Life..Expectancy, main = "HPI Vs. Life Expectancy", xlab = "Life Expectancy", ylab = "Happy Planet Index")
plot(data.table$Happy.Planet.Index, data.table$Well.being..0.10., main = "HPI Vs. Well Being", xlab = "Well Being", ylab = "Happy Planet Index")
plot(data.table$Happy.Planet.Index, data.table$Footprint..gha.capita., main = "HPI Vs. Ecological Footprint", xlab = "Ecological Footprint", ylab = "Happy Planet Index")

# Calculate correlations
cat("Correlation of HPI with life expectancy:", cor(data.table$Happy.Planet.Index, data.table$Life..Expectancy))
cat("Correlation of HPI with well being:", cor(data.table$Happy.Planet.Index, data.table$Well.being..0.10.))
cat("Correlation of HPI with footprint:", cor(data.table$Happy.Planet.Index, data.table$Footprint..gha.capita.))