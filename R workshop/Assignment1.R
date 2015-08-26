# Read the data
data = read.csv("dataset_diabetes/diabetic_data.csv", na.strings = "?")

# Display number of medications by race
aggregate(data$num_medications, list(data$race), mean)

# Select values with num_medications > 20 
length(data[data$num_medications > 20, 1])

# Show columns that do not have missing values
badColumns = apply(data, 2, function(x) any(is.na(x)))
names(data)[!badColumns]
