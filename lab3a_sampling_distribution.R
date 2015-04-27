## Lab 3A: Foundations for inference - Sampling distributions


## The data
# real estate data from the city of Ames, Iowa. The details of 
# every real estate transaction in Ames is recorded by the City Assessor’s office. 

load(url("http://www.openintro.org/stat/data/ames.RData"))
area <- ames$Gr.Liv.Area
price <- ames$SalePrice

summary(area)
hist(area)

## The unknown sampling distribution
samp1 <- sample(area, 50)
mean(samp1)

sample_means50 <- rep(NA, 5000)
# for loop
for(i in 1:5000){
  samp <- sample(area, 50)
  sample_means50[i] <- mean(samp)
}

hist(sample_means50)

## Sample size and the sampling distribution
sample_means10 <- rep(NA, 5000)
sample_means100 <- rep(NA, 5000)

for(i in 1:5000){
  samp <- sample(area, 10)
  sample_means10[i] <- mean(samp)
  samp <- sample(area, 100)
  sample_means100[i] <- mean(samp)
}

# plot three plots at a time
par(mfrow = c(3, 1))

xlimits = range(sample_means10)

hist(sample_means10, breaks = 20, xlim = xlimits)
hist(sample_means50, breaks = 20, xlim = xlimits)
hist(sample_means100, breaks = 20, xlim = xlimits)

# return to default setting
par(mfrow = c(1, 1))


