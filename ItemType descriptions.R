#This script provides an example of joining two Socrata datasets:
#   ILS Codes Data Dictionary (pbt3-ytbc) 
#   Checkouts by Title physical items (3h5r-qv5w)
#
# Installs and loads Rsocrata
if(!require(RSocrata)){
  install.packages("RSocrata")
  library(RSocrata)
}
#
#Connects and downloads ILS Codes Data Dictionary from Socrata website
url <- "https://data.seattle.gov/Community/Integrated-Library-System-ILS-Data-Dictionary/pbt3-ytbc"
dfCodes <- read.socrata(url)
#
#Connects to Soctrata and downloads 5 rows of example data from "Checkouts by title (Physical Items)"
url2 <- "https://data.seattle.gov/resource/5src-czff.csv?$limit=5&$offset=0&checkoutyear=2017"
df<-read.socrata(url2)
# Get a free API key from Socrata if you want to download more/faster.
#
#Alternative approach in case you want to connect to a local copy of "Checkouts by title (Physical Items)"
#df<-read.csv<-"PATH TO YOUR LOCALLY SAVED COPY"
#
#Data Dictionary and Checkouts by title (Physical Items) joined
joined<- merge(x=df, y=dfCodes, by.x = "itemtype", by.y = "Code", all.x = TRUE)
#
#Saves the file in your working directory
write.csv(joined, "~/example_merge.csv")
head(joined)
print("A file called example_merge.csv has been saved to your working directory, with ILS Collection Codes Data Dictionary merged to 5 example rows from Checkouts by title (Physical Items).")


