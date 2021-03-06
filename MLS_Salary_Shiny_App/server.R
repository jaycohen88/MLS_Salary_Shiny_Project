function(input, output, session) {
  
  filtertable = reactive({
    mainsalariestable %>%
      dplyr::select('Season'=season,'Club'=club_name,'Last Name'=last_name, 'First Name'=first_name,'Position'=position,
             'Annualized Base Salary'=current_annualized_base_salary, 'Annualized Average Guaranteed Compensation'=annualized_average_guaranteed_comp) %>% dplyr::filter((Club %in% input$tableclub) & 
                 (Season >= input$tableseason[1] & Season <= input$tableseason[2])) %>% dplyr::filter(str_detect(Position, paste(input$tableposition, collapse='|')))
    })
  
  output$salarytable = renderDT(
    datatable(filtertable(), rownames=FALSE, options = list(pageLength = 25, order = list(list(2, 'asc'), list(3, 'asc'), list(0, 'desc')))) %>% formatCurrency(columns=c('Annualized Base Salary','Annualized Average Guaranteed Compensation'), digits=0))
  
  output$seasonboxplot1 = renderPlot(
    seasontable %>%
      select(season,club_name,last_name,first_name,annualized_average_guaranteed_comp)
      %>% ggplot(aes(x=season, y=annualized_average_guaranteed_comp, fill=season)) +
          geom_boxplot() +
          scale_fill_viridis(direction=-1, discrete=TRUE) +
          labs(title = 'Distribution of Annualized Average Guaranteed Compensation by Season',
              x='Season',
              y='Annualized Average Guaranteed Compensation') +
          theme(legend.position = "none") +
          scale_y_continuous(labels=dollar, breaks=seq(0,7300000,1000000), limits = c(0,7300000)))
  
  output$seasonboxplot2 = renderPlot(
    seasontable %>%
      select(season, annualized_average_guaranteed_comp)
    %>% ggplot(aes(x=season, y=annualized_average_guaranteed_comp, fill=season)) +
      geom_boxplot() +
      scale_fill_viridis(direction=-1, discrete=TRUE) +
      labs(title = '$0 - $1,000,000 Section of Distribution of Annualized Average Guaranteed Compensation by Season',
           x='Season',
           y='Annualized Average Guaranteed Compensation') +
      theme(legend.position = "none") +
      coord_cartesian(ylim = c(0, 1000000)) +
      scale_y_continuous(labels=dollar, breaks=seq(0,1000000,100000)))
  
  fillseasonhist1 = reactive({
    if (input$chooseseason1 == '2019') {
      print("#440154FF")
    } else if (input$chooseseason1 == '2018') {
      print('#481F70FF')
    } else if (input$chooseseason1 == '2017') {
      print('#443A83FF')
    } else if (input$chooseseason1 == '2016') {
      print('#3B528BFF')
    } else if (input$chooseseason1 == '2015') {
      print('#31688EFF')
    } else if (input$chooseseason1 == '2014') {
      print('#287C8EFF')
    } else if (input$chooseseason1 == '2013') {
      print('#21908CFF')
    } else if (input$chooseseason1 == '2012') {
      print('#20A486FF')
    } else if (input$chooseseason1 == '2011') {
      print('#35B779FF')
    } else if (input$chooseseason1 == '2010') {
      print('#5DC863FF')
    } else if (input$chooseseason1 == '2009') {
      print('#8FD744FF')
    } else if (input$chooseseason1 == '2008') {
      print('#C7E020FF')
    } else if (input$chooseseason1 == '2007') {
      print('#FDE725FF')
    }})
  
  fillseasonhist2 = reactive({
    if (input$chooseseason2 == '2019') {
      print("#440154FF")
    } else if (input$chooseseason2 == '2018') {
      print('#481F70FF')
    } else if (input$chooseseason2 == '2017') {
      print('#443A83FF')
    } else if (input$chooseseason2 == '2016') {
      print('#3B528BFF')
    } else if (input$chooseseason2 == '2015') {
      print('#31688EFF')
    } else if (input$chooseseason2 == '2014') {
      print('#287C8EFF')
    } else if (input$chooseseason2 == '2013') {
      print('#21908CFF')
    } else if (input$chooseseason2 == '2012') {
      print('#20A486FF')
    } else if (input$chooseseason2 == '2011') {
      print('#35B779FF')
    } else if (input$chooseseason2 == '2010') {
      print('#5DC863FF')
    } else if (input$chooseseason2 == '2009') {
      print('#8FD744FF')
    } else if (input$chooseseason2 == '2008') {
      print('#C7E020FF')
    } else if (input$chooseseason2 == '2007') {
      print('#FDE725FF')
    }})
  
  output$season1histogram = renderPlot(
    seasontable %>%
      select(season,annualized_average_guaranteed_comp)
      %>% filter(season == input$chooseseason1)
      %>% ggplot(aes(annualized_average_guaranteed_comp)) +
          geom_histogram(breaks=c(seq(0, 1000000, by=25000), 7500000), fill=fillseasonhist1()) +
          labs(x="Annualized Average Guaranteed Compensation", y="Number of Players") +
          coord_cartesian(xlim=c(0,1000000), ylim=c(0,200)) +
          scale_x_continuous(breaks=c(seq(0, 1000000, by=100000)), labels=c('$0', '$100,000', '$200,000', '$300,000', '$400,000',
                                                                            '$500,000', '$600,000', '$700,000', '$800,000','$900,000','$1,000,000+')))
  output$season2histogram = renderPlot(
    seasontable %>%
      select(season,annualized_average_guaranteed_comp)
      %>% filter(season == input$chooseseason2)
      %>% ggplot(aes(annualized_average_guaranteed_comp)) +
          geom_histogram(breaks=c(seq(0, 1000000, by=25000), 7500000), fill=fillseasonhist2()) +
          labs(x="Annualized Average Guaranteed Compensation", y="Number of Players") +
          coord_cartesian(xlim=c(0,1000000), ylim=c(0,200)) +
          scale_x_continuous(breaks=c(seq(0, 1000000, by=100000)), labels=c('$0', '$100,000', '$200,000', '$300,000', '$400,000',
                                                                            '$500,000', '$600,000', '$700,000', '$800,000','$900,000','$1,000,000+')))
          
  output$positionbarplot = renderPlot(
    positiontable %>%
      select(season,club_name,ispos,current_annualized_base_salary,annualized_average_guaranteed_comp)
      %>% filter((club_name %in% input$byposclub) & 
               (season >= input$byposseason[1] & season <= input$byposseason[2]))
      %>% group_by(ispos)
      %>% summarize(pavg = mean(annualized_average_guaranteed_comp))
      %>% ggplot(aes(x=reorder(ispos,pavg), y=pavg)) + 
          geom_col(fill = "azure4", width = .7) +
          labs(title = 'Mean Annualized Average Guaranteed Compensation by Position',
              x='Position',
              y='Mean Annualized Average Guaranteed Compensation') +
          scale_y_continuous(labels=dollar, breaks=seq(0,700000,100000), limits = c(0,700000)) +
          scale_x_discrete(breaks=c("isGK","isD","isM","isF"), labels=c("GK","D","M","F")))
  
  fillclub1box = reactive({
    if (str_detect(input$chooseclub1, '2019') == 'TRUE') {
      print("#440154FF")
    } else if (str_detect(input$chooseclub1, '2018') == 'TRUE') {
      print('#481F70FF')
    } else if (str_detect(input$chooseclub1, '2017') == 'TRUE') {
      print('#443A83FF')
    } else if (str_detect(input$chooseclub1, '2016') == 'TRUE') {
      print('#3B528BFF')
    } else if (str_detect(input$chooseclub1, '2015') == 'TRUE') {
      print('#31688EFF')
    } else if (str_detect(input$chooseclub1, '2014') == 'TRUE') {
      print('#287C8EFF')
    } else if (str_detect(input$chooseclub1, '2013') == 'TRUE') {
      print('#21908CFF')
    } else if (str_detect(input$chooseclub1, '2012') == 'TRUE') {
      print('#20A486FF')
    } else if (str_detect(input$chooseclub1, '2011') == 'TRUE') {
      print('#35B779FF')
    } else if (str_detect(input$chooseclub1, '2010') == 'TRUE') {
      print('#5DC863FF')
    } else if (str_detect(input$chooseclub1, '2009') == 'TRUE') {
      print('#8FD744FF')
    } else if (str_detect(input$chooseclub1, '2008') == 'TRUE') {
      print('#C7E020FF')
    } else if (str_detect(input$chooseclub1, '2007') == 'TRUE') {
      print('#FDE725FF')
    }})
  
  fillclub2box = reactive({
    if (str_detect(input$chooseclub2, '2019') == 'TRUE') {
      print("#440154FF")
    } else if (str_detect(input$chooseclub2, '2018') == 'TRUE') {
      print('#481F70FF')
    } else if (str_detect(input$chooseclub2, '2017') == 'TRUE') {
      print('#443A83FF')
    } else if (str_detect(input$chooseclub2, '2016') == 'TRUE') {
      print('#3B528BFF')
    } else if (str_detect(input$chooseclub2, '2015') == 'TRUE') {
      print('#31688EFF')
    } else if (str_detect(input$chooseclub2, '2014') == 'TRUE') {
      print('#287C8EFF')
    } else if (str_detect(input$chooseclub2, '2013') == 'TRUE') {
      print('#21908CFF')
    } else if (str_detect(input$chooseclub2, '2012') == 'TRUE') {
      print('#20A486FF')
    } else if (str_detect(input$chooseclub2, '2011') == 'TRUE') {
      print('#35B779FF')
    } else if (str_detect(input$chooseclub2, '2010') == 'TRUE') {
      print('#5DC863FF')
    } else if (str_detect(input$chooseclub2, '2009') == 'TRUE') {
      print('#8FD744FF')
    } else if (str_detect(input$chooseclub2, '2008') == 'TRUE') {
      print('#C7E020FF')
    } else if (str_detect(input$chooseclub2, '2007') == 'TRUE') {
      print('#FDE725FF')
    }})
  
  output$club1boxplot1 = renderPlot(
    clubtable
    %>% filter(club == input$chooseclub1)
    %>% ggplot(aes(club, annualized_average_guaranteed_comp)) +
        geom_boxplot(fill=fillclub1box()) +
        labs(title = 'Distribution of Annualized Average Guaranteed Compensation',
            x='Club',
            y='Annualized Average Guaranteed Compensation') +
        scale_y_continuous(labels=dollar, breaks=seq(0,7300000,1000000), limits = c(0,7300000)))
  
  output$club2boxplot1 = renderPlot(
    clubtable
    %>% filter(club == input$chooseclub2)
    %>% ggplot(aes(club, annualized_average_guaranteed_comp)) +
        geom_boxplot(fill=fillclub2box()) +
        labs(title = 'Distribution of Annualized Average Guaranteed Compensation',
            x='Club',
            y='Annualized Average Guaranteed Compensation') +
        scale_y_continuous(labels=dollar, breaks=seq(0,7300000,1000000), limits = c(0,7300000)))
  
  output$club1boxplot2 = renderPlot(
    clubtable
    %>% filter(club == input$chooseclub1)
    %>% ggplot(aes(club, annualized_average_guaranteed_comp)) +
      geom_boxplot(fill=fillclub1box()) +
      labs(title = '$0 - $1,000,000 Section of Distribution of Annualized Average Guaranteed Compensation',
           x='Club',
           y='Annualized Average Guaranteed Compensation') +
      coord_cartesian(ylim = c(0, 1000000)) +
      scale_y_continuous(labels=dollar, breaks=seq(0,1000000,100000)))
  
  output$club2boxplot2 = renderPlot(
    clubtable
    %>% filter(club == input$chooseclub2)
    %>% ggplot(aes(club, annualized_average_guaranteed_comp)) +
      geom_boxplot(fill=fillclub2box()) +
      labs(title = '$0 - $1,000,000 Section of Distribution of Annualized Average Guaranteed Compensation',
           x='Club',
           y='Annualized Average Guaranteed Compensation') +
      coord_cartesian(ylim = c(0, 1000000)) +
      scale_y_continuous(labels=dollar, breaks=seq(0,1000000,100000)))
  
  output$pointsscatterplot = renderPlotly(
    ggplot(pointsbyclubspend, aes(season_salary_total, points_per_match)) + geom_point(aes(color=season, text=club)) +
      labs(title = 'Points Per Match By Club Season Salary Total', x='Club Season Salary Total', y='Points Per Match') + 
      scale_color_viridis(direction = -1, discrete = TRUE) +
      scale_x_continuous(labels=dollar),
    ggplotly(tooltip = 'text'))
  
  output$pointsscatterplotlog = renderPlotly(
    ggplot(pointsbyclubspend, aes(x=log10(season_salary_total), y=points_per_match)) + geom_point(aes(color=season, text=club)) +
      geom_smooth(method=lm) +
      labs(title = 'Points Per Match By Log of Club Season Salary Total', x='Log of Club Season Salary Total', y='Points Per Match') + 
      scale_color_viridis(direction = -1, discrete = TRUE),
    ggplotly(tooltip = 'text'))
  
}
