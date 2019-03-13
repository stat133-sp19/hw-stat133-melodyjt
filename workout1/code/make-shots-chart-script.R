# title: Make Shots Chart
# description: Using shots data to create plot visualizations
# input: shots-data, nba-court.jpg
# output: Pdf files of each players shot chart, facet shot chart of all players, png file shot chart of all players

#4) Shot Charts
library(jpeg)
library(grid)
library(ggplot2)

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

shots <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)

andre <- shots[shots$name == "Andre Iguodala",]
draymond <- shots[shots$name == "Draymond Green",]
kevin <- shots[shots$name == "Kevin Durant",]
klay <- shots[shots$name == "Klay Thompson",]
stephen <- shots[shots$name == "Stephen Curry",]

andre_shot_chart <- ggplot(data = andre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

draymond_shot_chart <- ggplot(data = draymond) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

kevin_shot_chart <- ggplot(data = kevin) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

klay_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

stephen_shot_chart <- ggplot(data = andre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

pdf('../images/andre-iguodala-shot-chart.pdf', width = 6.5, height = 5)
andre_shot_chart
dev.off()

pdf('../images/draymond-green-shot-chart.pdf', width = 6.5, height = 5)
draymond_shot_chart
dev.off()

pdf('../images/kevin-durant-shot-chart.pdf', width = 6.5, height = 5)
kevin_shot_chart
dev.off()

pdf('../images/klay-thompson-shot-chart.pdf', width = 6.5, height = 5)
klay_shot_chart
dev.off()

pdf('../images/stephen-curry-shot-chart.pdf', width = 6.5, height = 5)
stephen_shot_chart
dev.off()

facet_shot_chart <- ggplot(data = shots) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal()+
  facet_grid(~ name)
facet_shot_chart

png('../images/gsw-shot-charts.png', width=8,height=7, units="in", res = 72)
facet_shot_chart
dev.off()