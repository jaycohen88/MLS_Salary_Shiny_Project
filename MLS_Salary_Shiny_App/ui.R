dashboardPage(
    
    dashboardHeader(title = 'MLS Salary Data 2007-2019',
                    titleWidth = 300),
    
    dashboardSidebar(
        width = 300,
        sidebarUserPanel('By: Jay Cohen'),
        sidebarMenu(
            menuItem("Data", tabName = "data", icon = icon("database")),
            menuItem("By Season", tabName = "byseason", icon = icon("calendar")),
            menuItem("By Position", tabName = "byposition", icon = icon("search-location")),
            menuItem("2019 By Club", tabName = "byclub", icon = icon("users"))
            )),
    
    dashboardBody(
        tabItems(
            tabItem(tabName = "data",
                    fluidRow(box(width = 4,
                            selectizeInput(inputId = "tableclub",
                                           label = "Club",
                                           choices = unique(salaries$club_name),
                                           selected = 'Atlanta United',
                                           multiple = TRUE)),
                        box(width = 4,  
                            sliderInput(inputId = "tableseason",
                                        label = "Season",
                                        min = 2007, 
                                        max = 2019, 
                                        value = c(2007,2019),
                                        step = 1,
                                        sep = "")),
                        box(width = 4,
                            checkboxGroupInput(inputId = "tableposition",
                                               label = "Position", 
                                               choices = c('GK','D','M','F','None Listed'), 
                                               selected = c('GK','D','M','F','None Listed'),
                                               inline = TRUE)),
                    fluidRow(box(width = 12,
                            DT::DTOutput("salarytable"))))),
                                 
            
            tabItem(tabName = "byposition",
                    fluidRow(box(width = 6,
                            selectizeInput(inputId = "byposclub",
                                            label = "Club",
                                            choices = unique(salaries$club_name),
                                            selected = unique(salaries$club_name),
                                            multiple = TRUE)),
                        box(width = 6,  
                            sliderInput(inputId = "byposseason",
                                            label = "Season",
                                            min = 2007, 
                                            max = 2019, 
                                            value = c(2007,2019),
                                            step = 1,
                                            sep = "")),
                            fluidRow(box(width = 8, height = 400,
                                    plotOutput("positionbarplot")))))
        )
    )
)