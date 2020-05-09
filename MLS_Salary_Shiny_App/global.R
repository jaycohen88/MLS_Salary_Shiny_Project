library(data.table)
library(shiny)
library(tidyverse)
library(DT)


salaries = fread(file = 
"/Users/jaycohen/Documents/NYCDSA/Shiny_Project/MLS_Salary_Shiny_Project/Final_Salary_Data.csv")


salaries$current_annualized_base_salary=formatC(salaries$current_annualized_base_salary,digits=0,format='f',big.mark=',')
salaries$annualized_average_guaranteed_comp=formatC(salaries$annualized_average_guaranteed_comp,digits=0,format='f',big.mark=',')