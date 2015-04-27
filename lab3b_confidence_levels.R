## Lab 3B : Confidence levels

## The data
# start with a simple random sample of size 60 from the population
load(url("http://www.openintro.org/stat/data/ames.RData"))
population <- ames$Gr.Liv.Area
samp <- sample(population, 60)

## Confidence intervals
sample_mean <- mean(samp)

se <- sd(samp)/sqrt(60)
lower <- sample_mean - 1.96 * se
upper <- sample_mean + 1.96 * se
c(lower, upper)

## Confidence levels
mean(population)

# > c(lower, upper)
# [1] 1506.955 1783.045
# > mean(population)
# [1] 1499.69

# Step 1: Obtain a random sample.
# Step 2: Calculate the sample’s mean and standard deviation.
# Step 3: Use these statistics to calculate a confidence interval.
# Step 4: Repeat steps (1)-(3) 50 times.

samp_mean <- rep(NA, 50)
samp_sd <- rep(NA, 50)
n <- 60

for(i in 1:50){
  samp <- sample(population, n) # obtain a sample of size n = 60 from the population
  samp_mean[i] <- mean(samp)    # save sample mean in ith element of samp_mean
  samp_sd[i] <- sd(samp)        # save sample sd in ith element of samp_sd
}

# Construct the confidence intervals
lower <- samp_mean - 1.96 * samp_sd / sqrt(n) 
upper <- samp_mean + 1.96 * samp_sd / sqrt(n)
c(lower[1],upper[1])
plot_ci(lower, upper, mean(population))
