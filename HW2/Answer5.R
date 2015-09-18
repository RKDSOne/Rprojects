# Roll a die 100 times
x = sample(1:6, 100, replace = TRUE)
x

# Count 6`s
length(x[x == 6])