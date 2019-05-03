#The function to check whether input probability is in correct form.
check_prob<-function(prob){
  if(length(prob)==1){
    if(prob>=0&prob<=1) return(TRUE)
    else stop('p has to be a number betwen 0 and 1')
  }
  else stop('the length of p should be 1')
}

#The function to check whether input trials is in correct form.
check_trials<-function(trials){
  if(length(trials)==1){
    if(is.numeric(trials)){
      if(round(trials)==trials&trials>=0) return(TRUE)
      else stop('trials value should be a non-negative integer')
    }
    else stop('trials value should be a non-negative integer')
  }
  else stop('the length of trials value should be 1')
}

#The function to check whether input success vector is in correct form.
check_success<-function(success,trials){
  if(is.vector(success)){
    if(is.numeric(success)){
      if(all(round(success)==success)&all(success>=0&success<=trials)) return(TRUE)
      else stop('invalid success value')
    }
    else stop('invalid success value')
  }
  else('success should be a vector')
}

#the mean of the certain binomial distribution
aux_mean<-function(trials,prob){
  return(trials*prob)
}

#the variance of the certain binomial distribution
aux_variance<-function(trials,prob){
  return(trials*prob*(1-prob))
}

#the mode of the certain binomial distribution
aux_mode<-function(trials,prob){
  if(round(trials*prob+prob)==trials*prob+prob) return(c((trials*prob+prob),(trials*prob+prob)-1))
  else return(floor(trials * prob + prob))
}

#the skewness of the certain binomial distribution
aux_skewness<-function(trials,prob){
  if(prob==0|prob==1) return('Undefined')
  else return((1-2*prob)/sqrt(trials*prob*(1-prob)))
}

#the kurtosis of the certain binomial distribution
aux_kurtosis<-function(trials,prob){
  if(prob==0|prob==1) return('Undefined')
  else return((1-6*prob*(1-prob))/(trials*prob*(1-prob)))
}

#'@title Binomial Choose
#'@description function to calculate the combinatorial number
#'@param n the number of trials
#'@param k the list of numbers of success
#'@return the number of combinations
#'@export
#'@examples
#'bin_choose(n=5,k=2)
#'bin_choose(5,0)
#'bin_choose(5,1:3)
bin_choose<-function(n,k){
  if(!(all(is.numeric(k))&is.numeric(n))) stop('invalid input')
  else{
    if(!(all(k%%1==0)&(n%%1==0))) stop('invalid input')
    else{
      if(any(k>n)) stop('invalid input')
      else{
        if(n<0|any(k<0)) stop('invalid input')
        else return(factorial(n)/(factorial(k)*factorial(n-k)))
      }
    }
  }
}

#'@title Binomial Probability
#'@description function to calculate the probability of binomial random variable
#'@param success the list of numbers of success
#'@param trials the number of trials
#'@param prob the probability that success occurs
#'@return the list that contains the probabilities of success given trials and success
#'@export
#'@examples
#'bin_probability(success = 2, trials = 5, prob = 0.5)
#'bin_probability(success = 0:2, trials = 5, prob = 0.5)
#'bin_probability(success = 55, trials = 100, prob = 0.45)
bin_probability<-function(success,trials,prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  return(bin_choose(trials,success)*prob^success*(1-prob)^(trials-success))
}

#'@title Binomial Distribution
#'@description function to calculate the distribution of binomial random variable
#'@param trials the number of trials
#'@param prob the probability that success occurs
#'@return a data frame with the probability distribution
#'@export
#'@examples
#'bin_distribution(trials = 5, prob = 0.5)
bin_distribution<-function(trials,prob){
  bd<-data.frame(success=0:trials,probability=bin_probability(0:trials,trials,prob))
  bd<-structure(bd,class=c('bindis','data.frame'))
  return(bd)
}

#To plot the barplot of the distribution of the certain binomial distribution
#'@export
plot.bindis<-function(bindis){
  ggplot2::ggplot(bindis,aes(x=bindis$success,y=bindis$probability))+
    geom_col()
}

