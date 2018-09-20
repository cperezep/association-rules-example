# Author: Cristian Perez
# Email: cristian.camilo.2594@gmail.com
# GitHub: https://github.com/cristian7x

library(arules)
hobbies <- read.transactions('./hobbies_preferences.csv', sep=",")
summary(hobbies)
itemFrequencyPlot(hobbies, support = 0.1)
itemFrequencyPlot(hobbies, topN = 32)

#Apriory Algorithm
hobbiesrules <- apriori(hobbies, parameter = list(support = 0.1, confidence = 0.8, minlen = 3))
quality(hobbiesrules) <- round(quality(hobbiesrules), digits=3)
hobbiesrules.sorted <- sort(hobbiesrules, by="lift") 

inspect(hobbiesrules[1:15])
