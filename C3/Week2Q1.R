
### Load the httr and jsonlite libraries

library(httr)
library(jsonlite)

###
### Initialize variables for use in this R script

appname <- "github"
key <- "256039c0b14d87da4917"
secret <- "205e11498549728dd89fa825da1b5c5481344767"
url <- "https://api.github.com/users/jtleek/repos"

###
### 1. Find OAuth settings for github

oauth_endpoints(appname)

###
### 2. To make your own application, register at:
###    https://github.com/settings/applications
###    For the homepage url, use: http://github.com
###    For authorization callback url, use: http://localhost:1410

myapp <- oauth_app(appname, key = key, secret = secret)

###
### 3. Get OAuth credentials

github_token <- oauth2.0_token(oauth_endpoints(appname), myapp)

###
### 4. Access url https://api.github.com/users/jtleek/repos

gtoken <- config(token = github_token)
req <- GET(url, gtoken)
stop_for_status(req)

###
### 5. Find the time that the datasharing repo was created

text <- content(req, as = 'text')
json <- fromJSON(text)

print(json[json[['name']] == 'datasharing',][['created_at']])

### This should print the following:
### [1] "2013-11-07T13:25:07Z"
