dashboardPage(
    
    dashboardHeader(title = 'MLS Salary Data 2007-2019',
                    titleWidth = 300),
    
    dashboardSidebar(
        width = 300,
        sidebarUserPanel('By: Jay Cohen'),
        sidebarMenu(
            menuItem("Data", tabName = "data", icon = icon("database")))
    ),
    
    dashboardBody(
        tabItems(
            tabItem(tabName = "data",
                    fluidRow(
                        box(width = 4,
                            selectizeInput(inputId = "club",
                                           label = "Club",
                                           choices = unique(salaries$club_name),
                                           selected = 'Atlanta United',
                                           multiple = TRUE)),
                            
                        box(width = 4,  
                            sliderInput(inputId = "season",
                                        label = "Season",
                                        min = 2007, 
                                        max = 2019, 
                                        value = c(2007,2019),
                                        step = 1,
                                        sep = "")),
                            
                        box(width = 4,
                            checkboxGroupInput(inputId = "position",
                                               label = "Position", 
                                               choices = c('GK','D','M','F','None Listed'), 
                                               selected = c('GK','D','M','F','None Listed'),
                                               inline = TRUE))
                        ),
                    fluidRow(
                        box(
                            DT::DTOutput("salarytable"),
                                 width = 12)),
            
                    
                    )
                )
            )
)
