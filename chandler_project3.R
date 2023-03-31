#Program: Chandler_project3.R
#Program performs a cluster analysis on MLB players over the past 100 years 
#and uses this to determine prospective players potential output based on 
#high school, college, and minor league statistics. It can also be used to compare
#players from different eras as the statistics used are adjusted for such cases.
#Players who stand above the rest are easily seen as outliers.
#Author: Thomas Chandler
#Date: April 17, 2022


#install and load packages to be used in analysis
install.packages("factoextra")
library(factoextra)
library(ggplot2)
library(cluster)

#load data and assign to variable
df <- read.csv("FG3.csv", header = TRUE)


#scale to a mean of zero and standard deviation of 1
df <- scale(df)

head(df)


#find optimal number of clusters based on gap statistic
gap_stat <- clusGap(df, FUN=kmeans,nstart=25,K.max=5,B=50)

#plot gap statistic
fviz_gap_stat(gap_stat)

#perform analysis
km_analysis <- kmeans(df,centers=4,nstart=25)
km_analysis


#plot result
fviz_cluster(km_analysis,data=df)













