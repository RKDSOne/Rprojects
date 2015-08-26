times = c(17, 16, 20, 24, 22, 15, 21, 15, 17, 22)
max(times)
mean(times)
min(times)

# Fix
times[4] = 18
mean(times)
sum( times >= 20)

# Calculate percent
x = length(times[times < 17]) * 100 / length(times)
x