#'@title Binomial Cumulative
#'@description function to calculate the cumulative of binomial random variable
#'@param trials the number of trials
#'@param prob the probability that success occurs
#'@return data frame with both the probability distribution and the cumulative probabilities
#'@export
#'@examples
#'bin_cumulative(trials = 5, prob = 0.5)
bin_cumulative <- function(trials, prob){
  bc<-data.frame(success=0:trials,probability=bin_probability(0:trials,trials,prob),cumulative=bin_probability(0:trials,trials,prob))
  bc<-structure(bc,class=c("bincum", "data.frame"))
  for(i in 1:(nrow(bc)-1)){
    bc[i+1,3]<-bc[i,3]+bc[i+1,3]
  }
  return(bc)
}

#To plot the barplot of the distribution and cumulative probability of the certain binomial distribution
#'@export
plot.bincum<-function(bincum){
  ggplot2::ggplot(bincum,aes(x=bincum$success,y=bincum$cumulative))+
    geom_line(color='blue')+
    geom_point(color='blue',size=1.5)
}

#'@title Binomial Variable
#'@description function to generate a binomial variable with class binvar
#'@param trials the number of trials
#'@param prob the probability that success occurs
#'@return a binomial random variable object
#'@export
#'@examples
#'bin_variable(trials=5,prob=0.5)
bin_variable<-function(trials,prob){
  check_prob(prob)
  check_trials(trials)
  bv<-list(trials=trials,prob=prob)
  structure(bv,class='binvar')
}

#To print the basic information of the binomial variable
#'@export
print.binvar<-function(binvar){
  cat("\"Binomial Variable\"\n\n")
  cat('Parameter\n')
  cat(paste('- number of trials:',binvar[[1]],'\n'))
  cat(paste('- prob of success :',binvar[[2]],'\n'))
  invisible(binvar)
}

#To summary the certain binomial distribution
#'@export
summary.binvar<-function(binvar){
  ls<-list(
    trials=binvar[[1]],
    prob=binvar[[2]],
    mean=aux_mean(binvar[[1]],binvar[[2]]),
    variance=aux_variance(binvar[[1]],binvar[[2]]),
    mode=aux_mode(binvar[[1]],binvar[[2]]),
    skewness=aux_skewness(binvar[[1]],binvar[[2]]),
    kurtosis=aux_kurtosis(binvar[[1]],binvar[[2]])
  )
  class(ls)<-'summary.binvar'
  return(ls)
}

#To print some statisics of the certain binomial distribution
#'@export
print.summary.binvar<-function(binvar){
  cat("\"Summary Binomial\"\n\n")
  cat('Parameter\n')
  cat(paste('- number of trials:',binvar$trials),'\n')
  cat(paste('- prob of success :',binvar$prob),'\n\n')
  cat('Measure\n')
  cat(paste('- mean    :',binvar$mean,'\n'))
  cat(paste('- variance:',binvar$variance,'\n'))
  cat(paste('- mode    :',binvar$mode,'\n'))
  cat(paste('- skewness:',binvar$skewness,'\n'))
  cat(paste('- kurtosis:',binvar$kurtosis,'\n'))
  invisible(binvar)
}

#'@title Binomial Mean
#'@description function to calculate the mean of the binomial distribution
#'@param trials the number of trials
#'@param prob the probability that success occurs
#'@return the mean of the binomial distribution
#'@export
#'@examples
#'bin_mean(10, 0.3)
bin_mean<-function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials,prob))
}


#'@title Binomial Variance
#'@description function to calculate the variance of the binomial distribution
#'@param trials the number of trials
#'@param prob the probability that success occurs
#'@return the variance of the binomial distribution
#'@export
#'@examples
#'bin_variance(10, 0.3)
bin_variance<-function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials,prob))
}

#'@title Binomial Mode
#'@description function to calculate the mode of the binomial distribution
#'@param trials the number of trials
#'@param prob the probability that success occurs
#'@return the mode of the binomial distribution
#'@export
#'@examples
#'bin_mode(10, 0.3)
bin_mode<-function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials,prob))
}

#'@title Binomial Skewness
#'@description function to calculate the skewness of the binomial distribution
#'@param trials the number of trials
#'@param prob the probability that success occurs
#'@return the skewness of the binomial distribution
#'@export
#'@examples
#'bin_skewness(10, 0.3)
bin_skewness<-function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials,prob))
}

#'@title Binomial Kurtosis
#'@description function to calculate the kurtosis of the binomial distribution
#'@param trials the number of trials
#'@param prob the probability that success occurs
#'@return the kurtosis of the binomial distribution
#'@export
#'@examples
#'bin_kurtosis(10, 0.3)
bin_kurtosis<-function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials,prob))
}
