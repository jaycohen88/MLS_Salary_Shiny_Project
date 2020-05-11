function(input, output) {
  
  output$salarytable = renderDT(
    mainsalariestable %>%
      select('Season'=season,'Club'=club_name,'Last Name'=last_name, 'First Name'=first_name,'Position'=position,
             'Annualized Base Salary ($)'=current_annualized_base_salary,
             'Annualized Average Guaranteed Compensation ($)'=annualized_average_guaranteed_comp)
      %>% filter((Club %in% input$tableclub) & 
                 (Season >= input$tableseason[1] & Season <= input$tableseason[2]))
      %>% filter(str_detect(Position, paste(input$tableposition, collapse='|'))),
      rownames=FALSE)

  output$seasonboxplot = renderPlot(
    seasontable %>%
      select(season,club_name,last_name,first_name,annualized_average_guaranteed_comp)
      %>% ggplot(aes(season,annualized_average_guaranteed_comp)) +
          geom_boxplot() +
          labs(title = 'Mean Annualized Average Guaranteed Compensation by Season',
              x='Season',
              y='Mean Annualized Average Guaranteed Compensation ($)') +
          scale_y_continuous(labels=dollar, breaks=seq(0,700000,100000), limits = c(0,700000)))
  
  output$positionbarplot = renderPlot(
    positiontable %>%
      select(season,club_name,ispos,current_annualized_base_salary,annualized_average_guaranteed_comp)
      %>% filter((club_name %in% input$byposclub) & 
               (season >= input$byposseason[1] & season <= input$byposseason[2]))
      %>% group_by(ispos)
      %>% summarize(pavg = mean(annualized_average_guaranteed_comp))
      %>% ggplot(aes(x=reorder(ispos,pavg), y=pavg)) + 
          geom_col(fill = "darkblue", width = .7) +
          labs(title = 'Mean Annualized Average Guaranteed Compensation by Position',
              x='Position',
              y='Mean Annualized Average Guaranteed Compensation ($)') +
          scale_y_continuous(labels=dollar, breaks=seq(0,700000,100000), limits = c(0,700000)) +
          scale_x_discrete(breaks=c("isGK","isD","isM","isF"), labels=c("GK","D","M","F")))

  output$clubboxplot = renderPlot(
    salaries %>%
      select(season,club_name,club_abbr,last_name,first_name,annualized_average_guaranteed_comp)
      %>% filter(season == '2019')
      %>% filter(club_name == input$chooseclub1 | club_name == input$chooseclub2 | club_name == input$chooseclub3)
      %>% ggplot(aes(club_name, annualized_average_guaranteed_comp)) +
          geom_boxplot() +
          labs(title = '2019 Mean Annualized Average Guaranteed Compensation by Club',
              x='Club',
              y='Mean Annualized Average Guaranteed Compensation ($)') +
          scale_y_continuous(labels=dollar, breaks=seq(0,700000,100000), limits = c(0,700000)))
  
  output$pointsscatterplot = renderPlotly(
    ggplot(pointsbyclubspend, aes(total_spend, points_per_match, text = club)) + geom_point(color='darkblue') +
      labs(title = 'Points Per Match By Club Total Spend', x='Annual Salary Total ($)', y='Points Per Match') + 
      scale_x_continuous(labels=dollar),
    ggplotly(tooltip='text'))
  
  
}

