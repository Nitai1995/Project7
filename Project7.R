#Install packages:
install.packages("lubridate", dependencies = TRUE)
#-------------------------------------------------------------------------------------------------------------------#

#Loading installed Packages:
library("lubridate", lib.loc = 'C:/Users/calpakkam.n/Documents/R/win-library/3.5')
#-------------------------------------------------------------------------------------------------------------------#
#Loading Dataset:
debt_df <- read.csv('C:\\Users\\calpakkam.n\\Downloads\\DebtPenny.csv')
head(debt_df)
population_df <- read.csv('C:/Users/calpakkam.n/Downloads/PopUS.csv', 
                          header = T, sep=',', fill = T)
head(population_df,10)

#DATA PREPROCESSING:
#1)Null Checking:
colSums(is.na(debt_df))
#--------------------------------------------------------------------------------------------------------------#

#2)Datatype Checking:
sapply(debt_df,class)

#Converting Record.Date datatype from factor to Date datatype:
#dates <- as.Date(factor(debt_df$Record.Date), format="%m-%d-%y")
dates <- ymd(factor(debt_df$Record.Date))
head(dates)
class(dates)
debt_df$Record.Date
head(debt_df, 100)

#-----------------------------------------------------------------------------------------------------------------#
#3)Outlier Checking:
drop_cols<-c('Record.Date', 'Source.Line.Number')
debtnodate_df <- debt_df[,!names(debt_df) %in% drop_cols]
head(debtnodate_df)
colMeans(debtnodate_df)
apply(debtnodate_df,2,median)

names(debtnodate_df)
