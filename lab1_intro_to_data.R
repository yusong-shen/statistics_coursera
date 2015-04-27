## Lab 1 : Introduction to data

## Getting started
# The Behavioral Risk Factor Surveillance System (BRFSS) is an annual telephone 
# survey of 350,000 people in the United States. As its name implies, the BRFSS 
# is designed to identify risk factors in the adult population and report 
# emerging health trends.
source("http://www.openintro.org/stat/data/cdc.R")

names(cdc)
head(cdc)
tail(cdc)


# Summaries and tables
summary(cdc$weight)

mean(cdc$weight) 
var(cdc$weight)
median(cdc$weight)

# tabulate variables
smoke = table(cdc$smoke100)
barplot(smoke)

# mosaic plot of table
gender_smokers = table(cdc$gender,cdc$smoke100)
mosaicplot(gender_smokers)

## How R thinks about data
dim(cdc)
cdc[1:10,]
cdc$weight[1:10]

## Subsetting
# cdc$gender == 'm'
# cdc$age > 30
meta = subset(cdc, cdc$gender == 'm')
head(meta)
# $ and |
m_and_over30 = subset(cdc, cdc$gender == "m" & cdc$age > 30)
m_or_over30 = subset(cdc, cdc$gender == "m" | cdc$age > 30)

## Numerical data
boxplot(cdc$height)
summary(cdc$height)
boxplot(cdc$height ~ cdc$gender)

bmi = (cdc$weight / cdc$height^2) * 703
boxplot(bmi ~ cdc$genhlth)

# histograms
hist(cdc$age)
hist(bmi)
hist(bmi, breaks = 50)
