bill = c(46, 33, 39, 37, 46, 30, 48, 32, 49, 35, 30, 48)

# Amount spent this year
sum(bill)

# Smallest and largest
max(bill)
min(bill)

# How many months was amount greater than 40
x = length(bill[bill > 40])

# Calculate percent
x * 100/ length(bill)