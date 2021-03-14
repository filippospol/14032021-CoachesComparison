library(nbastatR)
library(tidyverse)
library(future)
library(ggrepel)
library(patchwork)

rm(list=ls())
source("C:\\Users\\Philippos\\Documents\\Projects\\Tools\\theme_white.R")


# nbastatR , tidyverse , future
# date_to = "2021-02-22" 


#FREE THROWS 
####################################################################################

plan(multiprocess)
teams_players_stats(seasons=2021, types='team',season_types="Regular Season",
                    tables='general',measures='Base',
                    modes='PerGame',is_rank=F,is_plus_minus=F,is_pace_adjusted=F,
                    date_to = "2021-02-22")

ryanFT <- dataGeneralTeams %>% 
    filter(nameTeam=="Minnesota Timberwolves") %>% 
    mutate(nameTeam=factor(ifelse(nameTeam == "Minnesota Timberwolves", 
                                "Ryan Saunders (31 games)", 
                                "")),
           FTRate=fta/fga,rankFTRate=28) %>% 
    select(nameTeam,ftm,rankFTM,fta,rankFTA,pctFT,pctFTRank,FTRate,rankFTRate)


plan(multiprocess)
teams_players_stats(seasons=2021, types='team',season_types="Regular Season",
                    tables='general',measures='Base',
                    modes='PerGame',is_rank=F,is_plus_minus=F,is_pace_adjusted=F,
                    date_from = "2021-02-22")

finchFT <- dataGeneralTeams %>% 
  filter(nameTeam=="Minnesota Timberwolves") %>% 
  mutate(nameTeam=factor(ifelse(nameTeam == "Minnesota Timberwolves", 
                                "Chris Finch (7 games)", 
                                "")),
         FTRate=fta/fga,rankFTRate=22) %>% 
  select(nameTeam,ftm,rankFTM,fta,rankFTA,pctFT,pctFTRank,FTRate,rankFTRate)


freethrows <- ryanFT %>% full_join(finchFT)


####################################################################################

plan(multiprocess)
teams_players_stats(seasons=2021, types='team',season_types="Regular Season",
                    tables='general',measures='Misc',
                    modes='PerGame',is_rank=F,is_plus_minus=F,is_pace_adjusted=F,
                    date_to = "2021-02-22")

ryanMisc <- dataGeneralTeams %>% 
  filter(nameTeam=="Minnesota Timberwolves") %>% 
  mutate(nameTeam=factor(ifelse(nameTeam == "Minnesota Timberwolves", 
                                "Ryan Saunders (31 games)", 
                                ""))) %>% 
  select(nameTeam,ptsOffTOV,ptsOffTOVRank,ptsSecondChance,ptsSecondChanceRank,
         ptsFastBreak,ptsFastBreakRank)

plan(multiprocess)
teams_players_stats(seasons=2021, types='team',season_types="Regular Season",
                    tables='general',measures='Misc',
                    modes='PerGame',is_rank=F,is_plus_minus=F,is_pace_adjusted=F,
                    date_from = "2021-02-22")

finchMisc <- dataGeneralTeams %>% 
  filter(nameTeam=="Minnesota Timberwolves") %>% 
  mutate(nameTeam=factor(ifelse(nameTeam == "Minnesota Timberwolves", 
                                "Chris Finch (7 games)", 
                                ""))) %>% 
  select(nameTeam,ptsOffTOV,ptsOffTOVRank,ptsSecondChance,ptsSecondChanceRank,
         ptsFastBreak,ptsFastBreakRank)


misc <- ryanMisc %>% full_join(finchMisc)


  
