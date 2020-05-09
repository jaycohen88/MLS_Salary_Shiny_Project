fluidPage(
    
    titlePanel('MLS Salary Data 2007-2019'),
    
    sidebarLayout(
        
        sidebarPanel(
            
            selectizeInput(inputId = "club",
                           label = "Club",
                           choices = unique(salaries$club_name)),
            
            sliderInput(inputId = "season",
                        label = "Season",
                        min = 2007, 
                        max = 2019, 
                        value = c(2007,2019),
                        step = 1,
                        sep = ""),
            
            checkboxGroupInput(inputId = "position",
                               label = "Position", 
                               choices = c('GK','D','M','F','None Listed'), 
                               selected = c('GK','D','M','F','None Listed'))
        ),
        
        mainPanel(
            DTOutput("salarytable")
        )
    )
)
