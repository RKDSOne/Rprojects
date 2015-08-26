getwd()
ls()
x=1
x <- 2
x = 1:10
x
print(x)
x = TRUE
x = T
x = Inf
attributes(x)
x = cbind(a = 1:3, pi = pi)
x
class(x)
length(x)
dim(x)
x = c(1, 2)
x = c(1, T)
as.numeric(T)
as.numeric("DF")
x = factor(c("yes", "no", "yes", "no"))
table(x)
x = matrix(rep(10,4), 2, 2)
x = matrix(data = 1:4, nrow = 2, ncol = 2)
x = c(1, NA, 3)
is.na(x)
?read.table
x = data.frame(col1 = 1:3, col2 = c(T,F,F))
nrow(x)
head(x)
summary(x)
x[1]
x[[1]]
x$col1
x[,2]
x[x$col1 > 1,]
x = c(1, 2, NA, 4, NA, 5)
good = complete.cases(x)
x[good]
bad = is.na(x)
x[bad]
rnorm(100)
f = function(a,b) {a^2}
f(2)
x = list(a=1:10, beta=exp(-3:3), logic = c(T,F,F,T))
lapply(x, mean)
sapply(x, mean)
x = cbind(x1 = 3, x2 = c(4:1, 2:5))
colMeans = apply(x, 2, mean)
rowMeans = apply(x, 1, mean)
?apply

x = 1:10
sample(x, size =4)
rnorm(x, mean = 0, sd = 1)
set.seed(10)
?read.csv

library("formatR")
tidy_eval("Assignment1.R")

library("datasets")
head(airquality)
boxplot(airquality$Wind)

kmeans(airquality, centers = 3)
?kmeans
x <- rbind(matrix(rnorm(100, sd = 0.3), ncol = 2),
           matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2))
colnames(x) <- c("x", "y")
(cl <- kmeans(x, 2))
plot(x, col = cl$cluster)
points(cl$centers, col = 1:2, pch = 8, cex = 2)
