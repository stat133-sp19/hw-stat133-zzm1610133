#Title: Calculating the Statistics

#Description:
#There are a lot of needed statistics to calculate in the report.
#In this script, it contains the R code to calculate the statistics we need in the report.

#Input:
#klay-thompson.csv
#stephen-curry.csv
#kevin-durant.csv
#draymond-green.csv
#andre-iguodala.csv
#shots-data.csv

library(dplyr)
curry<-read.csv('../data/stephen-curry.csv')
durant<-read.csv('../data/kevin-durant.csv')
thompson<-read.csv('../data/klay-thompson.csv')
green<-read.csv('../data/draymond-green.csv')
iguodala<-read.csv('../data/andre-iguodala.csv')
gsw<-read.csv('../data/shots-data.csv')

curry_total<-length(curry$team_name)
durant_total<-length(durant$team_name)
thompson_total<-length(thompson$team_name)
green_total<-length(green$team_name)
iguodala_total<-length(iguodala$team_name)

curry_made_data<-filter(curry,shot_made_flag=='y')
durant_made_data<-filter(durant,shot_made_flag=='y')
thompson_made_data<-filter(thompson,shot_made_flag=='y')
green_made_data<-filter(green,shot_made_flag=='y')
iguodala_made_data<-filter(iguodala,shot_made_flag=='y')

curry_total<-length(curry_made_data$team_name)
durant_total<-length(durant_made_data$team_name)
thompson_total<-length(thompson_made_data$team_name)
green_total<-length(green_made_data$team_name)
iguodala_total<-length(iguodala_made_data$team_name)

gsw_2PTshoot<-filter(gsw,shot_type=='2PT Field Goal')
length(gsw_2PTshoot$X)
length(filter(gsw_2PTshoot,shot_made_flag=='shot_yes')$X)
gsw_3PTshoot<-filter(gsw,shot_type!='2PT Field Goal')

curry_2<-filter(gsw_2PTshoot,name=='Stephen Curry')
length(filter(curry_2,shot_made_flag=='shot_yes')$name)
curry_3<-filter(gsw_3PTshoot,name=='Stephen Curry')
length(filter(curry_3,shot_made_flag=='shot_yes')$name)

durant_2<-filter(gsw_2PTshoot,name=='Kevin Durant')
length(filter(durant_2,shot_made_flag=='shot_yes')$name)
durant_3<-filter(gsw_3PTshoot,name=='Kevin Durant')
length(filter(durant_3,shot_made_flag=='shot_yes')$name)

thompson_2<-filter(gsw_2PTshoot,name=='Klay Thompson')
length(filter(thompson_2,shot_made_flag=='shot_yes')$name)
thompson_3<-filter(gsw_3PTshoot,name=='Klay Thompson')
length(filter(thompson_3,shot_made_flag=='shot_yes')$name)

green_2<-filter(gsw_2PTshoot,name=='Draymond Green')
length(filter(green_2,shot_made_flag=='shot_yes')$name)
green_3<-filter(gsw_3PTshoot,name=='Draymond Green')
length(filter(green_3,shot_made_flag=='shot_yes')$name)

iguodala_2<-filter(gsw_2PTshoot,name=='Andre Iguodala')
length(filter(iguodala_2,shot_made_flag=='shot_yes')$name)
iguodala_3<-filter(gsw_3PTshoot,name=='Andre Iguodala')
length(filter(iguodala_3,shot_made_flag=='shot_yes')$name)


p1<-filter(gsw,period==1)
p2<-filter(gsw,period==2)
p3<-filter(gsw,period==3)
p4<-filter(gsw,period==4)
length(filter(p1,shot_made_flag=='shot_yes')$shot_made_flag)
length(filter(p2,shot_made_flag=='shot_yes')$shot_made_flag)
length(filter(p3,shot_made_flag=='shot_yes')$shot_made_flag)
length(filter(p4,shot_made_flag=='shot_yes')$shot_made_flag)
per1<-length(filter(p1,shot_made_flag=='shot_yes')$shot_made_flag)/length(p1$shot_made_flag=='shot_yes')
per2<-length(filter(p2,shot_made_flag=='shot_yes')$shot_made_flag)/length(p2$shot_made_flag=='shot_yes')
per3<-length(filter(p3,shot_made_flag=='shot_yes')$shot_made_flag)/length(p3$shot_made_flag=='shot_yes')
per4<-length(filter(p4,shot_made_flag=='shot_yes')$shot_made_flag)/length(p4$shot_made_flag=='shot_yes')

p13<-filter(gsw,period==1 & shot_type=='3PT Field Goal')
p23<-filter(gsw,period==2 & shot_type=='3PT Field Goal')
p33<-filter(gsw,period==3 & shot_type=='3PT Field Goal')
p43<-filter(gsw,period==4 & shot_type=='3PT Field Goal')
length(filter(p13,shot_made_flag=='shot_yes')$shot_made_flag)
length(filter(p23,shot_made_flag=='shot_yes')$shot_made_flag)
length(filter(p33,shot_made_flag=='shot_yes')$shot_made_flag)
length(filter(p43,shot_made_flag=='shot_yes')$shot_made_flag)
per13<-length(filter(p13,shot_made_flag=='shot_yes')$shot_made_flag)/length(p13$shot_made_flag=='shot_yes')
per23<-length(filter(p23,shot_made_flag=='shot_yes')$shot_made_flag)/length(p23$shot_made_flag=='shot_yes')
per33<-length(filter(p33,shot_made_flag=='shot_yes')$shot_made_flag)/length(p33$shot_made_flag=='shot_yes')
per43<-length(filter(p43,shot_made_flag=='shot_yes')$shot_made_flag)/length(p43$shot_made_flag=='shot_yes')

length(filter(curry_2,period==3)$name)
length(filter(curry_2,period==3&shot_made_flag=='shot_yes')$name)
length(filter(curry_3,period==3)$name)
length(filter(curry_3,period==3&shot_made_flag=='shot_yes')$name)
length(filter(durant_2,period==3)$name)
length(filter(durant_2,period==3&shot_made_flag=='shot_yes')$name)
length(filter(durant_3,period==3)$name)
length(filter(durant_3,period==3&shot_made_flag=='shot_yes')$name)
length(filter(thompson_2,period==3)$name)
length(filter(thompson_2,period==3&shot_made_flag=='shot_yes')$name)
length(filter(thompson_3,period==3)$name)
length(filter(thompson_3,period==3&shot_made_flag=='shot_yes')$name)
length(filter(green_2,period==3)$name)
length(filter(green_2,period==3&shot_made_flag=='shot_yes')$name)
length(filter(green_3,period==3)$name)
length(filter(green_3,period==3&shot_made_flag=='shot_yes')$name)
length(filter(iguodala_2,period==3)$name)
length(filter(iguodala_2,period==3&shot_made_flag=='shot_yes')$name)
length(filter(iguodala_3,period==3)$name)
length(filter(iguodala_3,period==3&shot_made_flag=='shot_yes')$name)
