function(input, output) {
    output$salarytable = renderDataTable(
        salaries %>%
            select('Season'=season,'Club'=club_name,'Last Name'=last_name,
            'First Name'=first_name,'Position'=position,
            'Annualized Base Salary'=current_annualized_base_salary,
            'Annualized Average Guaranteed Compensation'=annualized_average_guaranteed_comp)
            %>% filter(Club == input$club & Season == input$season) %>%
            filter(str_detect(Position, input$position))
)
}
