library(shiny)

fluidPage(
    titlePanel('MLS Salary Data 2007-2019'),
    sidebarLayout(
        sidebarPanel(
            selectizeInput(inputId = "club",
                           label = "Club",
                           choices = unique(salaries$club_name)),
            selectizeInput(inputId = "season",
                           label = "Season",
                           choices = unique(salaries$season)),
            selectizeInput(inputId = "position",
                           label = "Position",
                           choices = c('GK','D','M','F'))
        ),
        mainPanel(
            tableOutput("salarytable")
        )
    )
)
