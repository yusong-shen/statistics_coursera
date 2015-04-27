## Lab 6: Introduction to linear regression

## The movie Moneyball focuses on the ``quest for the secret of success in baseball’
# The data
load(url("http://www.openintro.org/stat/data/mlb11.RData"))

head(mlb11)
summary(mlb11)
summary(mlb11$runs)

# 0.610627
cor(mlb11$runs, mlb11$at_bats)

# scatter plot
plot(mlb11$at_bats, mlb11$runs)


## Sum of squared residuals
plot_ss(x = mlb11$at_bats, y = mlb11$runs)
plot_ss(x = mlb11$at_bats, y = mlb11$runs, showSquares = TRUE)

## The linear model
# use lm() to fit the linear model
m1 <- lm(runs ~ at_bats, data = mlb11)
summary(m1)

# q4
m2 <- lm(runs ~ homeruns, data = mlb11)
summary(m2)

## Prediction and prediction errors

plot(mlb11$runs ~ mlb11$at_bats)
# abline() - plot a lab base on lm
abline(m1)
mlb11$runs[mlb11$at_bats == 5579]

pred = -2789.2429+0.6305*5579

## Model diagnostics
# Linearity
plot(m1$residuals ~ mlb11$at_bats)
abline(h = 0, lty = 3)  # adds a horizontal dashed line at y = 0

# Nearly normal residuals
hist(m1$residuals)
qqnorm(m1$residuals)
qqline(m1$residuals)  # adds diagonal line to the normal prob plot

# Constant variability

## Best predict variables

m_hits <- lm(runs ~ hits, data = mlb11)
m_wins <- lm(runs ~ wins, data = mlb11)
m_bat <- lm(runs ~ bat_avg, data = mlb11)

plot(mlb11$runs ~ mlb11$hits)
abline(m_hits)

plot(mlb11$runs ~ mlb11$wins)
abline(m_wins)

plot(mlb11$runs ~ mlb11$bat)
abline(m_bat)

summary(m_hits)
summary(m_bat)

# Q10
m_obs <- lm(runs ~ new_obs, data = mlb11)
m_slug <- lm(runs ~ new_slug, data = mlb11)
m_onbase <- lm(runs ~ new_onbase, data = mlb11)

summary(m_obs)
summary(m_slug)
summary(m_onbase)
