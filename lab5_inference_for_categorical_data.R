source("http://bit.ly/dasi_inference")

load(url("http://www.openintro.org/stat/data/atheism.RData"))

summary(atheism)

# create a new dataframe
us12 = subset(atheism, atheism$nationality == "United States" & atheism$year == "2012")

all12 = subset(atheism, atheism$year == '2012')

# Inference on proportions
inference(us12$response, est = "proportion", type = "ci", method = "theoretical", success = "atheist")

# How does the proportion affect the margin of error
n <- 1000
p <- seq(0, 1, 0.01)
me <- 2*sqrt(p*(1 - p)/n)
plot(me ~ p)
