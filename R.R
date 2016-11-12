' general, shortcuts，non-code notes
run line/selection: cmd + enter
https://cran.r-project.org/doc/contrib/Short-refcard.pdf
True/False -> T/F
'

# help
?rnorm
help.search("rnorm") #vague search
args("rnorm")
rnorm

# basics
getwd()
setwd("/Users/sz/Desktop/Coursera_R")
dir() #ls
x<-1 #assign 
class(x) #show type/class
dim(m) #show dimension
attributes(m) #show attributes of an object
c() #generic combine 
length()
sum(condition) #count on conditions T=1,F=0

# expore
names(obj)
colnames(df)
head(df,2)
tail(df,5)
str(obj) #show structure of an arbitrary R object 
summary()

# subset (clean)
x[condition] #x[!is.na(x)] for non-NA

# computation
mean(x, na.rm=T) #mean w/o NA

# misc
install.packages("swirl")

library(httr)
oauth_endpoints("github")
myapp ", secret = "")
github_token  req  stop_for_status(req)
content(req)
BROWSE("https://api.github.com/users/jtleek/repos",authenticate("Access Token","x-oauth-basic","basic"))


install.packages()
library()


#I/O
########################################################################################################
q <- url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
readLines(q, 10)
q5 <- read.fwf(file = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", 
               skip = 4, 
               widths = c(12, 7,4, 9,4, 9,4, 9,4))
# download file from server
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", 
              destfile = "q1.csv")
# read csv file
q1 <- read.csv("q1.csv", header = TRUE)


#df manipulation
########################################################################################################
# create a logical vector
q1 <- mutate(q1, agricultureLogical=factor((ACR == 3 & AGS == 6), levels = c(TRUE, FALSE)))