# Plot a movie
par(mfrow = c(1, 1))
for (n in 1:50) {
  results = c()
  mu = 10
  sigma = mu
  for(i in 1:200) {
    X = rexp(200, 1 / mu)
    results[i] = (mean(X) - mu) / (sigma / sqrt(n))
  }
  
  hist(results)
  Sys.sleep(.2)
}