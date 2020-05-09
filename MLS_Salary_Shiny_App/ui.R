dashboardPage(
    dashboardHeader(title = 'MLS Salary Data 2007-2019',
                    titleWidth = 300),
    dashboardSidebar(
        width = 300,
        sidebarUserPanel('By: Jay Cohen'),
        sidebarMenu(
            menuItem("Data", tabName = "data", icon = icon("database"))),
        
        selectizeInput(inputId = "club",
                       label = "Club",
                       choices = unique(salaries$club_name),
                       selected = 'Atlanta United',
                       multiple = TRUE),
        
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
    
    dashboardBody(
        tabItems(
            tabItem(tabName = "data",
                    fluidRow(box(DT::DTOutput("salarytable"),
                                 width = 14)))
        )
    )
)
