# Define the data
sample.mean = 9.02
sample.sd = 2.22
sample.size = 20
H0.mean = 10

# Compute test statistic
test = (H0.mean - sample.mean) / (sample.sd / sqrt(sample.size))
test

# Get the p-value using t distribution
p.value = (1 - pt(abs(test), sample.size - 1))
p.value

# Get p-value using monte carlo simulation
p.value.sim = function(){
  count = 0
  for (i in 1:1000){
    x = rnorm(sample.size, mean = sample.mean, sd = sample.sd)
    if (mean(x) > H0.mean) {
      count = count + 1
    }
  }
  
  return (count / 1000)
}

# Simulate 100 times
sim.pvalue = replicate(100, p.value.sim())

# State at 5% significance
sum(sim.pvalue) / 100