# Toss a coin 50 times
x = sample(c("H", "T"), 50, replace = TRUE)
x

# Find number of heads
length(x[x == "H"])