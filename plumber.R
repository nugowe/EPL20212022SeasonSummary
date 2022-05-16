#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

RPackages<-c("polite", "rvest")

for (i in RPackages){install.packages(i)}


library(plumber)
library(rvest)
library(polite)

url <- "https://en.wikipedia.org/wiki/2021%E2%80%9322_Premier_League"


session = bow(user_agent = "EPL-Table-Scrape", url)

EPLTable <- scrape(session) %>% html_nodes("table.wikitable:nth-child(29)") %>% html_table()

EPLTable <- as.data.frame(EPLTable)

#* @apiTitle EPL Table Summary 2021/2022 Season


#* Echo back the input
#* @param EPLChampions The message to echo
#* @get /EPLChampions
function(EPLChampions = "") {
  EPLChampions1 <- EPLTable$Team[c(1)]
  EPLChampions2 <- gsub('.{4}$', '', EPLChampions1)
  EPLChampions <- EPLChampions2
  
}


#* Echo back the input
#* @param ChampionsLeagueTeams The message to echo
#* @get /ChampionsLeagueTeams
function(ChampionsLeagueTeams = "") {
  ChampionsLeagueCleanup <- EPLTable$Team[c(1:4)]
  ChampionsLeagueCleanup1 <- gsub('.{4}$', '', ChampionsLeagueCleanup)
  ChampionsLeagueTeams <- ChampionsLeagueCleanup1
    
}

#* Echo back the input
#* @param msg The RelegatedTeams to echo
#* @get /RelegatedTeams
function(RelegatedTeams = "") {
  RelegatedTeamsCleanup <- EPLTable$Team[c(18:20)]
  #RelegatedTeamsCleanup1 <- gsub('.{4}$', '', RelegatedTeamsCleanup)
  RelegatedTeams <- RelegatedTeamsCleanup
  
}


#* Echo back the input
#* @param Europa The message to echo
#* @get /EuropaTeams
function(EuropaTeams = "") {
  EuropaTeamsCleanup <- EPLTable$Team[c(5:6)]
  EuropaTeamsCleanup1 <- gsub('.{4}$', '', EuropaTeamsCleanup)
  EuropaTeams <- EuropaTeamsCleanup1
  
}
