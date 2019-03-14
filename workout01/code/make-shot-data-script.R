#Title: Shooting Data Preparation

#Description:
#In this R script, we input the data, and do sevral preparation like adding the columns, renaming the headers, outputting summaries, creating necessary variables, and outputing the csv file. 

#Inputs:
#klay-thompson.csv
#stephen-curry.csv
#kevin-durant.csv
#draymond-green.csv
#andre-iguodala.csv

#Outputs:
#shots-data.csv
#klay-thompson-summary.txt
#stephen-curry-summary.txt
#kevin-durant-summary.txt
#draymond-green-summary.txt
#andre-iguodala-summary.txt
#shots-data-summary.txt


library(readr)
library(dplyr)

setwd('~/Computing Data/workout1/code')

#Input the Data
curry<-read_csv('../data/stephen-curry.csv', col_types = c('ccnnnncccncnn'))
durant<-read_csv('../data/kevin-durant.csv', col_types = c('ccnnnncccncnn'))
green<-read_csv('../data/draymond-green.csv', col_types = c('ccnnnncccncnn'))
thompson<-read_csv('../data/klay-thompson.csv', col_types = c('ccnnnncccncnn'))
iguodala<-read_csv('../data/andre-iguodala.csv', col_types = c('ccnnnncccncnn'))

#Add the Name Column
curry$name<-rep('Stephen Curry', length(curry$team_name))
curry<-curry[c(14,1:13)]
durant$name<-rep('Kevin Durant', length(durant$team_name))
durant<-durant[c(14,1:13)]
iguodala$name<-rep('Andre Iguodala', length(iguodala$team_name))
iguodala<-iguodala[c(14,1:13)]
thompson$name<-rep('Klay Thompson', length(thompson$team_name))
thompson<-thompson[c(14,1:13)]
green$name<-rep('Draymond Green', length(green$team_name))
green<-green[c(14,1:13)]

#Rename
curry$shot_made_flag[curry$shot_made_flag=='y']<-'shot_yes'
curry$shot_made_flag[curry$shot_made_flag=='n']<-'shot_no'
durant$shot_made_flag[durant$shot_made_flag=='y']<-'shot_yes'
durant$shot_made_flag[durant$shot_made_flag=='n']<-'shot_no'
thompson$shot_made_flag[thompson$shot_made_flag=='y']<-'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag=='n']<-'shot_no'
green$shot_made_flag[green$shot_made_flag=='y']<-'shot_yes'
green$shot_made_flag[green$shot_made_flag=='n']<-'shot_no'
iguodala$shot_made_flag[iguodala$shot_made_flag=='y']<-'shot_yes'
iguodala$shot_made_flag[iguodala$shot_made_flag=='n']<-'shot_no'

#Create the New Variable -- Minute
curry<-mutate(curry,minute=12*period-minutes_remaining)
durant<-mutate(durant,minute=12*period-minutes_remaining)
iguodala<-mutate(iguodala,minute=12*period-minutes_remaining)
green<-mutate(green,minute=12*period-minutes_remaining)
thompson<-mutate(thompson,minute=12*period-minutes_remaining)

#Output the Summary
sink(file='../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()
sink(file='../output/kevin-durant-summary.txt')
summary(durant)
sink()
sink(file='../output/klay-thompson-summary.txt')
summary(thompson)
sink()
sink(file='../output/stephen-curry-summary.txt')
summary(curry)
sink()
sink(file='../output/draymond-green-summary.txt')
summary(green)
sink()

#Bind the Data
shots_data<-rbind(curry,durant,thompson,green,iguodala)
shots_data<-mutate(shots_data,player=c(rep('curry')))

#Output the Data
write.csv(x=shots_data,file='../data/shots-data.csv')

#Summary the Assembled Table
sink(file='../output/shots-data-summary.txt')
summary(shots_data)
sink()