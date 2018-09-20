# Author: Cristian Perez
# Email: cristian.camilo.2594@gmail.com
# GitHub: https://github.com/cristian7x

library(arules)
music <- read.transactions('./music_preferences.csv', sep=",")
summary(music)
itemFrequencyPlot(music, support = 0.1)
itemFrequencyPlot(music, topN = 20)

#Apriory Algorithm
musicrules <- apriori(music, parameter = list(support = 0.06, confidence = 0.8, minlen = 4))
quality(musicrules) <- round(quality(musicrules), digits=3)
musicrules.sorted <- sort(musicrules, by="lift") 

inspect(musicrules[1:20])
