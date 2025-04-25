# csv to parquet, twitterecon, 2025-04-22 HHS

# libraries
library(arrow)        # to store parquet
library(data.table)   # to load csv




# Load data
df<-fread("tweetdata_20220807.csv",integer64="character", 
         quote = "\"",
         encoding = "UTF-8",
         fill = TRUE,
         showProgress = TRUE)

repectwitter<-fread("repectwitter.csv")

repecwomen<-fread("repecwomen.csv")



# Write data
write_parquet(df,  "twitterdata.parquet",compression="gzip",compression_level = 5)
write_parquet(repectwitter,  "repectwitter.parquet",compression="gzip",compression_level = 5)
write_parquet(repecwomen,  "repecwomen.parquet",compression="gzip",compression_level = 5)


