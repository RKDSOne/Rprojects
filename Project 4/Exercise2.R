# Define the data
sample.mean = 9.02
sample.sd = 2.22
sample.size = 20
H0.mean = 10

# Compute test statistic
test = (-H0.mean + sample.mean) / (sample.sd / sqrt(sample.size))
test

# Get the p-value using t distribution
p.value = (1 - pt(test, sample.size - 1))
p.value

# Get p-value using monte carlo simulation
p.value.sim = function(){
    x = rnorm(sample.size, mean = sample.mean, sd = sample.sd)
    mean(x)
}

# Simulate 100 times
sim = replicate(10000, p.value.sim())
1 - length(sim[sim> H0.mean]) / 10000