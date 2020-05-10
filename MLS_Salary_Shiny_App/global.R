library(data.table)
library(shiny)
library(tidyverse)
library(DT)
library(shinydashboard)
library(scales)

salaries = fread(file = 
"/Users/jaycohen/Documents/NYCDSA/Shiny_Project/MLS_Salary_Shiny_Project/Final_Salary_Data.csv")

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

salaries$current_annualized_base_salary=formatC(salaries$current_annualized_base_salary,digits=0,format='f',big.mark=',')
salaries$annualized_average_guaranteed_comp=formatC(salaries$annualized_average_guaranteed_comp,digits=0,format='f',big.mark=',')


