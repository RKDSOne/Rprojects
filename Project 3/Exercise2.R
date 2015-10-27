# Define data
children.cereals = c(40.3, 55, 45.7, 43.3, 50.3, 45.9, 53.5, 43, 44.2, 44, 47.4, 44, 33.6, 55.1, 48.8, 50.4, 37.8, 60.3, 46.5)
adult.cereals = c(20, 30.2, 2.2, 7.5, 4.4, 22.2, 16.6, 14.5, 21.4, 3.3, 6.6, 7.8, 10.6, 16.2, 14.5, 4.1, 15.8, 4.1, 2.4, 3.5, 8.5, 10, 1, 4.4, 1.3, 8.1, 4.7, 18.4)

# Draw Q-Q plots
par(mfrow = c(1, 2))
qqnorm(children.cereals, main = "Children`s cereals Q-Q Plot")
qqline(children.cereals)
qqnorm(adult.cereals, main = "Adult`s cereals Q-Q Plot")
qqline(adult.cereals)

# Can the variances assumed to be equal?
var.test(children.cereals, adult.cereals)

# Compute an appropriate 95% confidence interval for difference in mean sugar contents of the two cereal types
t.test(children.cereals, adult.cereals)