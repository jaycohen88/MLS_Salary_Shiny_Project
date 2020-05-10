function(input, output) {
  
  output$salarytable = renderDT(
    salaries %>%
      select('Season'=season,'Club'=club_name,'Last Name'=last_name, 'First Name'=first_name,'Position'=position,
             'Annualized Base Salary ($)'=current_annualized_base_salary,
             'Annualized Average Guaranteed Compensation ($)'=annualized_average_guaranteed_comp)
      %>% filter((Club %in% input$tableclub) & 
                 (Season >= input$tableseason[1] & Season <= input$tableseason[2]))
      %>% filter(str_detect(Position, paste(input$tableposition, collapse='|'))),
      rownames=FALSE)

  output$positionbarplot = renderPlot(
    positiontable %>%
      select(season,club_name,ispos,current_annualized_base_salary,annualized_average_guaranteed_comp)
      %>% filter((club_name %in% input$byposclub) & 
               (season >= input$byposseason[1] & season <= input$byposseason[2]))
      %>% group_by(ispos)
      %>% summarize(avg = mean(annualized_average_guaranteed_comp))
      %>% ggplot(aes(x= reorder(ispos, avg), y=avg)) + 
      geom_col(fill = "darkblue", width = .7) +
      labs(title = 'Mean Annualized Average Guaranteed Compensation by Position',
           x='Positions',
           y='Mean Annualized Average Guaranteed Compensation($)') +
      scale_y_continuous(labels=dollar, breaks=seq(0,700000,100000), limits = c(0,700000)) +
      scale_x_discrete(breaks=c("isGK","isD","isM","isF"), labels=c("GK","D","M","F")))
    
  
  
  

}