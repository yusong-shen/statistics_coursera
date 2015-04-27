## Lab 2 : Probability

## Hot hands
# Basketball players who make several baskets in succession are described as having a “hot hand”. 
load(url("http://www.openintro.org/stat/data/kobe.RData"))
head(kobe)

kobe$basket[1:9]
kobe_streak <- calc_streak(kobe$basket)
barplot(table(kobe_streak))


## Compared to what?
outcomes <- c("heads", "tails")
# sample() function
sample(outcomes, size = 1, replace = TRUE)
sim_fair_coin <- sample(outcomes, size = 100, replace = TRUE)
table(sim_fair_coin)

sim_unfair_coin <- sample(outcomes, size = 100, replace = TRUE, prob = c(0.2, 0.8))
table(sim_unfair_coin)

## Simulating the independent shooter
outcomes <- c("H", "M")
sim_basket <- sample(outcomes, size = 100, replace = TRUE, prob = c(0.45, 0.55))

calc_streak(kobe$basket)
calc_streak(sim_basket)

# > calc_streak(kobe$basket)
# [1] 1 0 2 0 0 0 3 2 0 3 0 1 3 0 0 0
# [17] 0 0 1 1 0 4 1 0 1 0 1 0 1 2 0 1
# [33] 2 1 0 0 1 0 0 0 1 1 0 1 0 2 0 0
# [49] 0 3 0 1 0 1 2 1 0 1 0 0 1 3 3 1
# [65] 1 0 0 0 0 0 1 1 0 0 0 1
# > calc_streak(sim_basket)
# [1] 2 0 0 0 1 0 0 0 2 1 1 0 0 0 0 0
# [17] 0 1 1 0 0 0 0 4 3 0 0 0 2 0 4 1
# [33] 1 0 0 0 0 1 1 0 0 4 0 0 0 0 0 2
# [49] 0 0 2 0 0 3 1 2 3 0