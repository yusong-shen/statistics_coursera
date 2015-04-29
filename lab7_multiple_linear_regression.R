## Lab 7: Multiple linear regression

load(url("http://www.openintro.org/stat/data/evals.RData"))

summary(evals)

hist(evals$score)

## Simple linear regression
plot(evals$score ~ evals$bty_avg)
# use jitter()
# Add a small amount of noise to a numeric vector.
par(mfrow = c(3,1))
plot(jitter(evals$score) ~ evals$bty_avg)
m_bty <- lm(score ~ bty_avg, data = evals)
abline(m_bty)
summary(m_bty)
hist(m_bty$residuals)
qqnorm(m_bty$residuals)
qqline(m_bty$residuals)  # adds diagonal line to the normal prob plot

par(mfrow = c(1,1))
plot(m_bty$residuals ~ evals$bty_avg)


## Multiple linear regression
plot(evals$bty_avg ~ evals$bty_f1lower)
cor(evals$bty_avg, evals$bty_f1lower)

plot(evals[,13:19])

m_bty_gen <- lm(score ~ bty_avg + gender, data = evals)
summary(m_bty_gen)

multiLines(m_bty_gen)


## The search for the best model
m_full <- lm(score ~ rank + ethnicity + gender + language + age + cls_perc_eval 
             + cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m_full)
