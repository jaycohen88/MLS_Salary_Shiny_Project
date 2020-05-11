library(data.table)
library(shiny)
library(tidyverse)
library(DT)
library(shinydashboard)
library(scales)
library(plotly)
library(viridis)

salaries = fread(file = "/Users/jaycohen/Documents/NYCDSA/Shiny_Project/MLS_Salary_Shiny_Project/MLS_Salary_Shiny_App/Final_Salary_Data.csv")

GKtable = mutate(salaries,'isGK' = str_detect(position, 'GK'))
GKtable = filter(GKtable, isGK == 'TRUE')
GKtable$isGK = gsub('TRUE','isGK', GKtable$isGK, fixed=TRUE)
GKtable = rename(GKtable, 'ispos' = isGK)

Dtable = mutate(salaries,'isD' = str_detect(position, 'D'))
Dtable = filter(Dtable, isD == 'TRUE')
Dtable$isD = gsub('TRUE','isD', Dtable$isD, fixed=TRUE)
Dtable = rename(Dtable, 'ispos' = isD)

Mtable = mutate(salaries,'isM' = str_detect(position, 'M'))
Mtable = filter(Mtable, isM == 'TRUE')
Mtable$isM = gsub('TRUE','isM', Mtable$isM, fixed=TRUE)
Mtable = rename(Mtable, 'ispos' = isM)

Ftable = mutate(salaries,'isF' = str_detect(position, 'F'))
Ftable = filter(Ftable, isF == 'TRUE')
Ftable$isF = gsub('TRUE','isF', Ftable$isF, fixed=TRUE)
Ftable = rename(Ftable, 'ispos' = isF)

positiontable = rbind(GKtable, Dtable, Mtable, Ftable)

mainsalariestable = salaries

mainsalariestable$current_annualized_base_salary=formatC(mainsalariestable$current_annualized_base_salary,digits=0,format='f',big.mark=',')
mainsalariestable$annualized_average_guaranteed_comp=formatC(mainsalariestable$annualized_average_guaranteed_comp,digits=0,format='f',big.mark=',')

seasontable = salaries

seasontable$season = as.factor(seasontable$season)

points = fread(file = '/Users/jaycohen/Documents/NYCDSA/Shiny_Project/MLS_Salary_Shiny_Project/MLS_Salary_Shiny_App/Points_Data_cleaned.csv')

minipoints = points %>% select(club, season, points, points_per_match)

minisalaries = salaries %>% select(club=club_name, season, annualized_average_guaranteed_comp)
minisalaries = filter(minisalaries, club != 'Major League Soccer' & club != 'Inter Miami' & club != 'Nashville SC')

clubspenddf = minisalaries %>% group_by(club, season) %>% summarise(sum(annualized_average_guaranteed_comp))

pointsbyclubspend = full_join(minipoints, clubspenddf)

pointsbyclubspend = rename(pointsbyclubspend, total_spend = 'sum(annualized_average_guaranteed_comp)')
pointsbyclubspend = rename(pointsbyclubspend, club_name = 'club')
pointsbyclubspend$season = as.character(pointsbyclubspend$season)
pointsbyclubspend = unite(pointsbyclubspend, 'club', c('club_name','season'), sep = ' ', remove = FALSE)
pointsbyclubspend = select(pointsbyclubspend, club, season, total_spend, points_per_match)


