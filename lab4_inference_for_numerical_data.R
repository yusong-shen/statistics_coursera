## Part A :  North Carolina births

# Exploratory analysis
load(url("http://bit.ly/dasi_nc"))

summary(nc)


gained_clean = na.omit(nc$gained)
n = length(gained_clean)
hist(gained_clean)

# The bootstrap

boot_means = rep(NA, 100)

for(i in 1:100){
  boot_sample = sample(gained_clean, n, replace = TRUE)
  boot_means[i] = mean(boot_sample)
}

hist(boot_means)

# The inference function
source("http://bit.ly/dasi_inference")
inference(nc$gained, type = "ci", method = "simulation", 
          conflevel = 0.90, est = "mean", boot_method = "perc")


## Evaluating relationships between two variables
# how to visualize the weight and habit ??


## Hypothesis tests and confidence intervals
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ht", null = 0, 
          alternative = "twosided", method = "theoretical")

inference(y = nc$weight, x = nc$habit, est = "mean", type = "ci", null = 0, 
          alternative = "twosided", method = "theoretical")


## Part B : The general social survey

load(url("http://bit.ly/dasi_gss_ws_cl"))

inference(y = gss$wordsum, x = gss$class, est = "mean", type = "ht", alternative = "greater", method = "theoretical")
