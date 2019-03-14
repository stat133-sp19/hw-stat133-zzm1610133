#Title: Making Shooting Chart

#Description: 
#This R script includes the Rcode plotting shooting chart of each player. 
#It indicates where the players shot the ball and whether the shot was made or not.

#Inputs:
#nba-court.jpg

#Outputs:
#klay-thompson-shot-chart.pdf
#stephen-curry-shot-chart.pdf
#kevin-durant-shot-chart.pdf
#draymond-green-shot-chart.pdf
#andre-iguodala-shot-chart.pdf
#gsw-shot-chart.pdf
#gsw-shot-chart.png

library(ggplot2)
library(jpeg)
library(grid)

court_file <- "../images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
ggsave(filename='../images/klay-thompson-shot-chart.pdf',width=6.5,height=5)

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
ggsave(filename='../images/stephen-curry-shot-chart.pdf',width=6.5,height=5)

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart:Kevin Durant (2016 season)') +
  theme_minimal()
ggsave(filename='../images/keven-durant-shot-chart.pdf',width=6.5,height=5)

green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
ggsave(filename='../images/draymond-green-shot-chart.pdf',width=6.5,height=5)

iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Adre Iguodala (2016 season)') +
  theme_minimal()
ggsave(filename='../images/andre-iguodala-shot-chart.pdf',width=6.5,height=5)

gsw_shots<-ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW Shots (2016 season)') +
  theme_minimal()+
  facet_wrap(~ name,ncol=3)
ggsave(filename='../images/gsw-shot-chart.pdf',width=8,height=7)
ggsave(filename='../images/gsw-shot-chart.png',width=8,height=7)
