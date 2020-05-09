function(input, output) {
  output$salarytable = renderDT(
    salaries %>%
      select('Season'=season,'Club'=club_name,'Last Name'=last_name, 'First Name'=first_name,'Position'=position,
             'Annualized Base Salary ($)'=current_annualized_base_salary,
             'Annualized Average Guaranteed Compensation ($)'=annualized_average_guaranteed_comp)
    %>% filter((Club == input$club) & 
                 (Season >= input$season[1] & Season <= input$season[2]))
    %>% filter(str_detect(Position, paste(input$position, collapse='|'))),
    rownames=FALSE)
}