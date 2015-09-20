res.median = c()
res.mean = c() # initialize

for(i in 1:200) { # create 200 random samples
  X = rnorm(200, 0, 1)
  res.median[i] = median(X)
  res.mean[i] = mean(X)
}

par(mfrow = c(1, 2))
boxplot(res.mean, res.median) # compare

# Do the same with long tailed distribution
res.median = c()
res.mean = c() # initialize

for(i in 1:200) { # create 200 random samples
  X = rt(200, 2)
  res.median[i] = median(X)
  res.mean[i] = mean(X)
}

boxplot(res.mean, res.median) # compare