#Overview
_______________________________
`"binomial"` is a minimal R package that creates binomial variables and does some easy summary about the binomial variable.

* `bin_variable()` creates a binomial variable.
* `bin_choose()` calculates the combinatorial number.
* `bin_probability()` calculates the probability of the binomial random variable.
* `bin_distribution()` calculates the distribution of the binomial random variable.
* `bin_cumulative()` calculates the cumulative of the binomial random variable.
* `bin_mean()` calculates the mean of the binomial variable.
* `bin_variance()` calculates the variance of the binomial variable.
* `bin_mode()` calculates the mode of the binomial variable.
* `bin_skewness()` calculates the skewness of the binomial variable.
* `bin_kurtosis()` calculates the kurtosis of the binomial variable.

#Motivation
________________________________
This package has been developed to illustrate some of the concepts behind the creation of an R package.

#Usage
________________________________
```{r}
library(binomial)

#Create a binomial variable
bv<-bin_variable(trials=10,prob=0.5)

#Print the variable and summary the variable 
bv
#"Binomial Variable"
#
#Parameter
#- number of trials: 10 
#- prob of success : 0.5

summary(bv)
#"Summary Binomial"
#
#Parameter
#- number of trials: 10 
#- prob of success : 0.5 
#
#Measure
#- mean    : 5 
#- variance: 2.5 
#- mode    : 5 
#- skewness: 0
#- kurtosis: -0.2

#Plots
plot(bin_distribution(trials=10,prob=0.5))
#return the barplot of the probability and success.

plot(bin_cumulative(trials=10,prob=0.5))
#return the plot of the cumulative probability and success.
```
