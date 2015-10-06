library(maps) # to get map shape file
library(ggplot2) # for plotting and miscellaneuous things
library(ggmap) # for plotting
library(plyr) # for merging datasets
library(scales) # to get nice looking legends
library(XLConnect) # to read xls file

# Get a dataframe of states of USA
usa.df = map_data("state")

# Let's rename 'region' as 'state' and make it a factor variable
colnames(usa.df)[5] = "state"
usa.df$state = as.factor(usa.df$state)

# Read input file
wb = loadWorkbook("usstatesWTID.xls")
data.table = readWorksheet(wb, sheet = "Sheet1", header = TRUE, keep = c("st", "Top1_adj"))

# Change column names
colnames(data.table) = c("group", "percent")

# Filter the data to read rows related to year 2012, 1999 and 2012 - 1999 difference
# First occurence of 2012 is in line number 96 in data
# First occurence of 1999 is in line number 84 in data
# Construct a sequence to get only the rows related to those years
data.2012.table = data.table[seq(96, 4992, 96), ]
data.1999.table = data.table[seq(84, 4992, 96), ]
data.diff.table = data.2012.table
data.diff.table$percent = data.2012.table$percent - data.1999.table$percent

# Get data frames
usa.2012.dat = as.data.frame.matrix(data.2012.table)
usa.1999.dat = as.data.frame.matrix(data.1999.table)
usa.diff.dat = as.data.frame.matrix(data.diff.table)

# Merge the shape data with the income data by state name
usa.2012.df = join(usa.df, usa.2012.dat, by = "group", type = "inner")
usa.1999.df = join(usa.df, usa.1999.dat, by = "group", type = "inner")
usa.diff.df = join(usa.df, usa.diff.dat, by = "group", type = "inner")

# Map states
cnames = aggregate(cbind(lat, long) ~ state, data=usa.2012.df, FUN = function(x) mean(range(x)))

# Rename states to abbreviations
# Using setNames gives incorrect results, have to do this manually
cnames$state = c("AL", "AZ", "AR", "CA" , "CO", "CT", "DE", "DC", "FL", "GA", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "M0", "MT", "NE", "NV",
                 "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT")

# Define breaks
brks = c(0, 10, 15, 20, 25, 30, 35, 99)

# Plot map
p.2012 = ggplot(usa.2012.df, aes(long, lat)) +
  # with borders (slower)
  geom_polygon(aes(group = group, fill = percent), color = "black", size = .1) +
  # Add labels
  geom_text(aes(long, lat, label = state), data = cnames, size = 3.5) + 
  # Remove distortion
  coord_map() + 
  # Change color and break
  scale_fill_distiller(palette = "Reds", breaks = brks) +
  # Reverse the legend
  guides(fill = guide_legend(reverse = TRUE)) + 
  # Get rid of background
  theme_nothing(legend = TRUE) +
  # Provide a title and remove the guide legend heading
  labs(title = "Share of top 1% income earners for 2012", fill = "")

#Plot map for others
p.1999 = ggplot(usa.1999.df, aes(long, lat)) +
  geom_polygon(aes(group = group, fill = percent), color = "black", size = .1) +
  geom_text(aes(long, lat, label = state), data = cnames, size = 3.5) + 
  coord_map() + 
  scale_fill_distiller(palette = "Reds", breaks = brks) +
  guides(fill = guide_legend(reverse = TRUE)) + 
  theme_nothing(legend = TRUE) +
  labs(title = "Share of top 1% income earners for 1999", fill = "")

# Define breaks for difference
brks = c(-10, -7, -4, -1, 1, 4, 7, 10)

p.diff = ggplot(usa.diff.df, aes(long, lat)) +
  geom_polygon(aes(group = group, fill = percent), color = "black", size = .1) +
  geom_text(aes(long, lat, label = state), data = cnames, size = 3.5) + 
  coord_map() + 
  scale_fill_distiller(palette = "Reds", breaks = brks) +
  guides(fill = guide_legend(reverse = TRUE)) + 
  theme_nothing(legend = TRUE) +
  labs(title = "Difference in share of top 1% income earners between 2012 and 1999", fill = "")

# Save the map to a file for viewing
ggsave(p.2012, file = "USA_2012.pdf")
ggsave(p.1999, file = "USA_1999.pdf")
ggsave(p.diff, file = "USA_diff.pdf")