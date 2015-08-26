# Load datasets
library("datasets")
head(airquality)

# Filter missing values
badColumns = apply(airquality, 1, function(x) any(is.na(x)))
cleanData = airquality[!badColumns, c("Ozone", "Temp")]

# Cluster ozone and temp using kmeans into 3 clusters
kmeansObj = kmeans(cleanData, centers = 3)
plot(cleanData, col = kmeansObj$cluster)
points(kmeansObj$centers, col = 1:3, pch = 3)

# Apply principal component analysis
prcomp(airquality[!badColumns, ])
