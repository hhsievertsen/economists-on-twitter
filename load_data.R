# load data, twitterecon, 2025-04-22 HHS

# libraries
library(arrow)        # to store parquet
library(data.table)   # to load csv



# Load data
twitterdata<-read_parquet("twitterdata.parquet")
repectwitter<-read_parquet("repectwitter.parquet")
repecwomen<-read_parquet("repecwomen.parquet")

# Merge data
repectwitter<-repectwitter[, .(surname, firstname, twitter)]
repecwomen<-repecwomen[, .(twitter)]
repecwomen[, female := 1]
repectwitter<-merge(repectwitter,repecwomen,by="twitter",all.x=TRUE)
twitterdata[, twitter := paste0("@", screen_name)]

twitterdata<-merge(repectwitter,twitterdata,by="twitter")