# Load the package
library(sqldf)
library(ggplot2)

#load the data
data <- read.csv(file='c://data/01-ria.mt_2016-05-01.tsv', header = FALSE, sep = '\t')
#remove blank columns
data <- Filter(function(x)!all(is.na(x)), data)

head(data$V1)

#define the sql ---------------------------
sqlOutput <- sqldf('
                  
                  
SELECT 
V13 AS Origin
,COUNT(*) AS numOfOccurances 
                  
FROM data 
                  
GROUP BY V13
ORDER BY COUNT(*) DESC 
LIMIT 5
                  
                  
                  ')

#------------------------------------------

#Plot as a histogram showing what Origin is responsible for the most clicks
ggplot(data=sqlOutput, aes(x=Origin, y=numOfOccurances, fill=numOfOccurances)) +
  geom_bar(colour="black", stat="identity") +
  guides(fill=FALSE)



