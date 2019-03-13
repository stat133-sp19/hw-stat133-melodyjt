# title: "Make Shots Data"
# description: "Using the data to create table visualizations of the shots made by players"
# input(s): "csv files of each player"
# output(s): "Tables of the shots each player made and the summary for the shots each player made"

#2) Data
url1 <- "https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/andre-iguodala.csv"
destination1 <- "../data/andre-iguodala.csv"
download.file(url1, destination1)

url2 <- "https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/draymond-green.csv"
destination2 <- "../data/draymond-green.csv"
download.file(url2, destination2)

url3 <- "https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/kevin-durant.csv"
destination1 <- "../data/kevin-durant.csv"
download.file(url3, destination3)

url4 <- "https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/klay-thompson.csv"
destination1 <- "../data/klay-thompson.csv"
download.file(url4, destination4)

url5 <- "https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/stephen-curry.csv"
destination1 <- "../data/stephen-curry.csv"
download.file(url5, destination5)

#3) Data Preparation
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

iguodala$name <- "Andre Iguodala"
green$name <- "Draymond Green"
durant$name <- "Kevin Durant"
thompson$name <- "Klay Thompson"
curry$name <- "Stephen Curry"

iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"

iguodala$minute <- iguodala$period * 12 - iguodala$minutes_remaining
green$minute <- green$period * 12 - green$minutes_remaining
durant$minute <- durant$period * 12 - durant$minutes_remaining
thompson$minute <- thompson$period * 12 - thompson$minutes_remaining
curry$minute <- curry$period * 12 - curry$minutes_remaining

sink(file = "../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "../output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()

bind <- rbind(iguodala, green, durant, thompson, curry)

write.csv(bind, file = "../data/shots-data.csv")

sink(file = "../output/shots-data-summary.txt")
summary(bind)
sink()
